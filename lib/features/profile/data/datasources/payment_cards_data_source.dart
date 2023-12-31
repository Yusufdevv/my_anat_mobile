import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/models/craete_card_response_model.dart';
import 'package:anatomica/features/profile/data/models/payment_card_model.dart';
import 'package:dio/dio.dart';

abstract class PaymentCardDatasource {
  Future<GenericPagination<PaymentCardModel>> getPaymentCards({String? next});

  Future<CreateCardResponseModel> createPaymentCards(
      {required String cardNumber, required String expireDate});

  Future<void> deletePaymentCards(int id);

  Future<String> confirmPaymentCards(
      {required int session, required String otp, required String cardNumber});
}

class PaymentCardDatasourceImpl extends PaymentCardDatasource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  PaymentCardDatasourceImpl();

  @override
  Future<GenericPagination<PaymentCardModel>> getPaymentCards(
      {String? next}) async {
    try {
      final response = await _dio.get(next ?? '/payments/GetUserCardList',
          options: (Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          })));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => PaymentCardModel.fromJson((p0 as Map<String, dynamic>)));
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
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
  Future<CreateCardResponseModel> createPaymentCards(
      {required String cardNumber, required String expireDate}) async {
    try {
      final response = await _dio.post('/payments/CreateUserCard',
          data: {
            "card_number": cardNumber,
            "expire_date": expireDate,
          },
          options: (Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          })));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return CreateCardResponseModel.fromJson(response.data);
      } else {
        final errorMessage;
        print('errror => ${response.data}');
        if ((response.data as Map).values.isNotEmpty) {
          if ((response.data as Map).values.first is Map) {
            if (((response.data as Map).values.first as Map).values.first
                is List) {
              errorMessage = (((response.data as Map).values.first as Map)
                      .values
                      .first as List)
                  .first;
            } else {
              errorMessage =
                  ((response.data as Map).values.first as Map).values.first;
            }
          } else if ((response.data as Map).values.first is List) {
            errorMessage = ((response.data as Map).values.first as List).first;
          } else {
            errorMessage = (response.data as Map).values.first;
          }
        } else {
          errorMessage = 'Unknown error';
        }
        throw ServerException(
            errorMessage: errorMessage.toString(),
            statusCode: response.statusCode ?? 0);
      }
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
  Future<String> confirmPaymentCards(
      {required int session,
      required String otp,
      required String cardNumber}) async {
    try {
      final response = await _dio.post('/payments/ConfirmUserCard',
          data: {
            "session": session,
            "otp": otp,
            "card_number": cardNumber,
          },
          options: (Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          })));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return '';
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
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
  Future<void> deletePaymentCards(int id) async {
    try {
      final response = await _dio.delete('/payments/DeleteUserCard/$id',
          options: (Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          })));
      print(' response $response');
      print(' response ${response.statusCode}');
      print(' response ${response.data}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
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
}
