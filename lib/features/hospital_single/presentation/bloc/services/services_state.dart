part of 'services_bloc.dart';

@Freezed()
class ServicesState with _$ServicesState {
  factory ServicesState({
    @Default(FormzStatus.pure) FormzStatus status ,
    @Default([]) List<SingleServiceModel> services ,
    @Default('') String next ,
    @Default(0) int count ,
  })=_ServicesState;
}

