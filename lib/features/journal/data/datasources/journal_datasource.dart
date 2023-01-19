import 'dart:developer';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_single_model.dart';
import 'package:anatomica/features/journal/data/models/journal_model.dart';
import 'package:anatomica/features/journal/data/models/journal_single_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class JournalDatasource {
  Future<GenericPagination<JournalModel>> getJournals({String? next});

  Future<GenericPagination<JournalModel>> searchJournals({required String query, String? next});

  Future<GenericPagination<JournalArticleModel>> getJournalArticles({String? next, String query = ''});

  Future<GenericPagination<JournalArticleModel>> getJournalSingleArticles({required int id, String? next});

  Future<JournalArticleSingleModel> getJournalArticleSingle({required String slug});
  Future<String> getJournalFile({required String slug});
  Future<JournalSingleModel> getJournalSingle({required String slug});
}

class JournalDatasourceImpl extends JournalDatasource {
  final Dio _dio;

  JournalDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<JournalModel>> getJournals({String? next}) async {
    print('next datasource => $next');
    try {
      final response = await _dio.get(
        next ?? '/journal/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      log(response.realUri.toString());
      log(response.data.toString());

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => JournalModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
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
  Future<GenericPagination<JournalModel>> searchJournals({required String query, String? next}) async {
    try {
      final response = await _dio.get(
        next ?? '/journal/',
        queryParameters: {'search': query},
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => JournalModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
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
  Future<GenericPagination<JournalArticleModel>> getJournalArticles({String? next, String query = ''}) async {
    try {
      final response = await _dio.get(
        next ?? '/article/',
        queryParameters: {'ordering': '-publish_date', 'search': query},
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => JournalArticleModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
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
  Future<JournalArticleSingleModel> getJournalArticleSingle({required String slug}) async {
    try {
      final response = await _dio.get(
        '/article/$slug/detail/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      log(response.data.toString());
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return JournalArticleSingleModel.fromJson(response.data);
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
  Future<GenericPagination<JournalArticleModel>> getJournalSingleArticles({required int id, String? next}) async {
    try {
      final response = await _dio.get(
        next ?? '/article/',
        queryParameters: {'journal': id},
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => JournalArticleModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
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
  Future<String> getJournalFile({required String slug}) async {
    try {
      final response = await _dio.get(
        '/journal/$slug/file/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return '';
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
  Future<JournalSingleModel> getJournalSingle({required String slug}) async {
    try {
      final response = await _dio.get(
        '/journal/$slug/detail/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
              : {},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return JournalSingleModel.fromJson(response.data);
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
