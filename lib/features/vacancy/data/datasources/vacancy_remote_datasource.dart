import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_list.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/data/models/category_list.dart';
import 'package:anatomica/features/vacancy/data/models/district.dart';
import 'package:anatomica/features/vacancy/data/models/region.dart';
import 'package:anatomica/features/vacancy/data/models/specization.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:dio/dio.dart';

abstract class VacancyRemoteDataSource {
  final PaginationDatasource paginationDatasource;

  VacancyRemoteDataSource({required this.paginationDatasource});

  Future<VacancyModel> getVacancyList(
      {String? next, int? organizationId, String? search, String? category});

  Future<TopOrganizationModel> getTopOrganization();

  Future<VacancyListModel> getSingleVacancy({required String slug});

  Future<GenericPagination> getSpecizationList();

  Future<List<VacancyOptionModel>> getVacancyOption();

  Future<GenericPagination<VacancyListModel>> getRelatedVacancyList({required String slug});

  Future<GenericPagination<CandidateListModel>> getCandidateList({String? next, String? search});

  Future<CandidateSingleModel> getCandidateSingle({required int id});

  Future<GenericPagination<RegionModel>> getRegion({String? next});

  Future<GenericPagination<DistrictModel>> getDistrict({String? next});

  Future<GenericPagination<CategoryListModel>> getCategoryList({String? next});

  Future<List<VacancyOptionEntity>> getVacancyFilter();
}

class VacancyRemoteDataSourceImpl extends VacancyRemoteDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  VacancyRemoteDataSourceImpl({required super.paginationDatasource});

  @override
  Future<VacancyModel> getVacancyList(
      {String? next, int? organizationId, String? search, String? category}) async {
    try {
      const url = '/vacancy/vacancy/list/';
      final Map<String, dynamic> query = {};
      print('search:$search');
      print('category$category');
      if (category != null) {
        query.putIfAbsent('category', () => category);
      }
      if (organizationId != null) {
        query.putIfAbsent('organization', () => organizationId);
      }
      if (search != null) {
        query.putIfAbsent('search', () => search);
      }

      final result = await paginationDatasource.fetchMore(
        url: url,
        next: next,
        fromJson: VacancyListModel.fromJson,
        query: query,
      );

      final vacancies = VacancyModel(
        next: result.next,
        results: result.results,
        count: result.count,
      );
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
    final result = response.requestOptions.data;
    print('optinoiList');
    print('result:$result');
    print(response.statusCode);
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
  Future<GenericPagination<CandidateListModel>> getCandidateList(
      {String? next, String? search}) async {
    final Map<String, dynamic> query = {};
    print('search candidate:$search');
    if (search != null) {
      query.putIfAbsent('search', () => search);
    }
    final response = await dio.get(next ?? '/doctor/', queryParameters: query);

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
  Future<GenericPagination<DistrictModel>> getDistrict({String? next}) async {
    final response = await dio.get('/district/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => DistrictModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination<RegionModel>> getRegion({String? next}) async {
    final response = await dio.get('/region/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => RegionModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<GenericPagination<CategoryListModel>> getCategoryList({String? next}) async {
    final response = await dio.get('/vacancy/vacancy/specization/list/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => CategoryListModel.fromJson(p0 as Map<String, dynamic>));
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }

  @override
  Future<List<VacancyOptionEntity>> getVacancyFilter() async {
    final response = await dio.get('/vacancy/vacancy/filters/');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data as List).map((e) => VacancyOptionModel.fromJson(e)).toList();
    }
    throw ServerException(
        statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
  }
}
