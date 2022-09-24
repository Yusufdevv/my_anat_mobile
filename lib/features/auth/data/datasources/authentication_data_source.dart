import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
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
              errorMessage:
                  ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'Login parol xato')
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
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
      } else {
        await StorageRepository.deleteString('token');
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : 'Foydalanuvchi ma`lumotlarini olishda xato')
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
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return true;
        } else if (response.statusCode != null && response.statusCode! >= 400 && response.statusCode! < 500) {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'Login band')
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
      throw const ParsingException(errorMessage: "Login bo'sh bo'lishi mumkin emas");
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
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : 'Ism yoki login xato')
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
      throw const ParsingException(errorMessage: "To'liq ism bo'sh bo'lishi mumkin emas");
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
                        : 'Tasdiqlash kodi xato')
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
      throw const ParsingException(errorMessage: "Iltimos, hamma bo'sh joylarni to'ldiring");
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
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'Email xato')
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
      throw const ParsingException(errorMessage: "Email bo'sh bo'lishi mumkin emas");
    }
  }

  @override
  Future<String> submitPassword(
      {required String password, required String confirmPassword, required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(errorMessage: "Parol bo'sh bo'lishi mumkin emas");
    } else if (confirmPassword.isEmpty) {
      throw const ParsingException(errorMessage: "Takrorlangan parol bo'sh bo'lishi mumkin emas");
    } else if (password != confirmPassword) {
      throw const ParsingException(errorMessage: "Parollar mos kelmadi");
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
        print(response.data);
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return response.data['state_id'] as String;
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : 'Telefon raqam xato')
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
      throw const ParsingException(errorMessage: "Telefon raqam bo'sh bo'lishi mumkin emas");
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
                      : 'Smsni qayta jo\'natishda xato')
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
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'Email xato')
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
      throw const ParsingException(errorMessage: "Email bo'sh bo'lishi mumkin emas");
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
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'Email xato')
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
      throw const ParsingException(errorMessage: "Telefon raqam bo'sh bo'lishi mumkin emas");
    }
  }
}
