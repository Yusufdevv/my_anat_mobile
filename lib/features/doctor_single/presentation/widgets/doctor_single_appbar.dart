import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/doctor_single/presentation/blocs/doctor_single_bloc/doctor_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/image_single_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/big_image_error_widget.dart';
import 'package:anatomica/features/map/presentation/blocs/header_manager_bloc/header_manager_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/features/map/presentation/widgets/image_slider_indicator.dart';
import 'package:anatomica/features/map/presentation/widgets/phones_bottom_sheet.dart';
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

class DoctorSingleAppBar extends StatefulWidget {
  final HeaderManagerBloc headerManagerBloc;
  final DoctorSingleEntity doctor;
  final PageController pageController;

  const DoctorSingleAppBar(
      {required this.headerManagerBloc,
      required this.pageController,
      required this.doctor,
      Key? key})
      : super(key: key);

  @override
  State<DoctorSingleAppBar> createState() => _DoctorSingleAppBarState();
}

class _DoctorSingleAppBarState extends State<DoctorSingleAppBar> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.headerManagerBloc,
      child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
        builder: (context, state) {
          return SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: state.isHeaderScrolled
                  ? HospitalSingleAppBarBody(
                      shareValue:
                          'https://anatomica.uz/doctor/${widget.doctor.id}',
                    )
                  : Container(),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness:
                    state.isHeaderScrolled ? Brightness.dark : Brightness.light,
              ),
              shadowColor: textFieldColor,
              stretch: true,
              expandedHeight: 600,
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
                      bottom: 180,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: BlocBuilder<DoctorSingleBloc,
                                DoctorSingleState>(
                              builder: (context, state) {
                                if (state.doctorSingle.images.isEmpty &&
                                    state.doctorSingle.img == ImageEntity()) {
                                  return const BigImageErrorWidget();
                                }
                                return PageView.builder(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        fade(
                                          page: ImageSingleScreen(
                                            images: [
                                              state.doctorSingle.img,
                                              ...state.doctorSingle.images
                                            ],
                                            index: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: WImage(
                                            imageUrl: [
                                              state.doctorSingle.img,
                                              ...state.doctorSingle.images
                                            ][index]
                                                .middle,
                                            fit: BoxFit.cover,
                                            onErrorColor: Colors.red,
                                            onErrorWidget:
                                                const BigImageErrorWidget(),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  textColor.withOpacity(0.48),
                                                  textColor.withOpacity(0.24),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          top: 120,
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
                                  itemCount: [
                                    state.doctorSingle.img,
                                    ...state.doctorSingle.images
                                  ].length,
                                  controller: widget.pageController,
                                  onPageChanged: (index) {
                                    setState(() {
                                      currentImage = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WScaleAnimation(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SvgPicture.asset(
                                      AppIcons.chevronRight,
                                      color: widget.doctor.img.middle.isNotEmpty
                                          ? white
                                          : textSecondary,
                                    ),
                                  ),
                                ),
                                WScaleAnimation(
                                  onTap: () {
                                    Share.share(
                                        'https://anatomica.uz/doctor/${widget.doctor.id}');
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
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.doctor.fullName,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: white, fontSize: 22),
                                  ),
                                ),
                              ),
                              BlocBuilder<DoctorSingleBloc, DoctorSingleState>(
                                builder: (context, state) {
                                  return [
                                            state.doctorSingle.img,
                                            ...state.doctorSingle.images
                                          ].length >
                                          1
                                      ? ImageSliderIndicator(
                                          itemCount: [
                                            state.doctorSingle.img,
                                            ...state.doctorSingle.images
                                          ].length,
                                          currentIndex: currentImage,
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              color: white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    color: white,
                                  ),
                                  width: double.maxFinite,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Visibility(
                                              visible: widget.doctor
                                                  .specializations.isNotEmpty,
                                              child: Wrap(
                                                children: [
                                                  SvgPicture.asset(
                                                      AppIcons.stethoscope),
                                                  const SizedBox(width: 6),
                                                  for (int i = 0;
                                                      i <
                                                          widget
                                                              .doctor
                                                              .specializations
                                                              .length;
                                                      i++)
                                                    Text(
                                                      '${widget.doctor.specializations[i].title} ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color: primary),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Visibility(
                                              visible: widget.doctor.position
                                                  .title.isNotEmpty,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(AppIcons
                                                          .buildingHospital),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        widget.doctor.position
                                                            .title,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall!
                                                            .copyWith(
                                                                color: black),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                ],
                                              ),
                                            ),
                                            if (widget
                                                .doctor.address.isNotEmpty) ...[
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      AppIcons.location),
                                                  const SizedBox(width: 6),
                                                  Expanded(
                                                    child: Text(
                                                      widget.doctor.address,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color: textColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                            Wrap(
                                              children: [
                                                if (widget.doctor.organizations
                                                    .isNotEmpty) ...{
                                                  ...List.generate(
                                                    widget.doctor.organizations
                                                        .length,
                                                    (index) => GestureDetector(
                                                      behavior: HitTestBehavior
                                                          .opaque,
                                                      onTap: () {
                                                        if (widget
                                                                .doctor
                                                                .organizations[
                                                                    index]
                                                                .id !=
                                                            0) {
                                                          Navigator.of(context)
                                                              .push(
                                                            fade(
                                                              page:
                                                                  HospitalSingleScreen(
                                                                id: widget
                                                                    .doctor
                                                                    .organizations[
                                                                        index]
                                                                    .id,
                                                                slug: widget
                                                                    .doctor
                                                                    .organizations[
                                                                        index]
                                                                    .slug,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 10,
                                                          bottom: 16,
                                                          right: 12,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            SvgPicture.asset(
                                                                AppIcons
                                                                    .building),
                                                            const SizedBox(
                                                                width: 6),
                                                            ConstrainedBox(
                                                              constraints: BoxConstraints(
                                                                  maxWidth: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      74),
                                                              child: Text(
                                                                widget
                                                                    .doctor
                                                                    .organizations[
                                                                        index]
                                                                    .name,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displaySmall!
                                                                    .copyWith(
                                                                        color:
                                                                            textColor),
                                                              ),
                                                            ),
                                                            if (widget
                                                                    .doctor
                                                                    .organizations[
                                                                        index]
                                                                    .id !=
                                                                0) ...[
                                                              const SizedBox(
                                                                  width: 4),
                                                              SvgPicture.asset(
                                                                  AppIcons
                                                                      .externalLink)
                                                            ]
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                },
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  (widget.doctor.rating > 5
                                                          ? 5.0
                                                          : widget.doctor
                                                                      .rating <
                                                                  0
                                                              ? 0.0
                                                              : widget.doctor
                                                                  .rating)
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(
                                                          color: darkGreen),
                                                ),
                                                const SizedBox(width: 8),
                                                RatingStars(
                                                  rate: widget.doctor.rating < 5
                                                      ? widget.doctor.rating
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
                                                      if (widget
                                                              .doctor
                                                              .phoneNumbers
                                                              .isNotEmpty &&
                                                          !widget.doctor
                                                              .phoneNumbers
                                                              .map((e) =>
                                                                  e.phoneNumber)
                                                              .toList()
                                                              .contains(widget
                                                                  .doctor
                                                                  .phoneNumber)) {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          builder: (_) =>
                                                              PhonesBottomSheet(
                                                            phones: widget
                                                                .doctor
                                                                .phoneNumbers
                                                                .map((e) => e
                                                                    .phoneNumber)
                                                                .toList(),
                                                          ),
                                                        );
                                                      } else {
                                                        if (widget
                                                            .doctor
                                                            .phoneNumber
                                                            .isNotEmpty) {
                                                          if (await canLaunchUrlString(
                                                              'tel://${widget.doctor.phoneNumber}')) {
                                                            await launchUrlString(
                                                                'tel://${widget.doctor.phoneNumber}');
                                                          } else {
                                                            throw 'Can not open phone number';
                                                          }
                                                        }
                                                      }
                                                    },
                                                    padding: EdgeInsets.zero,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppIcons.phone,
                                                          height: 20,
                                                          width: 20,
                                                          color: white,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Text(
                                                          LocaleKeys.call.tr(),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displaySmall!
                                                              .copyWith(
                                                                  color: white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Visibility(
                                                  visible: widget.doctor
                                                              .latitude !=
                                                          0 &&
                                                      widget.doctor.longitude !=
                                                          0,
                                                  child: Expanded(
                                                    child: WButton(
                                                      color: white,
                                                      onTap: () async {
                                                        if (Platform
                                                            .isAndroid) {
                                                          if (await MapLauncher
                                                                  .isMapAvailable(
                                                                      MapType
                                                                          .google) ??
                                                              false) {
                                                            await MapLauncher.showDirections(
                                                                mapType: MapType
                                                                    .google,
                                                                destination: Coords(
                                                                    widget
                                                                        .doctor
                                                                        .latitude,
                                                                    widget
                                                                        .doctor
                                                                        .longitude));
                                                          } else {
                                                            // TODO widget.doctoc.address o'rniga widget.doctor.locationUrl qo'yilishi kerak,
                                                            // TODO backendda bo'lmaganligi uchun vaqtincha shunaqa qoldirib ketildi
                                                            if (await canLaunchUrlString(
                                                                widget.doctor
                                                                    .address)) {
                                                              await launchUrlString(
                                                                  widget.doctor
                                                                      .address);
                                                            } else {
                                                              throw 'Can not open Google maps';
                                                            }
                                                          }
                                                        } else {
                                                          if (await MapLauncher
                                                                  .isMapAvailable(
                                                                      MapType
                                                                          .apple) ??
                                                              false) {
                                                            await MapLauncher.showDirections(
                                                                mapType: MapType
                                                                    .apple,
                                                                destination: Coords(
                                                                    widget
                                                                        .doctor
                                                                        .latitude,
                                                                    widget
                                                                        .doctor
                                                                        .longitude));
                                                          } else {
                                                            if (await canLaunchUrlString(
                                                                widget.doctor
                                                                    .address)) {
                                                              await launchUrlString(
                                                                  widget.doctor
                                                                      .address);
                                                            } else {
                                                              throw 'Can not open Google maps';
                                                            }
                                                          }
                                                        }
                                                      },
                                                      padding: EdgeInsets.zero,
                                                      border: Border.all(
                                                          color: primary),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppIcons.mapRoute,
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          Text(
                                                            LocaleKeys.get.tr(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall!
                                                                .copyWith(
                                                                    color:
                                                                        primary),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: textFieldColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
