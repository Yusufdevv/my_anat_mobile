import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/doctor_single/presentation/doctor_single_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart' as map_launcher;
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DoctorSingleBottomSheet extends StatelessWidget {
  final String title;
  final String slug;
  final int id;
  final List<String> images;
  final String address;
  final String phone;
  final String specialization;
  final String hospital;
  final Point location;
  final double rating;
  final double deviceWidth;
  final bool isHospital;

  const DoctorSingleBottomSheet(
      {required this.title,
      required this.address,
      required this.deviceWidth,
      required this.images,
      required this.specialization,
      required this.slug,
      required this.isHospital,
      required this.hospital,
      required this.rating,
      required this.phone,
      required this.location,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushReplacement(
                        fade(
                          page: DoctorSingleScreen(
                            id: id,
                          ),
                        ),
                      );
                    },
                    child: WImage(
                      borderRadius: BorderRadius.circular(8),
                      imageUrl: images[0],
                      fit: BoxFit.cover,
                      width: 82,
                      height: 100,
                      onErrorWidget: Container(
                        width: deviceWidth - 24,
                        alignment: Alignment.center,
                        color: errorImageBackground,
                        child: SvgPicture.asset(
                          AppIcons.logo,
                          height: 100,
                          width: 82,
                          color: textFieldColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          specialization,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall,
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
                    MyFunctions.formatPhone(phone, false),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.sky),
                  const SizedBox(width: 6),
                  Text(
                    hospital,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: darkGreen),
                  ),
                  const SizedBox(width: 8),
                  ...List.generate(
                    rating.toInt(),
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(AppIcons.star),
                    ),
                  ),
                  ...List.generate(
                    5 - rating.toInt(),
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
                      onTap: () {
                        if (isHospital) {
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                            fade(
                              page: HospitalSingleScreen(
                                slug: slug,
                                id: id,
                              ),
                            ),
                          );
                        } else {
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                            fade(
                              page: DoctorSingleScreen(
                                id: id,
                              ),
                            ),
                          );
                        }
                      },
                      text: LocaleKeys.more.tr(),
                      textColor: white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  WButton(
                    width: 40,
                    color: white,
                    onTap: () async {
                      Navigator.of(context).pop();
                      if (Platform.isAndroid) {
                        if (await map_launcher.MapLauncher.isMapAvailable(map_launcher.MapType.google) ?? false) {
                          await map_launcher.MapLauncher.showDirections(
                              mapType: map_launcher.MapType.google,
                              destination: map_launcher.Coords(location.latitude, location.longitude));
                        } else {
                          var uri = Uri.parse('geo:${location.latitude},${location.longitude}');
                          await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'can not open this location';
                        }
                      } else {
                        if (await map_launcher.MapLauncher.isMapAvailable(map_launcher.MapType.apple) ?? false) {
                          await map_launcher.MapLauncher.showDirections(
                              mapType: map_launcher.MapType.apple,
                              destination: map_launcher.Coords(location.latitude, location.longitude));
                        } else {
                          var uri = Uri.parse('geo:${location.latitude},${location.longitude}');
                          await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'can not open this location';
                        }
                      }
                      // var uri = Uri.parse('geo:${location.latitude},${location.longitude}');
                      // await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'can not open this location';
                    },
                    border: Border.all(color: primary),
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(AppIcons.mapRoute),
                  ),
                  const SizedBox(width: 12),
                  WButton(
                    width: 40,
                    color: white,
                    onTap: () async {
                      var uri = Uri.parse('tel:$phone');
                      await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'can not open phone';
                    },
                    border: Border.all(color: primary),
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      AppIcons.boldPhone,
                      height: 17,
                      width: 17,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        WScaleAnimation(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 28,
            width: 28,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: divider),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.close),
          ),
        )
      ],
    );
  }
}
