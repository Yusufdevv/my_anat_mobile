import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DoctorSingleAppBar extends StatelessWidget {
  final HeaderManagerBloc headerManagerBloc;
  final DoctorSingleEntity doctor;
  const DoctorSingleAppBar(
      {required this.headerManagerBloc, required this.doctor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: headerManagerBloc,
      child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
        builder: (context, state) {
          return SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              bottom: false,
              sliver: SliverAppBar(
                title: state.isHeaderScrolled
                    ? HospitalSingleAppBarBody(
                        shareValue: 'https://anatomica.uz/doctor/${doctor.id}',
                      )
                    : Container(),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
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
                collapsedHeight: 56,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                  ],
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned.fill(
                        bottom: MyFunctions.getDoctorImageBottomPadding(
                            doctor: doctor),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: WImage(
                                      imageUrl: doctor.img.middle,
                                      fit: BoxFit.cover,
                                      height: 277,
                                      onErrorWidget: SvgPicture.asset(
                                          AppIcons.bigImageError),
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
                                    doctor.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: white, fontSize: 22),
                                  ),
                                  const SizedBox(height: 16),
                                  if (doctor
                                      .specialization.title.isNotEmpty) ...{
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 6, 12, 8),
                                      decoration: BoxDecoration(
                                        color: white.withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: primary),
                                      ),
                                      child: Text(
                                        doctor.specialization.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: white),
                                      ),
                                    )
                                  }
                                ],
                              ),
                            ),
                            // Positioned.fill(
                            //   child: Container(
                            //
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Share.share(
                                          'https://anatomica.uz/doctor/${doctor.id}');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: SvgPicture.asset(
                                        AppIcons.share,
                                        color: white,
                                      ),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 16),
                                child: Column(
                                  children: [
                                    if (doctor.address.isNotEmpty) ...[
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.location),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              doctor.address,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(color: textColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                    if (doctor.phoneNumber.isNotEmpty) ...[
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.phone),
                                          const SizedBox(width: 6),
                                          Text(
                                            MyFunctions.formatPhone(
                                                doctor.phoneNumber, false),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(color: textColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                    if (doctor.organization.id != 0) ...{
                                      GestureDetector(
                                        onTap: () {
                                          if (doctor.organization.id != 0) {
                                            Navigator.of(context).push(
                                              fade(
                                                page: HospitalSingleScreen(
                                                  id: doctor.organization.id,
                                                  slug:
                                                      doctor.organization.slug,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 16),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.building),
                                              const SizedBox(width: 6),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            74),
                                                child: Text(
                                                  doctor.organization.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3!
                                                      .copyWith(
                                                          color: textColor),
                                                ),
                                              ),
                                              if (doctor.organization.id !=
                                                  0) ...[
                                                const SizedBox(width: 4),
                                                SvgPicture.asset(
                                                    AppIcons.externalLink)
                                              ]
                                            ],
                                          ),
                                        ),
                                      ),
                                    },
                                    Row(
                                      children: [
                                        Text(
                                          (doctor.rating > 5
                                                  ? 5.0
                                                  : doctor.rating < 0
                                                      ? 0.0
                                                      : doctor.rating)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(color: darkGreen),
                                        ),
                                        const SizedBox(width: 8),
                                        RatingStars(
                                          rate: doctor.rating < 5
                                              ? doctor.rating
                                              : 5,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: WButton(
                                            color: primary,
                                            onTap: () async {
                                              if (await canLaunchUrlString(
                                                  'tel:${doctor.phoneNumber}')) {
                                                await launchUrlString(
                                                    'tel:${doctor.phoneNumber}');
                                              }
                                            },
                                            padding: EdgeInsets.zero,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppIcons.phone,
                                                  height: 20,
                                                  width: 20,
                                                  color: white,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  LocaleKeys.call.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3!
                                                      .copyWith(color: white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: WButton(
                                            color: white,
                                            onTap: () async {
                                              // if (await canLaunchUrlString(doctor.organization.locationUrl)) {
                                              //   await launchUrlString(doctor.organization.locationUrl,
                                              //       mode: LaunchMode.externalApplication);
                                              // }
                                              if (doctor.organization.id != 0) {
                                                if (Platform.isAndroid) {
                                                  if (await MapLauncher
                                                          .isMapAvailable(
                                                              MapType.google) ??
                                                      false) {
                                                    await MapLauncher
                                                        .showDirections(
                                                            mapType:
                                                                MapType.google,
                                                            destination: Coords(
                                                                doctor
                                                                    .organization
                                                                    .latitude,
                                                                doctor
                                                                    .organization
                                                                    .longitude));
                                                  } else {
                                                    if (await canLaunchUrlString(
                                                        doctor.organization
                                                            .locationUrl)) {
                                                      await launchUrlString(
                                                          doctor.organization
                                                              .locationUrl);
                                                    } else {
                                                      throw 'Can not open Google maps';
                                                    }
                                                  }
                                                } else {
                                                  if (await MapLauncher
                                                          .isMapAvailable(
                                                              MapType.apple) ??
                                                      false) {
                                                    await MapLauncher
                                                        .showDirections(
                                                            mapType:
                                                                MapType.apple,
                                                            destination: Coords(
                                                                doctor
                                                                    .organization
                                                                    .latitude,
                                                                doctor
                                                                    .organization
                                                                    .longitude));
                                                  } else {
                                                    if (await canLaunchUrlString(
                                                        doctor.organization
                                                            .locationUrl)) {
                                                      await launchUrlString(
                                                          doctor.organization
                                                              .locationUrl);
                                                    } else {
                                                      throw 'Can not open Google maps';
                                                    }
                                                  }
                                                }
                                              }
                                            },
                                            padding: EdgeInsets.zero,
                                            border: Border.all(color: primary),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppIcons.mapRoute,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  LocaleKeys.get.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3!
                                                      .copyWith(color: primary),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: textFieldColor)
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
