import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';

abstract class ResetPasswordDatasource {
  Future<String> createResetPasswordNewState();
  Future<String> submitPhone({required String phone, required String stateId});
  Future<String> submitEmail({required String email, required String stateId});
  Future<String> verifyPhone({required String code, required String stateId});
  Future<void> resendCode({required String stateId});
  Future<void> submitPassword({required String password, required String confirmPassword, required String stateId});
  Future<String> submitChangedPhone({required String phone, required String stateId});
  Future<String> submitChangedEmail({required String email, required String stateId});
}

class ResetPasswordDatasourceImpl extends ResetPasswordDatasource {
  final Dio _dio;
  ResetPasswordDatasourceImpl(this._dio);
  @override
  Future<String> createResetPasswordNewState() async {
    try {
      final response = await _dio.post('/auth/restore/new-state/', data: {});
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['state_id'];
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
  Future<void> resendCode({required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/resend-code/', data: {
        "state_id": stateId,
      });
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
    try {
      final response = await _dio.post('/auth/restore/back/', data: {
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
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
  Future<String> submitChangedPhone({required String phone, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/back/', data: {
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
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
  Future<String> submitEmail({required String email, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/', data: {
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
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
  Future<void> submitPassword(
      {required String password, required String confirmPassword, required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(errorMessage: LocaleKeys.password_cannot_be_empty);
    } else if (confirmPassword.isEmpty) {
      throw const ParsingException(errorMessage: LocaleKeys.repeated_password_cannot_be_empty);
    } else if (password != confirmPassword) {
      throw const ParsingException(errorMessage: LocaleKeys.passwords_are_not_same);
    } else {
      try {
        final response = await _dio.post('/auth/restore/', data: {
          "state_id": stateId,
          "password": password,
        });
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          await StorageRepository.putString(StoreKeys.token, response.data[StoreKeys.token]);
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                        : LocaleKeys.incorrect_login)
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
  }

  @override
  Future<String> submitPhone({required String phone, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/', data: {
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
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
  Future<String> verifyPhone({required String code, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/', data: {"state_id": stateId, "code": code});
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['state_id'] as String;
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first.toString().replaceAll(RegExp(r'\[?]?'), '')
                      : LocaleKeys.incorrect_login)
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
}
