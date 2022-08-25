import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationDataSource {
  Future<void> login({required String username, required String password});
  Future<UserModel> getUserData();
  Future<bool> checkUserName();
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
  Future<bool> checkUserName() async => false;
}
