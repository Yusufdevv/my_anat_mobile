import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class AuthenticationDataSource {
  Future<void> login({required String username, required String password});
  Future<UserModel> getUserData();
  Future<bool> checkUserName({required String username});
  Future<String> createNewState();
  Future<String> submitNameUsername(
      {required String username,
      required String fullName,
      required String stateId});
  Future<String> submitPhone({required String phone, required String stateId});
  Future<String> submitEmail({required String email, required String stateId});
  Future<String> submitChangedPhone(
      {required String phone, required String stateId});
  Future<String> submitChangedEmail(
      {required String email, required String stateId});
  Future<String> confirmCode({required String code, required String stateId});
  Future<String> submitPassword(
      {required String password,
      required String confirmPassword,
      required String stateId});
  Future<void> resendCode({required String stateId});
  Future<void> sendDeviceId();
  Future<void> deleteDeviceId();
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final Dio _dio;
  AuthenticationDataSourceImpl(this._dio);

  @override
  Future<void> sendDeviceId() async {
    try {
      String? deviceId = StorageRepository.getString(StoreKeys.deviceId);
      print("device id:$deviceId");
      // String? deviceId = await PlatformDeviceId.getDeviceId;
      if (deviceId.isEmpty) return;
      final response = await _dio.post(
        '/notifications/device-id/',
        data: {"device_id": deviceId},
        options: Options(
          headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        throw const ServerException(statusCode: 404, errorMessage: "Error");
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> deleteDeviceId() async {
    try {
      // String? deviceId = await PlatformDeviceId.getDeviceId;
      String? deviceId = StorageRepository.getString(StoreKeys.deviceId);

      print("device id:$deviceId");
      if (deviceId.isEmpty) return;
      final response = await _dio.delete(
        '/notifications/device-id/delete/',
        data: {"device_id": deviceId},
        options: Options(
          headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        throw const ServerException(statusCode: 404, errorMessage: "Error");
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> login(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post('/auth/token/', data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        await StorageRepository.putString(
            StoreKeys.token, response.data[StoreKeys.token]);
        // await sendDeviceId();
      } else if (response.statusCode != null &&
          response.statusCode! >= 400 &&
          response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.incorrect_login)
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      final response = await _dio.get('/user/profile/',
          options: Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
      } else {
        await StorageRepository.deleteString(StoreKeys.token);
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.error_while_get_user)
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<bool> checkUserName({required String username}) async {
    if (username.isNotEmpty) {
      try {
        final response = await _dio.get('/auth/check/username/$username');
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return true;
        } else if (response.statusCode != null &&
            response.statusCode! >= 400 &&
            response.statusCode! < 500) {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.login_busy)
                    .toString());
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(
          errorMessage: LocaleKeys.login_cannot_be_empty);
    }
  }

  @override
  Future<String> createNewState() async {
    try {
      final response = await _dio.post('/auth/registration/new-state/');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data['state_id'] as String;
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<String> submitNameUsername(
      {required String username,
      required String fullName,
      required String stateId}) async {
    if (fullName.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "full_name": fullName,
          "login": username,
        });
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? ((response.data as Map).values.first is Map)
                            ? ((response.data as Map).values.first as Map)
                                .values
                                .first
                            : (response.data as Map).values.first
                        : LocaleKeys.name_login_error)
                    .toString());
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(
          errorMessage: LocaleKeys.name_cannot_be_empty);
    }
  }

  @override
  Future<String> confirmCode(
      {required String code, required String stateId}) async {
    if (code.length >= 6) {
      try {
        final response = await _dio.post('/auth/registration/',
            data: {"state_id": stateId, "code": code});
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          final errorMessage;
          if ((response.data as Map).values.isNotEmpty) {
            if ((response.data as Map).values.first is Map) {
              if (((response.data as Map).values.first as Map).values.first
                  is List) {
                errorMessage = (((response.data as Map).values.first as Map)
                        .values
                        .first as List)
                    .first;
              } else {
                errorMessage =
                    ((response.data as Map).values.first as Map).values.first;
              }
            } else if ((response.data as Map).values.first is List) {
              errorMessage =
                  ((response.data as Map).values.first as List).first;
            } else {
              errorMessage = (response.data as Map).values.first;
            }
          } else {
            errorMessage = LocaleKeys.confirmation_error.tr();
          }
          if (response.data is Map) {
            throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: errorMessage.toString(),
            );
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(errorMessage: LocaleKeys.fill_all_fields);
    }
  }

  @override
  Future<String> submitEmail(
      {required String email, required String stateId}) async {
    if (email.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "confirmation_type": 'email',
          "email": email,
        });
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          final errorMessage;
          if ((response.data as Map).values.isNotEmpty) {
            if ((response.data as Map).values.first is Map) {
              if (((response.data as Map).values.first as Map).values.first
                  is List) {
                errorMessage = (((response.data as Map).values.first as Map)
                        .values
                        .first as List)
                    .first;
              } else {
                errorMessage =
                    ((response.data as Map).values.first as Map).values.first;
              }
            } else if ((response.data as Map).values.first is List) {
              errorMessage =
                  ((response.data as Map).values.first as List).first;
            } else {
              errorMessage = (response.data as Map).values.first;
            }
          } else {
            errorMessage = LocaleKeys.email_error.tr();
          }
          if (response.data is Map) {
            throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: errorMessage.toString(),
            );
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(
          errorMessage: LocaleKeys.email_cannot_be_empty);
    }
  }

  @override
  Future<String> submitPassword(
      {required String password,
      required String confirmPassword,
      required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(
          errorMessage: LocaleKeys.password_cannot_be_empty);
    } else if (confirmPassword.isEmpty) {
      throw const ParsingException(
          errorMessage: LocaleKeys.repeated_password_cannot_be_empty);
    } else if (password != confirmPassword) {
      throw const ParsingException(
          errorMessage: LocaleKeys.passwords_are_not_same);
    } else {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "password": password,
        });

        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          await StorageRepository.putString(
              StoreKeys.token, response.data[StoreKeys.token]);
          return '';
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : '')
                    .toString());
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<String> submitPhone(
      {required String phone, required String stateId}) async {
    if (phone.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "confirmation_type": 'phone',
          "phone": phone,
        });
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          final errorMessage;
          if ((response.data as Map).values.isNotEmpty) {
            if ((response.data as Map).values.first is Map) {
              if (((response.data as Map).values.first as Map).values.first
                  is List) {
                errorMessage = (((response.data as Map).values.first as Map)
                        .values
                        .first as List)
                    .first;
              } else {
                errorMessage =
                    ((response.data as Map).values.first as Map).values.first;
              }
            } else if ((response.data as Map).values.first is List) {
              errorMessage =
                  ((response.data as Map).values.first as List).first;
            } else {
              errorMessage = (response.data as Map).values.first;
            }
          } else {
            errorMessage = LocaleKeys.phone_number_error.tr();
          }
          if (response.data is Map) {
            throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: errorMessage.toString(),
            );
          } else {
            if (response.data is Map) {
              throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage: ((response.data as Map).values.isNotEmpty
                          ? (response.data as Map).values.first
                          : '')
                      .toString());
            } else {
              throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage: response.data.toString());
            }
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw ParsingException(
          errorMessage: LocaleKeys.phone_number_cannot_be_empty.tr());
    }
  }

  @override
  Future<void> resendCode({required String stateId}) async {
    try {
      final response =
          await _dio.post('/auth/registration/resend-code/', data: {
        "state_id": stateId,
      });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.resend_sms_error)
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<String> submitChangedEmail(
      {required String email, required String stateId}) async {
    if (email.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/back/', data: {
          "state_id": stateId,
          "confirmation_type": 'email',
          "email": email,
        });
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.email_error)
                    .toString());
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(
          errorMessage: LocaleKeys.email_cannot_be_empty);
    }
  }

  @override
  Future<String> submitChangedPhone(
      {required String phone, required String stateId}) async {
    if (phone.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/back/', data: {
          "state_id": stateId,
          "confirmation_type": 'phone',
          "phone": phone,
        });
        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.phone_number_error.tr())
                    .toString());
          } else {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: response.data.toString());
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw ParsingException(
          errorMessage: LocaleKeys.phone_number_cannot_be_empty.tr());
    }
  }
}
