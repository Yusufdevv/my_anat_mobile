part of 'connectivity_bloc.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({
    @Default(true) bool connected,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _ConnectivityState;
}
