import 'dart:developer';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:dio/dio.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://panel.anatomica.uz/api/v1',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: <String, dynamic>{
      // TODO  default accept language must be 'uz'
      'Accept-Language': StorageRepository.getString(StoreKeys.language, defValue: 'ru')
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    log(':::::::::: set base options:  ${lang}  ::::::::::');
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

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      request: true,
      requestHeader: true,
    ));
    return dio;
  }
}
