import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/choices.dart';
import 'package:anatomica/features/vacancy/data/models/specization.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:dio/dio.dart';

abstract class VacancyRemoteDataSource {
  final PaginationDatasource paginationDatasource;

  VacancyRemoteDataSource({required this.paginationDatasource, int? organizationId});

  Future<VacancyModel> getVacancyList({required String next});

  Future<TopOrganizationModel> getTopOrganization();

  Future<VacancyListModel> getSingleVacancy({required String slug});

  Future<GenericPagination> getSpecizationList();

  Future<List<VacancyOptionModel>> getVacancyOption();
}

class VacancyRemoteDataSourceImpl extends VacancyRemoteDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  VacancyRemoteDataSourceImpl({required super.paginationDatasource});

  @override
  Future<VacancyModel> getVacancyList({required String next, int? organizationId}) async {
    try {
      const url = '/vacancy/vacancy/list/';

      final Map<String, dynamic> query = {};
      if (organizationId != null) {
        query.putIfAbsent('organization', () => organizationId);
      }
      final result = await paginationDatasource.fetchMore(
        url: url,
        next: next.isNotEmpty?next:null,
        fromJson: VacancyListModel.fromJson,
        query: query,
      );

      final vacancies = VacancyModel(
        next:result.next,
        results: result.results,
        count: result.count,
      );
      print(result.results.length);
      return vacancies;
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw ServerException(
        errorMessage: 'Authentication Repository Dio Error. Error message: ${error.message}',
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
  Future<TopOrganizationModel> getTopOrganization() async {
    final response = await dio.get('/vacancy/vacancy/top-organization/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return TopOrganizationModel.fromJson(response.data);
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<VacancyListModel> getSingleVacancy({required String slug}) async {
    final response = await dio.get('/vacancy/vacancy/$slug/detail/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return VacancyListModel.fromJson(response.data);
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination> getSpecizationList() async {
    final response = await dio.get('/vacancy/vacancy/specization/list/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(response.data, (p0) => SpecizationModel.fromJson);
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<List<VacancyOptionModel>> getVacancyOption() async {
    final response = await dio.get('/vacancy/vacancy/list/');
    response.requestOptions.data;
    print(response.requestOptions.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.requestOptions.data as List)
          .map((e) => VacancyOptionModel.fromJson(e))
          .toList();
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }
}
