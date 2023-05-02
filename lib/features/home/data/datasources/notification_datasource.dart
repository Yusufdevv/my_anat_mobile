import 'dart:developer';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/home/data/models/device_id_model.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/data/models/unread_notifications_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class NotificationDatasource {
  Future<GenericPagination<NotificationModel>> getNotifications({String? next});

  Future<NotificationModel> getNotificationSingle({required int id});

  Future<void> readAllNotificattions();

  Future<UnreadNotificationsModel> unreadNotifications();

  Future<void> readNotification({required int id});

  Future<DeviceIdModel> postDeviceId({required int id});
}

class NotificationDatasourceImpl extends NotificationDatasource {
  final Dio dio;

  NotificationDatasourceImpl({required this.dio});

  @override
  Future<GenericPagination<NotificationModel>> getNotifications(
      {String? next}) async {
    try {
      final response = await dio.get(
        next ?? '/notifications/',
        options: Options(headers: {
          'Authorization':
              'Token ${StorageRepository.getString(StoreKeys.token)}'
        }),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => NotificationModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<NotificationModel> getNotificationSingle({required int id}) async {
    try {
      final response = await dio.get('/notifications/$id/',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        log('notification result => ${response.data}');
        log('notification result after fromJson => ${NotificationModel.fromJson(response.data)}');
        return NotificationModel.fromJson(response.data);
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
  Future<void> readAllNotificattions() async {
    try {
      final response = await dio.post('/notifications/read-all/',
          options: Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          }));
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
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<UnreadNotificationsModel> unreadNotifications() async {
    try {
      final response = await dio.get('/notifications/unread/',
          options: Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return UnreadNotificationsModel.fromJson(response.data);
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
  Future<void> readNotification({required int id}) async {
    try {
      final response = await dio.post('/notifications/$id/read/',
          options: Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          }));
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
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<DeviceIdModel> postDeviceId({required int id}) async {
    try {
      final response = await dio.post('/notifications/device-id/',
          data: {"device_id": id},
          options: Options(headers: {
            'Authorization':
                'Token ${StorageRepository.getString(StoreKeys.token)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return DeviceIdModel.fromJson(response.data);
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
}
