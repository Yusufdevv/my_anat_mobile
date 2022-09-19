import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/doctor_single/data/models/doctor_interview_model.dart';
import 'package:anatomica/features/doctor_single/data/models/doctor_single_model.dart';
import 'package:anatomica/features/hospital_single/data/models/comment_model.dart';
import 'package:anatomica/features/magazine/data/models/journal_article_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class DoctorSingleDatasource {
  Future<DoctorSingleModel> getDoctorSingle({required int id});
  Future<GenericPagination<JournalArticleModel>> getDoctorArticles({required int id, String? next});
  Future<GenericPagination<DoctorInterviewModel>> getDoctorInterviews({required int id, String? next});
  Future<GenericPagination<CommentModel>> getDoctorComments({required int id, String? next});
}

class DoctorSingleDatasourceImpl extends DoctorSingleDatasource {
  final Dio _dio;
  DoctorSingleDatasourceImpl(this._dio);
  @override
  Future<DoctorSingleModel> getDoctorSingle({required int id}) async {
    try {
      final response = await _dio.get('/doctor/$id/detail/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return DoctorSingleModel.fromJson(response.data);
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
  Future<GenericPagination<JournalArticleModel>> getDoctorArticles({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/article/',
          queryParameters: {'authors': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => JournalArticleModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<DoctorInterviewModel>> getDoctorInterviews({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/interview/',
          queryParameters: {'doctors': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => DoctorInterviewModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<CommentModel>> getDoctorComments({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/doctor/comment/',
          queryParameters: {'doctor_id': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => CommentModel.fromJson(p0 as Map<String, dynamic>));
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
