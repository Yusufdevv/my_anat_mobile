import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HospitalVideo extends StatefulWidget {
  final String videoDescription;
  final String videoUrl;
  final TabController tabController;

  const HospitalVideo({
    required this.videoUrl,
    required this.videoDescription,
    required this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  State<HospitalVideo> createState() => _HospitalVideoState();
}

class _HospitalVideoState extends State<HospitalVideo> {
  late YoutubePlayerController controller;
  late YoutubePlayer player;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        disableDragSeek: true,
        hideControls: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoUrl.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.videos.tr(),
              style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
            ),
            if (widget.videoUrl.isNotEmpty) ...{
              Container(
                padding: const EdgeInsets.only(top: 20),
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.videoUrl.isNotEmpty) ...{
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 140,
                              width: double.maxFinite,
                              child: YoutubePlayerBuilder(
                                player: YoutubePlayer(
                                  controller: controller,
                                ),
                                builder: (context, player) => player,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () async {
                                if (await canLaunchUrlString(widget.videoUrl)) {
                                  await launchUrlString(widget.videoUrl, mode: LaunchMode.externalApplication);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: textColor.withOpacity(0.47),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Container(
                                    height: 36,
                                    width: 36,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: white.withOpacity(0.4)),
                                    child: SvgPicture.asset(AppIcons.playIcon)),
                              ),
                            ),
                          )
                        ],
                      ),
                    },
                  ],
                ),
              ),
            } else
              ...{},
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Видео',
                style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
              ),
            ),
            const SizedBox(height: 16),
            EmptyWidget(
              hasMargin: false,
              hasPadding: false,
              title: LocaleKeys.no_video.tr(),
              content: LocaleKeys.no_video.tr(),
            ),
          ],
        ),
      );
    }
  }
}
