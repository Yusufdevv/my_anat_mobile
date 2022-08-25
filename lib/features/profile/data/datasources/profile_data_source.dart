import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/profile/data/models/profile.dart';
import 'package:dio/dio.dart';

abstract class ProfileDatasource {
  /// Calls the https://anatomika.xn--h28h.uz/... endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ProfileModel> getProfile(String username);
}

class ProfileDatasourceImpl extends ProfileDatasource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<ProfileModel> getProfile(String username) => _getProfile(username);

  Future<ProfileModel> _getProfile(String username) async {
    try {
      final response = await dio.get('/user/profile/');
      print(response.statusCode);
      print(response.data);
      print(response.realUri);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileModel.fromJson(response.data);
      } else {
        final message =
            '${(response.data as Map<String, dynamic>).values.first}'
                .replaceAll(RegExp(r'[\[\]]'), '');
        throw ServerException(
          errorMessage: message,
          statusCode: response.statusCode!,
        );
      }
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw ServerException(
        errorMessage:
            'Authentication Repository Dio Error. Error message: ${error.message}',
        statusCode: error.error,
      );
    } on Exception catch (error) {
      throw ServerException(
        errorMessage: 'Authentication Repository Error. Error message: $error',
        statusCode: 141,
      );
    }
  }
}
