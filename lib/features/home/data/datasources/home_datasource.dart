import 'dart:developer';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/home/data/models/banner_model.dart';
import 'package:anatomica/features/home/data/models/category_model.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<GenericPagination<CategoryModel>> getCategories({String? next});

  Future<GenericPagination<JournalArticleModel>> getHomeArticles(
      {String? next});

  Future<GenericPagination<HospitalDoctorsModel>> getPopularDoctors(
      {String? next});

  Future<GenericPagination<BannerModel>> getBanners({String? next});

  Future<GenericPagination<OrgMapV2Model>> getPopularOrgs({String? next});

  Future<GenericPagination<NewsModel>> getNews({String? next});

  Future<NewsModel> getNewSingle({required String slug});
}

class HomeDatasourceImpl extends HomeDatasource {
  final Dio _dio;

  HomeDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<CategoryModel>> getCategories({String? next}) async {
    try {
      final response = await _dio.get(
        next ?? '/organization/type/',
        options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {}),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print(
            'response.data categories => ${response.realUri} ${response.data}');
        return GenericPagination.fromJson(response.data,
            (p0) => CategoryModel.fromJson(p0 as Map<String, dynamic>));
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<JournalArticleModel>> getHomeArticles(
      {String? next}) async {
    try {
      final response = await _dio.get(next ?? '/article/popular/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => JournalArticleModel.fromJson(p0 as Map<String, dynamic>));
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<BannerModel>> getBanners({String? next}) async {
    try {
      final response = await _dio.get(next ?? '/mobile/banners/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      print('banners => ${response.realUri} ${response.headers}');
      print('banners result => ${response.data}');
      log('banners after json => ${GenericPagination.fromJson(response.data, (p0) => BannerModel.fromJson(p0 as Map<String, dynamic>)).results}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => BannerModel.fromJson(p0 as Map<String, dynamic>));
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<HospitalDoctorsModel>> getPopularDoctors(
      {String? next}) async {
    try {
      final response = await _dio.get(next ?? '/interview/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => HospitalDoctorsModel.fromJson(p0 as Map<String, dynamic>));
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<OrgMapV2Model>> getPopularOrgs(
      {String? next}) async {
    try {
      final response = await _dio.get(next ?? '/organization/',
          queryParameters: {"ordering": "-rating"},
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => OrgMapV2Model.fromJson(p0 as Map<String, dynamic>));
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
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<NewsModel>> getNews({String? next}) async {
    try {
      final response = await _dio.get(
        next ?? '/news/',
        options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {}),
      );
      print('res news=> ${response.realUri} ${response.data}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => NewsModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: (response.data as List<dynamic>).first);
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
  Future<NewsModel> getNewSingle({required String slug}) async {
    try {
      final response = await _dio.get(
        '/news/$slug/detail/',
        options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {}),
      );
      print('res => ${response.realUri} ${response.data}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return NewsModel.fromJson(response.data);
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: (response.data as List<dynamic>).first);
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
