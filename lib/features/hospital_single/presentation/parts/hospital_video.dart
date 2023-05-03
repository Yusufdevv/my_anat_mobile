import 'dart:developer';

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
  final List<String> videos;

  const HospitalVideo({
    required this.videoUrl,
    required this.videoDescription,
    required this.tabController,
    required this.videos,
    Key? key,
  }) : super(key: key);

  @override
  State<HospitalVideo> createState() => _HospitalVideoState();
}

class _HospitalVideoState extends State<HospitalVideo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoUrl.isNotEmpty || widget.videos.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: white,
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.videos.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: textColor),
            ),
            if (widget.videos.isNotEmpty)
              ...List.generate(
                widget.videos.length,
                (i) => GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrlString(widget.videos[i])) {
                      await launchUrlString(widget.videos[i],
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 140,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          YoutubePlayer.getThumbnail(
                            videoId: YoutubePlayer.convertUrlToId(
                                    widget.videos[i]) ??
                                '',
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white.withOpacity(0.4),
                        ),
                        child: SvgPicture.asset(AppIcons.playIcon),
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.videoUrl.isNotEmpty) ...{
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrlString(widget.videoUrl)) {
                    await launchUrlString(widget.videoUrl,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 140,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        YoutubePlayer.getThumbnail(
                          videoId:
                              YoutubePlayer.convertUrlToId(widget.videoUrl) ??
                                  '',
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white.withOpacity(0.4),
                      ),
                      child: SvgPicture.asset(AppIcons.playIcon),
                    ),
                  ),
                ),
              )
            },
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
                LocaleKeys.videos.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: textColor),
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
