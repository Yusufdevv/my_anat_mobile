import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationDataSource {
  Future<void> login({required String username, required String password});
  Future<UserModel> getUserData();
  Future<bool> checkUserName({required String username});
  Future<String> createNewState();
  Future<String> submitNameUsername({required String username, required String fullName, required String stateId});
  Future<String> submitPhone({required String phone, required String stateId});
  Future<String> submitEmail({required String email, required String stateId});
  Future<String> submitChangedPhone({required String phone, required String stateId});
  Future<String> submitChangedEmail({required String email, required String stateId});
  Future<String> confirmCode({required String code, required String stateId});
  Future<String> submitPassword({required String password, required String confirmPassword, required String stateId});
  Future<void> resendCode({required String stateId});
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final Dio _dio;
  AuthenticationDataSourceImpl(this._dio);
  @override
  Future<void> login({required String username, required String password}) async {
    try {
      final response = await _dio.post('/auth/token/', data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {

        await StorageRepository.putString('token', response.data['token']);
      } else if (response.statusCode != null && response.statusCode! >= 400 && response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.incorrect_login)
                  .toString());
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
        }
      } else {
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.data);
        return UserModel.fromJson(response.data);
      } else {
        await StorageRepository.deleteString('token');
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.error_while_get_user)
                  .toString());
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
        print(response.realUri);
        //print(response.headers);
        print(response.data);
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return true;
        } else if (response.statusCode != null && response.statusCode! >= 400 && response.statusCode! < 500) {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.login_busy)
                    .toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
          }
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(errorMessage: e.toString());
      }
    } else {
      throw const ParsingException(errorMessage: LocaleKeys.login_cannot_be_empty);
    }
  }

  @override
  Future<String> createNewState() async {
    try {
      final response = await _dio.post('/auth/registration/new-state/');
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['state_id'] as String;
      } else {
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      {required String username, required String fullName, required String stateId}) async {
    if (fullName.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "full_name": fullName,
          "login": username,
        });
        print(response.data);
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? ((response.data as Map).values.first is Map)
                            ? ((response.data as Map).values.first as Map).values.first
                            : (response.data as Map).values.first
                        : LocaleKeys.name_login_error)
                    .toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      throw const ParsingException(errorMessage: LocaleKeys.name_cannot_be_empty);
    }
  }

  @override
  Future<String> confirmCode({required String code, required String stateId}) async {
    if (code.length >= 6) {
      try {
        final response = await _dio.post('/auth/registration/', data: {"state_id": stateId, "code": code});
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.confirmation_error)
                    .toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
  Future<String> submitEmail({required String email, required String stateId}) async {
    if (email.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "confirmation_type": 'email',
          "email": email,
        });
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      throw const ParsingException(errorMessage: LocaleKeys.email_cannot_be_empty);
    }
  }

  @override
  Future<String> submitPassword(
      {required String password, required String confirmPassword, required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(errorMessage: LocaleKeys.password_cannot_be_empty);
    } else if (confirmPassword.isEmpty) {
      throw const ParsingException(errorMessage: LocaleKeys.repeated_password_cannot_be_empty);
    } else if (password != confirmPassword) {
      throw const ParsingException(errorMessage: LocaleKeys.passwords_are_not_same);
    } else {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "password": password,
        });

        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          await StorageRepository.putString('token', response.data['token']);
          return '';
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : '').toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
  Future<String> submitPhone({required String phone, required String stateId}) async {
    if (phone.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/', data: {
          "state_id": stateId,
          "confirmation_type": 'phone',
          "phone": phone,
        });
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.phone_number_error)
                    .toString());
          } else {
            if (response.data is Map) {
              throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage:
                      ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : '').toString());
            } else {
              throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      throw const ParsingException(errorMessage: LocaleKeys.phone_number_cannot_be_empty);
    }
  }

  @override
  Future<void> resendCode({required String stateId}) async {
    try {
      final response = await _dio.post('/auth/registration/resend-code/', data: {
        "state_id": stateId,
      });
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : LocaleKeys.resend_sms_error)
                  .toString());
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
  Future<String> submitChangedEmail({required String email, required String stateId}) async {
    if (email.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/back/', data: {
          "state_id": stateId,
          "confirmation_type": 'email',
          "email": email,
        });
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      throw const ParsingException(errorMessage: LocaleKeys.email_cannot_be_empty);
    }
  }

  @override
  Future<String> submitChangedPhone({required String phone, required String stateId}) async {
    if (phone.isNotEmpty) {
      try {
        final response = await _dio.post('/auth/registration/back/', data: {
          "state_id": stateId,
          "confirmation_type": 'phone',
          "phone": phone,
        });
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.phone_number_error)
                    .toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
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
      throw const ParsingException(errorMessage: LocaleKeys.phone_number_cannot_be_empty);
    }
  }
}
