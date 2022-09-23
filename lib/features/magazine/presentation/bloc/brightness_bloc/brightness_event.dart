part of 'brightness_bloc.dart';

@immutable
abstract class BrightnessEvent {}

class SetBrightness extends BrightnessEvent {
  final double value;
  SetBrightness({required this.value});
}

class GetInitialBrightness extends BrightnessEvent {}
