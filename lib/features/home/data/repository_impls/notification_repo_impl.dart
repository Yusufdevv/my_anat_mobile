import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/datasources/notification_datasource.dart';
import 'package:anatomica/features/home/data/models/device_id_model.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class NotificationRepoImpl extends NotificationRepository {
  final NotificationDatasource datasource;

  NotificationRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, GenericPagination<NotificationModel>>>
      getNotifications({String? next}) async {
    try {
      final result = await datasource.getNotifications(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotificationSingle(
      {required int id}) async {
    try {
      final result = await datasource.getNotificationSingle(id: id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> readAllNotificattions() async {
    try {
      final result = await datasource.readAllNotificattions();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> readNotification({required int id}) async {
    try {
      final result = await datasource.readNotification(id: id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, DeviceIdModel>> postDeviceId({required int id}) async {
    try {
      final result = await datasource.postDeviceId(id: id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
