import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
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
        print(response.data);
        return response.data['state_id'];
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
  Future<void> resendCode({required String stateId}) async {
    try {
      final response = await _dio.post('/auth/restore/resend-code/', data: {
        "state_id": stateId,
      });
      print(response.data);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
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
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
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
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
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
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> submitPassword(
      {required String password, required String confirmPassword, required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(errorMessage: "Parol bo'sh bo'lishi mumkin emas");
    } else if (confirmPassword.isEmpty) {
      throw const ParsingException(errorMessage: "Takrorlangan parol bo'sh bo'lishi mumkin emas");
    } else if (password != confirmPassword) {
      throw const ParsingException(errorMessage: "Parollar mos kelmadi");
    } else {
      try {
        final response = await _dio.post('/auth/restore/', data: {
          "state_id": stateId,
          "password": password,
        });

        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          print(response.data);
          await StorageRepository.putString('token', response.data['token']);
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        print(e.toString());
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
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
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
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      print(e.toString());
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
