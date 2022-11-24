import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/markdown_reader/data/models/journal_outline_model.dart';
import 'package:anatomica/features/markdown_reader/data/models/journal_page_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class JournalPagesDatasource {
  Future<GenericPagination<JournalPageModel>> getPages({required String slug, String? next});
  Future<GenericPagination<JournalOutlineModel>> getPagesTableOfContents({required String slug, String? next});
}

class JournalPagesDatasourceImpl extends JournalPagesDatasource {
  final Dio _dio;
  JournalPagesDatasourceImpl(this._dio);
  @override
  Future<GenericPagination<JournalPageModel>> getPages({required String slug, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/journal/$slug/pages/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination<JournalPageModel>.fromJson(
            response.data, (p0) => JournalPageModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<JournalOutlineModel>> getPagesTableOfContents({required String slug, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/journal/$slug/outline/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination<JournalOutlineModel>.fromJson(
            response.data, (p0) => JournalOutlineModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }}
}
