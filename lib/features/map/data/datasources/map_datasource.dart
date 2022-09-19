import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class MapDatasource {
  Future<GenericPagination<TypeModel>> getTypes({String? next});
}

class MapDatasourceImpl extends MapDatasource {
  final Dio _dio;

  MapDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<TypeModel>> getTypes({String? next}) async {
    try {
      final response = await _dio.get('/organization/specialization/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => TypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(statusCode: response.statusCode!, errorMessage: response.data);
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
