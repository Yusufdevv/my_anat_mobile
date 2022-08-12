import 'dart:async';

import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/usecases/get_authentication_status_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetAuthenticationStatusUseCase _statusUseCase;
  late StreamSubscription<AuthenticationStatus> statusSubscription;
  AuthenticationBloc({required GetAuthenticationStatusUseCase statusUseCase})
      : _statusUseCase = statusUseCase,
        super(const AuthenticationState.unauthenticated()) {
    statusSubscription = _statusUseCase.call(NoParams()).listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });
    on<AuthenticationStatusChanged>((event, emit) {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          emit(const AuthenticationState.authenticated());
          break;
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
      }
    });
  }
  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}
