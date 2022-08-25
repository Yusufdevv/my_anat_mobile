import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/auth/data/datasources/authentication_data_source.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());
  serviceLocator.registerLazySingleton(() => AuthenticationDataSourceImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(
      () => AuthenticationRepositoryImpl(dataSource: serviceLocator<AuthenticationDataSourceImpl>()));
}
