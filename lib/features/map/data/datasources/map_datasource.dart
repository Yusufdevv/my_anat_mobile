import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/models/service_spec_suggest_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class MapDatasource {
  Future<GenericPagination<TypeModel>> getTypes({String? next});

  Future<List<ServiceSpecSuggestModel>> getServices({String? searchedText});

  Future<GenericPagination<OrgMapV2Model>> getOrgV2({required MapV2Params params});
}

class MapDatasourceImpl extends MapDatasource {
  final Dio _dio;

  MapDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<TypeModel>> getTypes({String? next}) async {
    try {
      final response = await _dio.get('/organization/specialization/',
          options: Options(
              headers: StorageRepository.getString(StoreKeys.token).isNotEmpty
                  ? {'Authorization': 'Token ${StorageRepository.getString(StoreKeys.token)}'}
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

  @override
  Future<List<ServiceSpecSuggestModel>> getServices({String? searchedText}) async {
    try {
      final response =
          await _dio.get('/mobile/organization/service_spec_suggest/', queryParameters: {"search": searchedText});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data.map((e) => ServiceSpecSuggestModel.fromJson(e)).toList();
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

  @override
  Future<GenericPagination<OrgMapV2Model>> getOrgV2({required MapV2Params params}) async {
    final Map<String, dynamic> queryParams = {};
    if (params.specializationId != null) {
      queryParams.putIfAbsent('specialization', () => params.specializationId);
    }
    if (params.search != null && (params.search?.isNotEmpty ?? false)) {
      queryParams.putIfAbsent('search', () => params.search);
    }
    if (params.region != null) {
      queryParams.putIfAbsent('region', () => params.region);
    }
    if (params.district != null) {
      queryParams.putIfAbsent('district', () => params.district);
    }
    if (params.service != null) {
      queryParams.putIfAbsent('service', () => params.service);
    }
    if (params.limit != null) {
      queryParams.putIfAbsent('limit', () => params.limit);
    }
    if (params.offset != null) {
      queryParams.putIfAbsent('offset', () => params.offset);
    }
    if (params.latitude != 0) {
      queryParams.putIfAbsent('lat', () => params.latitude);
    }
    if (params.longitude != 0) {
      queryParams.putIfAbsent('lon', () => params.longitude);
    }
    if (params.title != null && params.title!.isNotEmpty) {
      queryParams.putIfAbsent('title', () => params.title);
    }

    try {
      final response = await _dio.get(
        params.next ?? '/mobile/organization/map/v2/',
        options: Options(
          headers: StorageRepository.getString(StoreKeys.token).isNotEmpty
              ? {'Authorization': 'Token ${StorageRepository.getString(StoreKeys.token)}'}
              : {},
        ),
        queryParameters: params.next != null ? null : queryParams,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) => OrgMapV2Model.fromJson(p0 as Map<String, dynamic>));
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
