import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screen_brightness/screen_brightness.dart';

part 'brightness_event.dart';
part 'brightness_state.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, BrightnessState> {
  BrightnessBloc() : super(const BrightnessState(brightness: 0)) {
    on<GetInitialBrightness>((event, emit) async {
      final brightness = await ScreenBrightness().current;
      emit(BrightnessState(brightness: brightness));
    });
    on<SetBrightness>((event, emit) async {
      await ScreenBrightness().setScreenBrightness(event.value);
      emit(BrightnessState(brightness: event.value));
    });
  }
}
