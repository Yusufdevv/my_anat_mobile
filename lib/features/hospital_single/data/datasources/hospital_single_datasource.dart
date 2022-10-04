import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/comfort_model.dart';
import 'package:anatomica/features/hospital_single/data/models/comment_model.dart';
import 'package:anatomica/features/hospital_single/data/models/hospital_service_model.dart';
import 'package:anatomica/features/hospital_single/data/models/hospital_single_model.dart';
import 'package:anatomica/features/hospital_single/data/models/post_comment_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:dio/dio.dart';

abstract class HospitalSingleDatasource {
  Future<HospitalSingleModel> getHospitalSingle({required String slug});

  Future<GenericPagination<HospitalServiceModel>> getHospitalServices(
      {required int id, String? next, String search = ''});

  Future<GenericPagination<HospitalDoctorsModel>> getHospitalSpecialists({required int id, String? next});

  Future<GenericPagination<ComfortModel>> getHospitalConditions({required int id, String? next});

  Future<GenericPagination<JournalArticleModel>> getHospitalArticles({required int id, String? next});

  Future<GenericPagination<CommentModel>> getHospitalComments({required int id, String? next});

  Future<GenericPagination<VacancyListModel>> getHospitalVacancies({required int id, String? next});

  Future<void> postComment({required int organizationId, required PostCommentModel comment});

  Future<Either> deleteComment({required int id});
}

class HospitalSingleDatasourceImpl extends HospitalSingleDatasource {
  final Dio _dio;

  HospitalSingleDatasourceImpl(this._dio);

  @override
  Future<HospitalSingleModel> getHospitalSingle({required String slug}) async {
    try {
      final response = await _dio.get('/organization/$slug/detail/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return HospitalSingleModel.fromJson(response.data);
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
  Future<GenericPagination<HospitalServiceModel>> getHospitalServices(
      {required int id, String? next, String search = ''}) async {
    try {
      final response = await _dio.get(next ?? '/organization/service/',
          queryParameters: {'organization_id': id, 'search': search},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => HospitalServiceModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<HospitalDoctorsModel>> getHospitalSpecialists({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/organization/doctor/',
          queryParameters: {'organization_id': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => HospitalDoctorsModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<ComfortModel>> getHospitalConditions({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/organization/facility/',
          queryParameters: {'organization_id': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => ComfortModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<JournalArticleModel>> getHospitalArticles({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/article/',
          queryParameters: {'organization': id},
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
  Future<GenericPagination<CommentModel>> getHospitalComments({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/organization/comment/',
          queryParameters: {'organization_id': id},
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

  @override
  Future<GenericPagination<VacancyListModel>> getHospitalVacancies({required int id, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/vacancy/vacancy/list/',
          queryParameters: {'organization': id},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      print(response.data);
      print(response.realUri);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => VacancyListModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<void> postComment({required int organizationId, required PostCommentModel comment}) async {
    try {
      final data = comment.toJson();
      data.putIfAbsent('organization', () => organizationId);
      final response = await _dio.post('/organization/comment/create/',
          data: data, options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      print(response.data);
      print(response.realUri);
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
  Future<Either> deleteComment({required int id}) async {
    try {
      final response = await _dio.delete('/organization/comment/$id/delete/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      print(response.statusCode);
      print(response.data);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right('');
      } else {
        return Left('');
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
