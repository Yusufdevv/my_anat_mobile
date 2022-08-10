import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_controller_event.dart';
part 'map_controller_state.dart';

class MapControllerBloc extends Bloc<MapControllerEvent, MapControllerState> {
  MapControllerBloc() : super(const MapControllerState(points: [])) {
    on<GetPoints>((event, emit) {
      emit(
        const MapControllerState(
          points: [
            Point(latitude: 41.2965107, longitude: 69.2744613),
            Point(latitude: 41.2966107, longitude: 69.2745613),
            Point(latitude: 41.2967107, longitude: 69.2746613),
            Point(latitude: 41.2968107, longitude: 69.2747613),
            Point(latitude: 41.2969107, longitude: 69.2748613),
            Point(latitude: 41.2960107, longitude: 69.2749613),
          ],
        ),
      );
    });
    on<GetDoctorPoints>((event, emit) {
      emit(
        const MapControllerState(
          points: [
            Point(latitude: 41.2955107, longitude: 69.2734613),
            Point(latitude: 41.2956107, longitude: 69.2735613),
            Point(latitude: 41.2957107, longitude: 69.2736613),
            Point(latitude: 41.2958107, longitude: 69.2737613),
            Point(latitude: 41.2959107, longitude: 69.2738613),
            Point(latitude: 41.2950107, longitude: 69.2739613),
          ],
        ),
      );
    });
  }
}
