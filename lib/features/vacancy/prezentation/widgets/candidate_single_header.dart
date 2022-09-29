import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class CandidateSingleHeader extends StatelessWidget {
  const CandidateSingleHeader({Key? key, required HeaderManagerBloc headerManagerBloc, required this.candidate})
      : _headerManagerBloc = headerManagerBloc,
        super(key: key);

  final HeaderManagerBloc _headerManagerBloc;
  final CandidateSingleEntity candidate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _headerManagerBloc,
      child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
        builder: (context, headerManageState) {
          return SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              bottom: false,
              sliver: SliverAppBar(
                title: headerManageState.isHeaderScrolled
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                        width: double.infinity,
                        color: darkGreen,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candidate.fullName,
                              style: Theme.of(context).textTheme.headline2!.copyWith(),
                            ),
                            const SizedBox(height: 4),
                            Text(candidate.position.title, style: Theme.of(context).textTheme.headline2!.copyWith())
                          ],
                        ),
                      )
                    : Container(),
                shadowColor: textFieldColor,
                stretch: true,
                expandedHeight: 496,
                titleSpacing: 0,
                leadingWidth: 0,
                elevation: 1,
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: headerManageState.isHeaderScrolled ? darkGreen : Colors.transparent,
                  statusBarIconBrightness: headerManageState.isHeaderScrolled ? Brightness.light : Brightness.dark,
                ),
                collapsedHeight: 56,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.blurBackground],
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned.fill(
                        bottom: 160,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CachedNetworkImage(
                                      height: 277,
                                      imageUrl: candidate.img.middle,
                                      fit: BoxFit.cover,
                                      errorWidget: (_, __, ___) => SvgPicture.asset(AppIcons.bigImageError),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            darkGreen.withOpacity(0),
                                            darkGreen,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 16,
                              right: 16,
                              bottom: 46,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    candidate.fullName,
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: white, fontSize: 22),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
                                    decoration: BoxDecoration(
                                      color: white.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: primary),
                                    ),
                                    child: Text(
                                      candidate.position.title,
                                      style: Theme.of(context).textTheme.headline3!.copyWith(color: white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WScaleAnimation(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: SvgPicture.asset(
                                        AppIcons.chevronRight,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                  WScaleAnimation(
                                    onTap: () {
                                      Share.share('https://anatomica.uicgroup.tech/doctor/${candidate.id}/detail/');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: SvgPicture.asset(AppIcons.share, color: white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.location),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            candidate.address,
                                            style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.phone),
                                        const SizedBox(width: 6),
                                        Text(
                                          candidate.phoneNumber,
                                          style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          candidate.rating.toString(),
                                          style: Theme.of(context).textTheme.headline3!.copyWith(color: darkGreen),
                                        ),
                                        const SizedBox(width: 8),
                                        RatingStars(
                                          rate: candidate.rating,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    WButton(
                                      color: primary,
                                      onTap: () {},
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppIcons.phone, height: 20, width: 20, color: white),
                                          const SizedBox(width: 8),
                                          Text(
                                            LocaleKeys.call.tr(),
                                            style: Theme.of(context).textTheme.headline3!.copyWith(color: white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(height: 0, thickness: 1, color: textFieldColor)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}