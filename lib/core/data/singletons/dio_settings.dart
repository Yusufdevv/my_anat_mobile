import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:dio/dio.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://panel.anatomica.uz/api/v1',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: <String, dynamic>{'Accept-Language': StorageRepository.getString('language', defValue: 'uz')},
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: 'https://panel.anatomica.uz/api/v1',
      connectTimeout: 35000,
      receiveTimeout: 33000,
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions);
}
