import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/magazine/data/models/journal_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class JournalDatasource {
  Future<GenericPagination<JournalModel>> getJournals({String? next});
  Future<GenericPagination<JournalModel>> searchJournals({required String query, String? next});
}

class JournalDatasourceImpl extends JournalDatasource {
  final Dio _dio;
  JournalDatasourceImpl(this._dio);
  @override
  Future<GenericPagination<JournalModel>> getJournals({String? next}) async {
    try {
      final response = await _dio.get(next ?? '/journal/');
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
      final response = await _dio.get(next ?? '/journal/', queryParameters: {'search': query});
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
}
