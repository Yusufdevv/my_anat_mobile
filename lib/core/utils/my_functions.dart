import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_single_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_bottom_sheet.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract class MyFunctions {
  static const clusterId = MapObjectId('big_cluster_id');

  static String safeDateFormat(String date, String pattern) {
    try {
      return Jiffy(date).format(pattern);
    } catch (e) {
      return date;
    }
  }

  static String getJobType(String jobType) {
    switch (jobType) {
      case 'full_time':
        return 'Полная занятность';
      case 'part_time':
        return 'Неполная занятость';
      default:
        return jobType;
    }
  }

  static String getReadingTime(int seconds) {
    final minutes = seconds ~/ 60;
    final hours = seconds ~/ 3600;
    final second = seconds % 60;
    final StringBuffer buffer = StringBuffer();
    if (hours > 0) {
      buffer.write('$hours ч ');
    }
    if (minutes > 0) {
      buffer.write('$minutes мин. ');
    }
    if (second > 0) {
      buffer.write('$second сек.');
    }
    return buffer.toString();
  }

  static Future<Uint8List> getBytesFromCanvas(
      {required int width,
      required int height,
      required int placeCount,
      required BuildContext context,
      Offset? offset,
      required String image,
      bool shouldAddText = true}) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.red;
    canvas.drawImage(
        await getImageInfo(context, image).then((value) => value.image),
        offset ?? const Offset(0, 3),
        paint);

    if (shouldAddText) {
      TextPainter painter = TextPainter(textDirection: ui.TextDirection.ltr);
      painter.text = TextSpan(
        text: placeCount.toString(),
        style: const TextStyle(fontSize: 100.0, color: Colors.white),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset((width * 0.47) - painter.width * 0.2,
            (height * 0.1) - painter.height * 0.1),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<Uint8List> myLocationCanvas({
    required double radius,
    required BuildContext context,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = primary.withOpacity(0.12);
    final Paint paint2 = Paint();
    paint2.style = PaintingStyle.stroke;
    paint2.color = primary;
    paint2.strokeWidth = 10;
    canvas.drawCircle(Offset(radius + 10, radius + 10), radius, paint);
    canvas.drawCircle(Offset(radius + 10, radius + 10), radius, paint2);

    final img = await pictureRecorder
        .endRecording()
        .toImage((2 * radius + 20).toInt(), (2 * radius + 20).toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<ImageInfo> getImageInfo(
      BuildContext context, String image) async {
    AssetImage assetImage = AssetImage(image);
    ImageStream stream =
        assetImage.resolve(createLocalImageConfiguration(context));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, _) {
      return completer.complete(imageInfo);
    }));
    return completer.future;
  }

  static Future<MapObject<dynamic>> getMyPoint(
      Point point, BuildContext context) async {
    final myIconData = await getBytesFromCanvas(
        placeCount: 0,
        image: AppImages.myPlacemark,
        width: 170,
        //offset: const Offset(0, -30),
        height: 410,
        context: context,
        shouldAddText: false);
    final myPoint = PlacemarkMapObject(
        opacity: 1,
        mapId: const MapObjectId('my-point'),
        point: point,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          scale: 0.6,
          image: BitmapDescriptor.fromBytes(myIconData),
        )));
    return myPoint;
  }

  static Future<void> addHospitals(
      List<MapHospitalModel> points,
      BuildContext context,
      List<MapObject<dynamic>> mapObjects,
      YandexMapController controller,
      Point point,
      double accuracy) async {
    final iconData = await getBytesFromCanvas(
      placeCount: 0,
      image: AppImages.placeMarkIcon,
      width: 170,
      //offset: const Offset(0, -30),
      height: 410,
      context: context,
      shouldAddText: false,
    );
    print('klinik => ${points.length}');
    final placeMarks = points.map((e) {
      return PlacemarkMapObject(
        opacity: 1,
        mapId: MapObjectId(e.latitude.toString()),
        point: Point(
          latitude: e.latitude,
          longitude: e.longitude,
        ),
        onTap: (object, point) async {
          // element = e;
          print('element => ${e.title}');
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: e.latitude,
                  longitude: e.longitude,
                ),
                zoom: 15,
              ),
            ),
          );

          final result = await showModalBottomSheet(
            barrierColor: Colors.transparent,
            context: context,
            // isScrollControlled: true,
            useRootNavigator: true,
            enableDrag: false,
            backgroundColor: Colors.transparent,
            builder: (context) {
              context
                  .read<LoginSignUpBloc>()
                  .add(HideMainTabEvent(showMainTab: false));
              return MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: PageView.builder(
                    controller: PageController(
                      initialPage: points.indexOf(e),
                      viewportFraction: 0.9,
                    ),
                    onPageChanged: (value) {
                      controller.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: Point(
                                latitude: points[value].latitude,
                                longitude: points[value].longitude,
                              ),
                              zoom: 15,
                            ),
                          ),
                          animation: const MapAnimation(
                              duration: 1, type: MapAnimationType.linear));
                    },
                    itemCount: points.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16, left: 8),
                        child: HospitalSingleBottomSheet(
                          id: points[index].id,
                          isHospital: true,
                          slug: points[index].slug,
                          title: points[index].title,
                          phone: points[index].phoneNumber,
                          logo: points[index].logo.middle,
                          address: points[index].address,
                          images: points[index]
                              .images
                              .map((e) => e.middle)
                              .toList(),
                          location: Point(
                            latitude: points[index].latitude,
                            longitude: points[index].longitude,
                          ),
                          rating: points[index].rating,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
          context
              .read<LoginSignUpBloc>()
              .add(HideMainTabEvent(showMainTab: true));
        },
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            scale: 0.6,
            image: BitmapDescriptor.fromBytes(iconData),
          ),
        ),
      );
    }).toList();
    final myPoint = await getMyPoint(point, context);
    final clusterItem = ClusterizedPlacemarkCollection(
      mapId: clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterTap: (collection, cluster) {},
      onTap: (collection, point) {},
      onClusterAdded: (collection, cluster) async => cluster.copyWith(
        appearance: cluster.appearance.copyWith(
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(
                await getBytesFromCanvas(
                  image: AppImages.hospitalCluster,
                  width: 170,
                  height: 410,
                  placeCount: cluster.placemarks.length,
                  context: context,
                  shouldAddText: true,
                ),
              ),
              scale: 0.6,
            ),
          ),
        ),
      ),
    );

    mapObjects.clear();
    mapObjects.addAll([clusterItem, myPoint]);
  }

  static void addDoctors(
      List<MapDoctorModel> points,
      BuildContext context,
      List<MapObject<dynamic>> mapObjects,
      YandexMapController controller,
      Point point,
      double accuracy) async {
    final iconData = await getBytesFromCanvas(
        placeCount: 0,
        image: AppImages.doctorMark,
        width: 170,
        //offset: const Offset(0, -30),
        height: 410,
        context: context,
        shouldAddText: false);
    final placeMarks = points
        .map(
          (e) => PlacemarkMapObject(
              opacity: 1,
              mapId: MapObjectId(e.doctor.longitude.toString()),
              point: Point(
                  latitude: e.doctor.latitude, longitude: e.doctor.longitude),
              onTap: (object, point) async {
                controller.moveCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: Point(
                            latitude: e.doctor.latitude,
                            longitude: e.doctor.longitude),
                        zoom: 15)));
                final result = await showModalBottomSheet(
                    context: context,
                    // isScrollControlled: true,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      context
                          .read<LoginSignUpBloc>()
                          .add(HideMainTabEvent(showMainTab: false));
                      return MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: PageView.builder(
                              controller: PageController(
                                initialPage: points.indexOf(e),
                                viewportFraction: 0.9,
                              ),
                              physics: const BouncingScrollPhysics(),
                              onPageChanged: (value) {
                                controller.moveCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: Point(
                                          latitude:
                                              points[value].doctor.latitude,
                                          longitude:
                                              points[value].doctor.longitude,
                                        ),
                                        zoom: 15,
                                      ),
                                    ),
                                    animation: const MapAnimation(
                                        duration: 1,
                                        type: MapAnimationType.linear));
                              },
                              itemCount: points.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 16, left: 8),
                                  child: DoctorSingleBottomSheet(
                                    id: points[index].doctor.id,
                                    isHospital: false,
                                    specialization:
                                        points[index].doctor.position,
                                    slug: '',
                                    hospital: points[index].doctor.fullName,
                                    title: points[index].doctor.fullName,
                                    //  todo which phone
                                    phone: points[index].doctor.phoneNumbers[0]
                                        [0],
                                    address: points[index].doctor.address,
                                    images: [points[index].doctor.image.middle],
                                    location: Point(
                                        latitude: points[index].doctor.latitude,
                                        longitude:
                                            points[index].doctor.longitude),
                                    rating: points[index].doctor.rating,
                                  ),
                                );
                              }),
                        ),
                      );
                    });
                context
                    .read<LoginSignUpBloc>()
                    .add(HideMainTabEvent(showMainTab: true));
              },
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(AppImages.doctorMark),
                  scale: 0.6))),
        )
        .toList();
    final myPoint = await getMyPoint(point, context);
    final clusterItem = ClusterizedPlacemarkCollection(
      mapId: clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterAdded: (collection, cluster) async => cluster.copyWith(
        appearance: cluster.appearance.copyWith(
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(
                await getBytesFromCanvas(
                    width: 170,
                    height: 410,
                    placeCount: cluster.placemarks.length,
                    context: context,
                    image: AppImages.doctorCluster),
              ),
              scale: 0.6,
            ),
          ),
        ),
      ),
    );
    mapObjects.clear();
    mapObjects.addAll([clusterItem, myPoint]);
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const ParsingException(
          errorMessage: LocaleKeys.location_services_disabled);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ParsingException(
            errorMessage: LocaleKeys.location_permission_disabled);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ParsingException(
            errorMessage: LocaleKeys.location_permission_disabled);
      } else if (permission == LocationPermission.deniedForever) {
        throw const ParsingException(
            errorMessage: LocaleKeys.location_permission_permanent_disabled);
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  static String getFormattedTimerTime(int ticks) {
    final buffer = StringBuffer();
    final minutes = (ticks / 60).floor();
    if (minutes < 10) {
      buffer.write('0');
    }
    buffer.write(minutes);
    buffer.write(':');
    final seconds = (ticks % 60).floor();
    if (seconds < 10) {
      buffer.write('0');
    }
    buffer.write(seconds);
    return buffer.toString();
  }

  static String formatBirthDate(DateTime? date) {
    return date != null
        ? '${date.day < 10 ? '0${date.day}' : date.day}.${date.month < 10 ? '0${date.month}' : date.month}.${date.year}'
        : '';
  }

  static String formatPhone(String phone, [bool showBracket = true]) {
    if (phone.length == 13) {
      return '${phone.substring(0, 4)} ${showBracket ? '(' : ''}${phone.substring(4, 6)}${showBracket ? ')' : ''} ${phone.substring(6, 9)}-${phone.substring(9, 11)}-${phone.substring(11, 13)}';
    } else {
      return phone;
    }
  }

  static String formatPhoneForInput(String phone) {
    if (phone.length >= 13) {
      return '${phone.substring(4, 6)} ${phone.substring(6, 9)} ${phone.substring(9, 11)} ${phone.substring(11, 13)}';
    } else {
      return phone;
    }
  }

  static String getPublishedDate(String date) {
    if (Jiffy(date).isSame(DateTime.now(), Units.DAY)) {
      return '${LocaleKeys.today.tr()}, ${Jiffy(date).format('HH:mm')}';
    } else if (Jiffy(date).diff(DateTime.now(), Units.DAY) == 1 ||
        Jiffy(date).diff(DateTime.now(), Units.DAY) == -1) {
      return '${LocaleKeys.yesterday.tr()}, ${Jiffy(date).format('HH:mm')}';
    } else {
      return '${Jiffy(date).date} ${getMonth(Jiffy(date).month)}, ${Jiffy(date).year}';
    }
  }

  static String getMonth(int month) {
    switch (month) {
      case 1:
        return LocaleKeys.january.tr();
      case 2:
        return LocaleKeys.february.tr();
      case 3:
        return LocaleKeys.march.tr();
      case 4:
        return LocaleKeys.april.tr();
      case 5:
        return LocaleKeys.may.tr();
      case 6:
        return LocaleKeys.june.tr();
      case 7:
        return LocaleKeys.july.tr();
      case 8:
        return LocaleKeys.august.tr();
      case 9:
        return LocaleKeys.september.tr();
      case 10:
        return LocaleKeys.october.tr();
      case 11:
        return LocaleKeys.november.tr();
      case 12:
        return LocaleKeys.december.tr();
      default:
        return '';
    }
  }

  static String getFormatCostFromInt(int price, [bool showCurrency = true]) {
    if (price == 0) {
      return '0 UZS';
    } else {
      final oldCost = StringBuffer(price.toString());
      final newCost = StringBuffer();

      for (var i = 0; i < oldCost.length; i++) {
        if ((oldCost.length - i) % 3 == 0 && i != 0) newCost.write(' ');
        newCost.write(oldCost.toString()[i]);
      }
      return '$newCost${showCurrency ? ' UZS' : ''}';
    }
  }

  static String getPriceFormat(int price) {
    if (price == 0) {
      return '0';
    } else {
      final oldPrice = StringBuffer(price.toString());
      final newPrice = StringBuffer();
      for (var i = 0; i < oldPrice.length; i++) {
        if ((oldPrice.length - i) % 3 == 0 && i != 0) newPrice.write('. ');
        newPrice.write(oldPrice.toString()[i]);
      }
      return newPrice.toString();
    }
  }

  static String getPriceFormat2(int price) {
    if (price == 0) {
      return '0';
    } else {
      final oldPrice = StringBuffer(price.toString());
      final newPrice = StringBuffer();
      for (var i = 0; i < oldPrice.length; i++) {
        if ((oldPrice.length - i) % 3 == 0 && i != 0) newPrice.write(' ');
        newPrice.write(oldPrice.toString()[i]);
      }
      return newPrice.toString();
    }
  }

  static PaginatorStatus formzStatusToPaginatorStatus(FormzStatus status) {
    switch (status) {
      case FormzStatus.submissionSuccess:
        return PaginatorStatus.PAGINATOR_SUCCESS;
      case FormzStatus.submissionInProgress:
        return PaginatorStatus.PAGINATOR_LOADING;
      case FormzStatus.submissionFailure:
        return PaginatorStatus.PAGINATOR_ERROR;
      default:
        return PaginatorStatus.PAGINATOR_INITIAL;
    }
  }

  static String getFormattedDuration(int durationInSeconds) {
    final hoursInString =
        '${(durationInSeconds / 3600).floor() < 10 ? '0${(durationInSeconds / 3600).floor()}' : (durationInSeconds / 3600).floor()}';
    final minutesInString =
        '${(durationInSeconds / 60).floor() < 10 ? '0${(durationInSeconds / 60).floor()}' : (durationInSeconds / 60).floor()}';
    final secondsInString =
        '${(durationInSeconds % 60) < 10 ? '0${(durationInSeconds % 60)}' : (durationInSeconds % 60)}';
    return '$hoursInString:$minutesInString:$secondsInString';
  }

  static double getRadiusFromZoom(double zoom) {
    return 40000 / pow(2, zoom) > 1 ? 40000 / pow(2, zoom) : 1;
  }
}
