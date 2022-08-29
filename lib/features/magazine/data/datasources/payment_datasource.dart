import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

abstract class PaymentDatasource {
  Future<String> orderCreateArticle({
    required int articleId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  });
  Future<String> orderCreateJournal({
    required int journalId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  });
}

class PaymentDatasourceImpl extends PaymentDatasource {
  final Dio _dio;
  PaymentDatasourceImpl(this._dio);
  @override
  Future<String> orderCreateArticle({
    required int articleId,
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
          {"object_type": "jurnal", "object_id": articleId, "price": price}
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
          throw const ServerException(statusCode: 141, errorMessage: 'Telefon yoki emailni kiriting');
        }
      }
      final response = await _dio.post('/payments/order/create/',
          data: data,
          options:
              Options(headers: isRegistered ? {'Authorization': 'Token ${StorageRepository.getString('token')}'} : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['transaction_checkout_url'] as String;
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
  Future<String> orderCreateJournal({
    required int journalId,
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
          {"object_type": "article", "object_id": journalId, "price": price}
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
          throw const ServerException(statusCode: 141, errorMessage: 'Telefon yoki emailni kiriting');
        }
      }
      final response = await _dio.post('/payments/order/create/',
          data: data,
          options:
              Options(headers: isRegistered ? {'Authorization': 'Token ${StorageRepository.getString('token')}'} : {}));
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['transaction_checkout_url'] as String;
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
}
