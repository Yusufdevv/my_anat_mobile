import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_list.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/data/models/district.dart';
import 'package:anatomica/features/vacancy/data/models/region.dart';
import 'package:anatomica/features/vacancy/data/models/specization.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_option.dart';
import 'package:dio/dio.dart';

abstract class VacancyRemoteDataSource {
  final PaginationDatasource paginationDatasource;

  VacancyRemoteDataSource({required this.paginationDatasource, int? organizationId});

  Future<VacancyModel> getVacancyList({required int next});

  Future<TopOrganizationModel> getTopOrganization();

  Future<VacancyListModel> getSingleVacancy({required String slug});

  Future<GenericPagination> getSpecizationList();

  Future<List<VacancyOptionModel>> getVacancyOption();

  Future<GenericPagination<VacancyListModel>> getRelatedVacancyList({required String slug});

  Future<GenericPagination<CandidateListModel>> getCandidateList();

  Future<CandidateSingleModel> getCandidateSingle({required int id});

  Future<GenericPagination<RegionModel>> getRegion();

  Future<GenericPagination<DistrictModel>> getDistrict();
}

class VacancyRemoteDataSourceImpl extends VacancyRemoteDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  VacancyRemoteDataSourceImpl({required super.paginationDatasource});

  @override
  Future<VacancyModel> getVacancyList({required int next, int? organizationId}) async {
    try {
      const url = '/vacancy/vacancy/list/';

      final Map<String, dynamic> query = {};
      if (organizationId != null) {
        query.putIfAbsent('organization', () => organizationId);
      }
      final result = await paginationDatasource.fetchMore(
        url: url,
        page: next,
        fromJson: VacancyListModel.fromJson,
        query: query,
      );

      final vacancies = VacancyModel(
        currentPage: result.currentPage,
        totalPages: result.totalPages,
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

  @override
  Future<GenericPagination<VacancyListModel>> getRelatedVacancyList({required String slug}) async {
    final response = await dio.get('/vacancy/vacancy/$slug/related/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => VacancyListModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination<CandidateListModel>> getCandidateList() async {
    final response = await dio.get('/doctor/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => CandidateListModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<CandidateSingleModel> getCandidateSingle({required int id}) async {
    final response = await dio.get('/doctor/$id/detail/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return CandidateSingleModel.fromJson(response.data);
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination<DistrictModel>> getDistrict() async {
    final response = await dio.get('/district/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => DistrictModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination<RegionModel>> getRegion() async {
    final response = await dio.get('/region/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => RegionModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }
}
