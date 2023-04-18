import 'dart:async';
import 'dart:developer';

import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/auth/domain/usecases/delete_device_id_use_case.dart';
import 'package:anatomica/features/auth/domain/usecases/get_authentication_status_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetAuthenticationStatusUseCase _statusUseCase = GetAuthenticationStatusUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final GetUserDataUseCase _getUserDataUseCase = GetUserDataUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  late final DeleteDeviceIdUseCase _deleteDeviceIdUseCase;
  late StreamSubscription<AuthenticationStatus> statusSubscription;

  AuthenticationBloc() : super(const AuthenticationState.unauthenticated()) {
    _deleteDeviceIdUseCase = DeleteDeviceIdUseCase(repository: serviceLocator<AuthenticationRepositoryImpl>());
    statusSubscription = _statusUseCase.call(NoParams()).listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      log(':::::::::: Authentication exception  ${event.status.name.toString()}  ::::::::::');
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final userData = await _getUserDataUseCase.call(NoParams());
          if (userData.isRight) {
            emit(AuthenticationState.authenticated(userData.right));
          } else {
            await StorageRepository.deleteString('token');
            emit(const AuthenticationState.unauthenticated());
          }
          break;
        case AuthenticationStatus.unauthenticated:
          await _deleteDeviceIdUseCase.call(NoParams());
          await StorageRepository.deleteString('token');
          await StorageRepository.deleteBool('is_purchase_restored');
          emit(
            const AuthenticationState.unauthenticated(),
          );
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
