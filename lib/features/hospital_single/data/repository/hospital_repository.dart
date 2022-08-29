import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/hospital_model.dart';
import 'package:dio/dio.dart';

class HospitalSingleRepository {
  final dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, HospitalModel>> getSingleHospital(String slug) async {
    try {
      final result = await dio.get('/organization/$slug/detail/',
          options: Options(headers: {
            "Authorization": "Token fe977373806790366944dac3f8206452fc79441b"
          }));
      print(result.data);
      print(result.realUri);
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return Right(HospitalModel.fromJson(result.data));
      } else {
        return Left(ServerFailure(statusCode: 141, errorMessage: ''));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }
}
