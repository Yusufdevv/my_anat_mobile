import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPosition extends Point {
  final double lat;
  final double long;
  final int? zoomLevel;
  const MapPosition({required this.lat,required this.long,required this.zoomLevel}):super(latitude: lat,longitude: long,);
}