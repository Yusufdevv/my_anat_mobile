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
  Future<String> confirmCode({required String code, required String stateId});
  Future<String> submitPassword({required String password, required String confirmPassword, required String stateId});
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      final response = await _dio.get('/user/profile/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      print(response.data);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
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
  Future<bool> checkUserName({required String username}) async {
    try {
      final response = await _dio.get('/auth/check/username/$username/');
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
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
      print(e.toString());
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<String> submitNameUsername(
      {required String username, required String fullName, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/registration/', data: {
        "state_id": stateId,
        "full_name": fullName,
        "login": username,
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
  Future<String> confirmCode({required String code, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/registration/', data: {"state_id": stateId, "code": code});
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
      final response = await _dio.post('/auth/registration/', data: {
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
  Future<String> submitPassword(
      {required String password, required String confirmPassword, required String stateId}) async {
    if (password.isEmpty) {
      throw const ParsingException(errorMessage: "Parol bo'sh bo'lishi mumkin emas");
    } else if (confirmPassword.isNotEmpty) {
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

  @override
  Future<String> submitPhone({required String phone, required String stateId}) async {
    try {
      final response = await _dio.post('/auth/registration/', data: {
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
}
