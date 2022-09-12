import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class PaginationRepository {
  final dio = serviceLocator<DioSettings>().dio;

  /// Give empty String for "next" if you don't have next link
  Future<Either<Failure, GenericPagination<T>>> fetchMore<T>(
      {required String url,
      String? next,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? query}) async {
    try {
      Map<String, dynamic> queryParams = {};
      if (query != null) {
        queryParams = query;
      }

      final result = await dio.get(
        next ?? url,
        options: Options(headers: {"Authorization": "Token ${StorageRepository.getString('token', defValue: '')}"}),
        queryParameters: queryParams,
      );
      print(queryParams);
      print(result.realUri);
      print(result.data);
      print(result.statusCode);
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        final data = GenericPagination<T>.fromJson((result.data!), (data) => fromJson((data as Map<String, dynamic>)));

        return Right(data);
      } else {
        return Left(ServerFailure(statusCode: result.statusCode ?? 0, errorMessage: result.statusMessage ?? ''));
      }
    } catch (e) {
      print(e.toString() + 'error read here ');
      return Left(ServerFailure(errorMessage: '', statusCode: 0));
    }
  }
}

class PaginationDatasource {
  final dio = serviceLocator<DioSettings>().dio;

  /// Give empty String for "next" if you don't have next link
  Future<GenericPagination<T>> fetchMore<T>({
    required String url,
    String? next,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? query,
    int size = 15,
  }) async {
    try {
      Map<String, dynamic> queryParams = {'size': size};
      if (query != null) {
        queryParams = query;
      }

      final result = await dio.get(next ?? url,
          queryParameters: queryParams,
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token', defValue: '')}'}));

      // print(queryParams);
      // print(result.realUri);
      // print(result.data);
      // print(result.statusCode);
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        final data = GenericPagination<T>.fromJson((result.data!), (data) => fromJson((data as Map<String, dynamic>)));

        return data;
      } else {
        throw ServerException(errorMessage: 'GenericPagination2 Failure!', statusCode: result.statusCode!);
      }
    } catch (_) {
      rethrow;
    }
  }
}
