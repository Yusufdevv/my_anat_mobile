import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/profile/data/models/faq_model.dart';
import 'package:anatomica/features/profile/data/models/uploaded_image_model.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:dio/dio.dart';

abstract class ProfileDatasource {
  /// Calls the https://anatomika.xn--h28h.uz/... endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  final PaginationDatasource paginationDatasource;

  ProfileDatasource({required this.paginationDatasource});

  Future<VacancyModel> getLikedVacancyList({String? next, int? organizationId});

  Future<UserModel> getProfile();
  Future<void> deleteAccount();

  Future<void> editProfile(Map<String, dynamic> data);

  Future<UploadedImageModel> uploadImg(FormData formData);

  Future<void> changePassword({required String currentPassword, required String newPassword});
  Future<GenericPagination<FaqModel>> getFaq({String? next});
}

class ProfileDatasourceImpl extends ProfileDatasource {
  final Dio _dio;

  ProfileDatasourceImpl(this._dio, {required super.paginationDatasource});

  @override
  Future<VacancyModel> getLikedVacancyList({String? next, int? organizationId}) async {
    try {
      const url = '/vacancy/vacancy/liked/';
      final Map<String, dynamic> query = {};
      if (organizationId != null) {
        query.putIfAbsent('organization', () => organizationId);
      }

      final result = await paginationDatasource.fetchMore(
        url: url,
        next: next,
        fromJson: VacancyListModel.fromJson,
        query: query,
      );

      final vacancies = VacancyModel(
        next: result.next,
        results: result.results,
        count: result.count,
      );
      return vacancies;
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw ServerException(
        errorMessage: 'Authentication Repository Dio Error. Error message: ${error.message}',
        statusCode: 141,
      );
    } on Exception catch (error) {
      throw ServerException(
        errorMessage: 'Authentication Repository Error. Error message: $error',
        statusCode: 141,
      );
    }
  }

  @override
  Future<UserModel> getProfile() async {
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
  Future<void> editProfile(Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch('/user/profile/update/',
          data: FormData.fromMap(data),
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw ServerException(errorMessage: response.data.toString(), statusCode: response.statusCode ?? 0);
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
  Future<UploadedImageModel> uploadImg(FormData formData) async {
    try {
      final response = await _dio.post('/image/create/',
          data: formData,
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      print(response.realUri);
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UploadedImageModel.fromJson(response.data);
      } else {
        throw ServerException(errorMessage: response.data, statusCode: response.statusCode ?? 0);
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
  Future<void> changePassword({required String currentPassword, required String newPassword}) async {
    try {
      final response = await _dio.post('/auth/password/change/',
          data: {'current_password': currentPassword, 'new_password': newPassword},
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (!(response.data['success'] as bool)) {
          throw ServerException(errorMessage: 'Eski parol xato kiritildi', statusCode: response.statusCode ?? 0);
        }
      } else {
        throw ServerException(errorMessage: response.data.toString(), statusCode: response.statusCode ?? 0);
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
  Future<void> deleteAccount() async {
    try {
      final response = await _dio.delete('/user/profile/delete/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (!(response.statusCode! >= 200 && response.statusCode! < 300)) {
        throw ServerException(errorMessage: response.data.toString(), statusCode: response.statusCode ?? 0);
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
  Future<GenericPagination<FaqModel>> getFaq({String? next}) async {
    try {
      final response = await _dio.get(next ?? '/faq/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => FaqModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
      } else {
        throw ServerException(errorMessage: response.data.toString(), statusCode: response.statusCode ?? 0);
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
