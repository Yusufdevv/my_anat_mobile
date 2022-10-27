import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_single/hospital_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/image_single_screen.dart';
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

class HospitalSingleAppBar extends StatefulWidget {
  final HeaderManagerBloc headerManagerBloc;
  final PageController pageController;

  const HospitalSingleAppBar({required this.headerManagerBloc, required this.pageController, Key? key})
      : super(key: key);

  @override
  State<HospitalSingleAppBar> createState() => _HospitalSingleAppBarState();
}

class _HospitalSingleAppBarState extends State<HospitalSingleAppBar> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.headerManagerBloc,
      child: BlocBuilder<HeaderManagerBloc, HeaderManagerState>(
        builder: (context, state) {
          return SliverOverlapAbsorber(
            handle: SliverOverlapAbsorberHandle(),
            sliver: SliverSafeArea(
              top: false,
              bottom: false,
              sliver: SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: state.isHeaderScrolled ? Brightness.dark : Brightness.light,
                ),
                title: state.isHeaderScrolled
                    ? BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                        builder: (context, state) {
                          return HospitalSingleAppBarBody(
                            shareValue: 'https://anatomica.uz/organization/${state.hospital.slug}',
                          );
                        },
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
                              child: BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                                builder: (context, state) {
                                  return PageView.builder(
                                    itemBuilder: (context, index) => GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          fade(
                                            page: ImageSingleScreen(
                                              images: state.hospital.images,
                                              index: index,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: WImage(
                                              imageUrl: state.hospital.images[index].middle,
                                              fit: BoxFit.cover,
                                              onErrorColor: Colors.red,
                                              onErrorWidget: SvgPicture.asset(
                                                AppIcons.bigImageError,
                                                fit: BoxFit.cover,
                                              ),
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
                                          ))
                                        ],
                                      ),
                                    ),
                                    itemCount: state.hospital.images.length,
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
                                  BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                                    builder: (context, state) {
                                      return WScaleAnimation(
                                        onTap: () {
                                          Share.share('https://anatomica.uz/organization/${state.hospital.slug}');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: SvgPicture.asset(
                                            AppIcons.share,
                                            color: white,
                                          ),
                                        ),
                                      );
                                    },
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
                        child: BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
                                  builder: (context, state) {
                                    return state.hospital.images.length > 1
                                        ? ImageSliderIndicator(
                                            itemCount: state.hospital.images.length,
                                            currentIndex: currentImage,
                                          )
                                        : const SizedBox();
                                  },
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
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: divider),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: WImage(
                                                    height: 40,
                                                    width: 40,
                                                    imageUrl: state.hospital.logo.middle,
                                                    borderRadius: BorderRadius.circular(6),
                                                    onErrorWidget:
                                                        SvgPicture.asset(AppIcons.smallImageError, fit: BoxFit.cover),
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    state.hospital.title,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style:
                                                        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppIcons.location),
                                                const SizedBox(width: 6),
                                                Expanded(
                                                  child: Text(
                                                    state.hospital.address,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: Theme.of(context).textTheme.headline3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            state.hospital.phoneNumber.isEmpty
                                                ? const SizedBox()
                                                : Container(
                                                    margin: const EdgeInsets.only(bottom: 16),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(AppIcons.phone),
                                                        const SizedBox(width: 6),
                                                        Text(
                                                          MyFunctions.formatPhone(state.hospital.phoneNumber, false),
                                                          style: Theme.of(context).textTheme.headline3,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            Row(
                                              children: [
                                                Text(
                                                  state.hospital.rating.toString(),
                                                  style:
                                                      Theme.of(context).textTheme.headline3!.copyWith(color: darkGreen),
                                                ),
                                                const SizedBox(width: 8),
                                                ...List.generate(
                                                  state.hospital.rating.truncate(),
                                                  (index) => Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: SvgPicture.asset(AppIcons.star),
                                                  ),
                                                ),
                                                ...List.generate(
                                                  5 - state.hospital.rating.truncate(),
                                                  (index) => Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: SvgPicture.asset(AppIcons.star, color: inactiveStar),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: WButton(
                                                    color: primary,
                                                    onTap: () async {
                                                      if (state.hospital.phoneNumbers.isNotEmpty &&
                                                          !state.hospital.phoneNumbers
                                                              .map((e) => e.phoneNumber)
                                                              .toList()
                                                              .contains(state.hospital.phoneNumber)) {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled: true,
                                                          backgroundColor: Colors.transparent,
                                                          builder: (_) => PhonesBottomSheet(
                                                            phones: state.hospital.phoneNumbers
                                                                .map((e) => e.phoneNumber)
                                                                .toList(),
                                                          ),
                                                        );
                                                      } else {
                                                        if (state.hospital.phoneNumber.isNotEmpty) {
                                                          if (await canLaunchUrlString(
                                                              'tel:${state.hospital.phoneNumber}')) {
                                                            await launchUrlString('tel:${state.hospital.phoneNumber}');
                                                          } else {
                                                            throw 'Can not open phone number';
                                                          }
                                                        }
                                                      }
                                                    },
                                                    padding: EdgeInsets.zero,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                                      if (Platform.isAndroid) {
                                                        if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
                                                          await MapLauncher.showDirections(
                                                              mapType: MapType.google,
                                                              destination: Coords(
                                                                  state.hospital.latitude, state.hospital.longitude));
                                                        } else {
                                                          if (await canLaunchUrlString(state.hospital.locationUrl)) {
                                                            await launchUrlString(state.hospital.locationUrl);
                                                          } else {
                                                            throw 'Can not open Google maps';
                                                          }
                                                        }
                                                      } else {
                                                        if (await MapLauncher.isMapAvailable(MapType.apple) ?? false) {
                                                          await MapLauncher.showDirections(
                                                              mapType: MapType.apple,
                                                              destination: Coords(
                                                                  state.hospital.latitude, state.hospital.longitude));
                                                        } else {
                                                          if (await canLaunchUrlString(state.hospital.locationUrl)) {
                                                            await launchUrlString(state.hospital.locationUrl);
                                                          } else {
                                                            throw 'Can not open Google maps';
                                                          }
                                                        }
                                                      }
                                                    },
                                                    padding: EdgeInsets.zero,
                                                    border: Border.all(color: primary),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                      const Divider(height: 0, thickness: 1, color: textFieldColor)
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
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
