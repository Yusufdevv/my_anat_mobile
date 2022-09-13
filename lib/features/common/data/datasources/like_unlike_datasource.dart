import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

abstract class LikeUnlikeDatasource {
  Future<void> likeVacancy(int id);
  Future<void> unlikeVacancy(int id);
  Future<void> likeDoctor(int id);
  Future<void> unlikeDoctor(int id);
}

class LikeUnlikeDatasourceImpl extends LikeUnlikeDatasource {
  final Dio _dio;
  LikeUnlikeDatasourceImpl(this._dio);
  @override
  Future<void> likeVacancy(int id) async {
    try {
      final response = await _dio.post('/vacancy/vacancy/$id/like',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
  Future<void> unlikeVacancy(int id) async {
    try {
      final response = await _dio.delete('/vacancy/vacancy/$id/dislike',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
  Future<void> likeDoctor(int id) async {
    try {
      final response = await _dio.delete('/doctor/$id/like/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
  Future<void> unlikeDoctor(int id) async {
    try {
      final response = await _dio.delete('/doctor/$id/dislike/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
}
