import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/journal/data/models/payment_response_model.dart';
import 'package:anatomica/features/journal/data/models/prices_model.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class PaymentDatasource {
  Future<PaymentResponseModel> orderCreateArticle({
    required int articleId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  });

  Future<PaymentResponseModel> orderCreateJournal({
    required int journalId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  });

  Future<String> checkPaymentStatus({required int id});

  Future<PricesModel> getPrices();

  Future<PaymentResponseModel> payForMonthlySubscription({required int numOfMoths, required String paymentProvider});
}

class PaymentDatasourceImpl extends PaymentDatasource {
  final Dio _dio;

  PaymentDatasourceImpl(this._dio);

  @override
  Future<PaymentResponseModel> orderCreateArticle({
    required int articleId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  }) async {
    try {
      final data = {
        "purpose": "article",
        "products": [
          {"object_type": "article", "object_id": articleId, "price": price}
        ],
        "description": "",
        "provider": paymentProvider,
        "redirect_url": "/"
      };

      if (!isRegistered) {
        if (phoneNumber.isNotEmpty) {
          data.putIfAbsent('phone_number', () => phoneNumber);
        } else if (email.isNotEmpty) {
          data.putIfAbsent('email', () => email);
        } else {
          throw const ServerException(statusCode: 141, errorMessage: LocaleKeys.enter_phone_or_email);
        }
      }
      final response = await _dio.post('/payments/order/create/',
          data: data,
          options:
              Options(headers: isRegistered ? {'Authorization': 'Token ${StorageRepository.getString('token')}'} : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return PaymentResponseModel.fromJson(response.data);
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
  Future<PaymentResponseModel> orderCreateJournal({
    required int journalId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  }) async {
    try {
      final data = {
        "purpose": "jurnal",
        "products": [
          {"object_type": "jurnal", "object_id": journalId, "price": price}
        ],
        "description": "",
        "provider": paymentProvider,
        "redirect_url": "/"
      };
      if (!isRegistered) {
        if (phoneNumber.isNotEmpty && phoneNumber.length >= 13) {
          data.putIfAbsent('phone_number', () => phoneNumber);
        } else if (email.isNotEmpty) {
          data.putIfAbsent('email', () => email);
        } else {
          throw const ServerException(statusCode: 141, errorMessage: LocaleKeys.enter_phone_or_email);
        }
      }
      final response = await _dio.post('/payments/order/create/',
          data: data,
          options:
              Options(headers: isRegistered ? {'Authorization': 'Token ${StorageRepository.getString('token')}'} : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return PaymentResponseModel.fromJson(response.data);
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
  Future<String> checkPaymentStatus({required int id}) async {
    try {
      final response = await _dio.get('/payments/$id/detail/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['status'] as String;
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage:
                  ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'xato').toString());
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : '').toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
          }
        }
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
  Future<PricesModel> getPrices() async {
    try {
      final response = await _dio.get('/payments/prices/',
          options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return PricesModel.fromJson(response.data);
      } else {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage:
                  ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : 'xato').toString());
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage:
                    ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : '').toString());
          } else {
            throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
          }
        }
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
  Future<PaymentResponseModel> payForMonthlySubscription(
      {required int numOfMoths, required String paymentProvider}) async {
    if (paymentProvider.isNotEmpty) {
      try {
        final response = await _dio.post('/payments/subscribe/',
            data: {'month_count': numOfMoths, 'payment_provider': paymentProvider, 'subscribe_type': "journal"},
            options: Options(headers: {'Authorization': 'Token ${StorageRepository.getString('token')}'}));
        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return PaymentResponseModel.fromJson(response.data);
        } else {
          if (response.data is Map) {
            throw ServerException(
                statusCode: response.statusCode!,
                errorMessage: ((response.data as Map).values.isNotEmpty
                        ? (response.data as Map).values.first
                        : LocaleKeys.phone_number_error.tr())
                    .toString());
          } else {
            if (response.data is Map) {
              throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage:
                      ((response.data as Map).values.isNotEmpty ? (response.data as Map).values.first : '').toString());
            } else {
              throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
            }
          }
        }
      } on ServerException {
        rethrow;
      } on DioError {
        throw DioException();
      } on Exception catch (e) {
        throw ParsingException(
          errorMessage: e.toString(),
        );
      }
    } else {
      throw const ParsingException(errorMessage: LocaleKeys.no_payment_provider);
    }
  }
}
