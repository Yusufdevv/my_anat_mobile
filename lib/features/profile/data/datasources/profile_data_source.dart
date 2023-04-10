import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/auth/data/models/user_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/models/faq_model.dart';
import 'package:anatomica/features/profile/data/models/payment_history_model.dart';
import 'package:anatomica/features/profile/data/models/uploaded_image_model.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_list.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';

abstract class ProfileDatasource {
  Future<GenericPagination<VacancyListModel>> getLikedVacancyList(
      {String? next});

  Future<GenericPagination<CandidateListModel>> getLikedCandidateList(
      {String? next});

  Future<UserModel> getProfile();

  Future<void> deleteAccount();

  Future<void> editProfile(Map<String, dynamic> data);

  Future<String> sendCodeToPhone({required String phoneNumber});

  Future<String> sendCodeToEmail({required String email});

  Future<UploadedImageModel> uploadImg(FormData formData);

  Future<void> changePassword(
      {required String currentPassword, required String newPassword});

  Future<GenericPagination<FaqModel>> getFaq({String? next});

  Future<GenericPagination<PaymentHistoryModel>> getMyPayments({
    String? next,
    String? search,
    String? provider,
    String? purpose,
    String? status,
  });
}

class ProfileDatasourceImpl extends ProfileDatasource {
  final Dio _dio;

  ProfileDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<VacancyListModel>> getLikedVacancyList(
      {String? next}) async {
    try {
      final results = await _dio.get(next ?? '/vacancy/vacancy/liked',
          options: (Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          })));

      return GenericPagination.fromJson(
          results.data,
          (p0) => VacancyListModel.fromJson(
              (p0 as Map<String, dynamic>)['vacancy']));
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw ServerException(
        errorMessage:
            'Authentication Repository Dio Error. Error message: ${error.message}',
        statusCode: 141,
      );
    } on Exception catch (error) {
      throw ServerException(
        errorMessage: 'Authentication Repository Error. Error message: $error',
        statusCode: 141,
      );
    }
  }

  @override
  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get('/user/profile/',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future<void> editProfile(Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch('/user/profile/update/',
          data: FormData.fromMap(data),
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        if (response.data is Map) {
          throw ServerException(
              errorMessage: ((response.data as Map)['email'] is List)
                  ? ((response.data as Map)['email'] as List).isNotEmpty
                      ? ((response.data as Map)['email'] as List)
                          .first
                          .toString()
                      : (response.data as Map)['email'].toString()
                  : response.data.toString(),
              statusCode: response.statusCode ?? 0);
        }
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<UploadedImageModel> uploadImg(FormData formData) async {
    try {
      final response = await _dio.post('/image/create/',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UploadedImageModel.fromJson(response.data);
      } else {
        throw ServerException(
            errorMessage: response.data, statusCode: response.statusCode ?? 0);
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
  Future<GenericPagination<PaymentHistoryModel>> getMyPayments({
    String? next,
    String? search,
    String? provider,
    String? purpose,
    String? status,
  }) async {
    try {
      final response = await _dio.get(next ?? '/payments/my-payments/',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      print('my payments => ${response.data}');
      print(
          'my payments real uri => ${response.realUri} ${response.statusCode}');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data, (p0) {
          print('po => ${(p0 as Map<String, dynamic>)['products']}');
          return PaymentHistoryModel.fromJson(p0 as Map<String, dynamic>);
        });
      } else {
        throw ServerException(
            errorMessage: response.data, statusCode: response.statusCode ?? 0);
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
  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      final response = await _dio.post('/auth/password/change/',
          data: {
            'current_password': currentPassword,
            'new_password': newPassword
          },
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (!(response.data['success'] as bool)) {
          throw ServerException(
              errorMessage: LocaleKeys.wrong_old_password,
              statusCode: response.statusCode ?? 0);
        }
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<void> deleteAccount() async {
    try {
      final response = await _dio.delete('/user/profile/delete/',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (!(response.statusCode! >= 200 && response.statusCode! < 300)) {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<GenericPagination<FaqModel>> getFaq({String? next}) async {
    try {
      final response = await _dio.get(next ?? '/faq/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => FaqModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<GenericPagination<CandidateListModel>> getLikedCandidateList(
      {String? next}) async {
    try {
      final response = await _dio.get(next ?? '/doctor/liked/',
          options: (Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          })));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data,
            (p0) => CandidateListModel.fromJson(
                (p0 as Map<String, dynamic>? ?? {})['doctor']));
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<String> sendCodeToPhone({required String phoneNumber}) async {
    try {
      final response = await _dio.post(
        '/confirmation/code/send/',
        data: {
          "type": "phone",
          "phone": phoneNumber,
        },
        options: Options(
          headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as Map<String, dynamic>)['signature'];
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
  Future<String> sendCodeToEmail({required String email}) async {
    try {
      final response = await _dio.post(
        '/confirmation/code/send/',
        data: {
          "type": "email",
          "email": email,
        },
        options: Options(
          headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as Map<String, dynamic>)['signature'];
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
