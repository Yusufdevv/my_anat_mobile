import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:dio/dio.dart';

class GlobalRequestRepopsitory {
  final dio = serviceLocator<DioSettings>().dio;

  String token = 'fe977373806790366944dac3f8206452fc79441b';

  ///Request for any kind of GET request for retrieving single model, ,not a List of models
  Future<Either<Failure, S>> getSingle<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(Map<String, dynamic>) fromJson,
      bool sendToken = true}) async {
    try {
      final result = await dio.get(endpoint,
          queryParameters: query,
          options: Options(
              headers: sendToken ? {"Authorization": "Token $token"} : {}));
      print(result.realUri);
      print(result.data);
      return Right(fromJson(result.data));
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  ///Request for any kind of GET request for retrieving List of models,not a single model
  Future<Either<Failure, List<S>>> getList<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(
        Map<String, dynamic>,
      )
          fromJson,
      String? responseDataKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.get(endpoint,
          queryParameters: query,
          options: Options(
              headers: sendToken ? {"Authorization": "Token $token"} : {}));
      print(result.realUri);
      print(result.data);
      List<S> list = [];
      if (responseDataKey != null && responseDataKey.isNotEmpty) {
        var data = result.data[responseDataKey] as List<dynamic>;
        list = data.map((e) => fromJson(e)).toList();
      } else {
        var data = result.data as List<dynamic>;
        list = data.map((e) => fromJson(e)).toList();
      }

      return Right(list);
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response with single model , not a list
  Future<Either<Failure, S>> postAndSingle<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(Map<String, dynamic>) fromJson,
      String? responseDataKey,
      Map<String, dynamic>? data,
      bool sendToken = true}) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: data,
          options: Options(
              headers: sendToken ? {"Authorization": "Token $token"} : {}));
      print(result.realUri);
      print(result.data);
      if (responseDataKey != null && responseDataKey.isNotEmpty) {
        return Right(fromJson(result.data[responseDataKey]));
      } else {
        return Right(fromJson(result.data));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response List of Model , not a single model
  Future<Either<Failure, List<S>>> postAndList<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      required S Function(Map<String, dynamic>) fromJson,
      String? responseDataKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: data,
          options: Options(
              headers: sendToken ? {"Authorization": "Token $token"} : {}));
      print(result.realUri);
      print(result.data);
      List<S> list = [];
      if (responseDataKey != null && responseDataKey.isNotEmpty) {
        var data = result.data[responseDataKey] as List<dynamic>;
        list = data.map((e) => fromJson(e)).toList();
      } else {
        var data = result.data as List<dynamic>;
        list = data.map((e) => fromJson(e)).toList();
      }

      return Right(list);
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }
}
