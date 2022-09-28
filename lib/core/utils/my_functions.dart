import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_bottom_sheet.dart';
import 'package:flutter/material.dart';
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
      print('$e date parse error');
      return date;
    }
  }

  static Future<Uint8List> getBytesFromCanvas(
      {required int width, required int height, required int placeCount, required BuildContext context}) async {
    final pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.red;
    canvas.drawImage(await getImageInfo(context).then((value) => value.image), const Offset(0, 3), paint);
    TextPainter painter = TextPainter(textDirection: ui.TextDirection.ltr);
    painter.text = TextSpan(
      text: placeCount.toString(),
      style: const TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<ImageInfo> getImageInfo(BuildContext context) async {
    AssetImage assetImage = const AssetImage(AppImages.placeMarkCluster);
    ImageStream stream = assetImage.resolve(createLocalImageConfiguration(context));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, _) {
      return completer.complete(imageInfo);
    }));
    return completer.future;
  }

  static void addHospitals(List<MapHospitalModel> points, BuildContext context, List<MapObject<dynamic>> mapObjects) {
    final placeMarks = points
        .map(
          (e) => PlacemarkMapObject(
              opacity: 1,
              mapId: MapObjectId(e.latitude.toString()),
              point: Point(latitude: e.latitude, longitude: e.longitude),
              onTap: (object, point) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => HospitalSingleBottomSheet(
                    id: e.id,
                    isHospital: true,
                    slug: e.slug,
                    title: e.title,
                    phone: e.phoneNumber,
                    address: e.address,
                    images: e.images.map((e) => e.middle).toList(),
                    location: Point(latitude: e.latitude, longitude: e.longitude),
                    rating: e.rating,
                  ),
                );
              },
              icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(AppImages.placeMarkIcon), scale: 3))),
        )
        .toList();
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
                    width: 48, height: 50, placeCount: cluster.placemarks.length, context: context),
              ),
              scale: 3,
            ),
          ),
        ),
      ),
    );

    mapObjects.clear();
    mapObjects.add(clusterItem);
  }

  static void addDoctors(List<MapDoctorModel> points, BuildContext context, List<MapObject<dynamic>> mapObjects) {
    final placeMarks = points
        .map(
          (e) => PlacemarkMapObject(
              opacity: 1,
              mapId: MapObjectId(e.hospital.longitude.toString()),
              point: Point(latitude: e.hospital.latitude, longitude: e.hospital.longitude),
              onTap: (object, point) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => HospitalSingleBottomSheet(
                    id: e.hospital.id,
                    isHospital: false,
                    slug: '',
                    title: e.hospital.title,
                    phone: e.hospital.phoneNumber,
                    address: e.hospital.address,
                    images: e.hospital.images.map((e) => e.middle).toList(),
                    location: Point(latitude: e.hospital.latitude, longitude: e.hospital.longitude),
                    rating: e.hospital.rating,
                  ),
                );
              },
              icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(AppImages.placeMarkIcon), scale: 3))),
        )
        .toList();
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
                    width: 48, height: 50, placeCount: cluster.placemarks.length, context: context),
              ),
              scale: 3,
            ),
          ),
        ),
      ),
    );
    mapObjects.clear();
    mapObjects.add(clusterItem);
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
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
    return '${phone.substring(4, 6)} ${phone.substring(6, 9)} ${phone.substring(9, 11)} ${phone.substring(11, 13)}';
  }

  static String getPublishedDate(String date) {
    if (Jiffy(date).isSame(DateTime.now(), Units.DAY)) {
      return 'Bugun, ${Jiffy(date).format('HH:mm')}';
    } else if (Jiffy(date).diff(DateTime.now(), Units.DAY) == 1 || Jiffy(date).diff(DateTime.now(), Units.DAY) == -1) {
      return 'Kecha, ${Jiffy(date).format('HH:mm')}';
    } else {
      return '${Jiffy(date).date} ${getMonth(Jiffy(date).month)}, ${Jiffy(date).year}';
    }
  }

  static String getMonth(int month) {
    switch (month) {
      case 1:
        return 'Yanvar';
      case 2:
        return 'Fevral';
      case 3:
        return 'Mart';
      case 4:
        return 'Aprel';
      case 5:
        return 'May';
      case 6:
        return 'Iyun';
      case 7:
        return 'Iyul';
      case 8:
        return 'Avgust';
      case 9:
        return 'Sentyabr';
      case 10:
        return 'Oktyabr';
      case 11:
        return 'Noyabr';
      case 12:
        return 'Dekabr';
      default:
        return '';
    }
  }

  static String getFormatCostFromInt(int price) {
    if (price == 0) {
      return '0 UZS';
    } else {
      final oldCost = StringBuffer(price.toString());
      final newCost = StringBuffer();

      for (var i = 0; i < oldCost.length; i++) {
        if ((oldCost.length - i) % 3 == 0 && i != 0) newCost.write(' ');
        newCost.write(oldCost.toString()[i]);
      }
      return '$newCost UZS';
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
    return 40000 / pow(2, zoom);
  }
}
