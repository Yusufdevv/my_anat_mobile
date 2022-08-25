import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/datasources/vacancy_remote_datasource.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_list.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());
  serviceLocator.registerLazySingleton(() => AuthenticationRepositoryImpl());
  serviceLocator.registerLazySingleton(() => PaginationDatasource());
serviceLocator.registerLazySingleton(() => VacancyRemoteDataSourceImpl
  (paginationDatasource:serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => VacancyRepositoryImpl(dataSource: serviceLocator<VacancyRemoteDataSourceImpl>()));
  serviceLocator.registerLazySingleton(() => VacancyListUseCase(repository:serviceLocator()));
}
