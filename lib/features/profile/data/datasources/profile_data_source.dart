import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class ProfileDatasource {
  /// Calls the https://anatomika.xn--h28h.uz/... endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getProfile();

  Future<UserModel> editProfile(Map<String, dynamic> data);

  Future<UserModel> uploadImg(FormData formData);
}

class ProfileDatasourceImpl extends ProfileDatasource {
  final Dio _dio;

  ProfileDatasourceImpl(this._dio);

  @override
  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get('/user/profile/',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      print(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
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
      print(e.toString());
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<UserModel> editProfile(Map<String, dynamic> data) async {
    print(data['img']);
    final response = await _dio.patch('/user/profile/update/',
        data: FormData.fromMap(data),
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }));
    print(response.statusCode);
    print(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final user = UserModel.fromJson(response.data);
      return user;
    }
    throw ServerException(
        errorMessage: response.data, statusCode: response.statusCode ?? 0);
  }

  @override
  Future<UserModel> uploadImg(FormData formData) async {
    final response = await _dio.post('/image/create/',data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }));
    print(response.realUri);
    print(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final user = UserModel.fromJson(response.data);
      return user;
    }
    throw ServerException(
        errorMessage: response.data, statusCode: response.statusCode ?? 0);
  }
}
