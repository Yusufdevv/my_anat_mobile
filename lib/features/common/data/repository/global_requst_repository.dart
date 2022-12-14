import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:dio/dio.dart';

class GlobalRequestRepository {
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
              headers: sendToken
                  ? {
                      "Authorization":
                          "Token ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return Right(fromJson(result.data));
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
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
              headers: sendToken
                  ? {
                      "Authorization":
                          "Token ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      print(result.data);
      print(result.realUri);
      List<S> list = [];
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          var data = result.data[responseDataKey] as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        } else {
          var data = result.data as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        }
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }

      return Right(list);
    } catch (e) {
      print(e.toString());
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
      String? errorFieldKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: data,
          options: Options(
              headers: sendToken
                  ? {
                      "Authorization":
                          "Token ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          return Right(fromJson(result.data[responseDataKey]));
        } else {
          return Right(fromJson(result.data));
        }
      } else {
        var error = '';
        if (errorFieldKey != null) {
          var errorlist = result.data![errorFieldKey] as List<dynamic>;
          error = errorlist.first;
        }
        return Left(ServerFailure(errorMessage: error, statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: e.toString()));
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
              headers: sendToken
                  ? {
                      "Authorization":
                          "Token ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      List<S> list = [];
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          var data = result.data[responseDataKey] as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        } else {
          var data = result.data as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        }
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }

      return Right(list);
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }
}
