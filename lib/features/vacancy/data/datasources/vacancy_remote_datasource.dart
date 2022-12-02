import 'package:anatomica/core/data/singletons/dio_settings.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_education.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_list.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_work.dart';
import 'package:anatomica/features/vacancy/data/models/category_list.dart';
import 'package:anatomica/features/vacancy/data/models/certificate.dart';
import 'package:anatomica/features/vacancy/data/models/district.dart';
import 'package:anatomica/features/vacancy/data/models/region.dart';
import 'package:anatomica/features/vacancy/data/models/specization.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';
import 'package:dio/dio.dart';

abstract class VacancyRemoteDataSource {
  final PaginationDatasource paginationDatasource;

  VacancyRemoteDataSource({required this.paginationDatasource});

  Future<VacancyModel> getVacancyList(
      {String? next, VacancyParamsEntity? vacancyParamsEntity});

  Future<TopOrganizationModel> getTopOrganization();

  Future<VacancyListModel> getSingleVacancy({required String slug});

  Future<GenericPagination> getSpecizationList();

  Future<List<VacancyOptionModel>> getVacancyOption();

  Future<GenericPagination<VacancyListModel>> getRelatedVacancyList(
      {required String slug});

  Future<GenericPagination<CandidateListModel>> getCandidateList(
      {String? next,
      String? search,
      List<int>? categoryId,
      CandidateListParams? params});

  Future<CandidateSingleModel> getCandidateSingle({required int id});

  Future<GenericPagination<RegionModel>> getRegion({String? next});

  Future<GenericPagination<DistrictModel>> getDistrict({String? next, int? id});

  Future<GenericPagination<CategoryListModel>> getCategoryList({String? next});

  Future<List<VacancyOptionEntity>> getVacancyFilter();

  Future<GenericPagination<CandidateEducationEntity>> getCandidateEducation(
      {required int id});

  Future<GenericPagination<CertificateEntity>> getCandidateCertificate(
      {required int id});

  Future<GenericPagination<CandidateWorkEntity>> getCandidateWork(
      {required int id});

  Future<GenericPagination<CandidateListEntity>> getRelatedCandidateList(
      {required int id});
}

class VacancyRemoteDataSourceImpl extends VacancyRemoteDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  VacancyRemoteDataSourceImpl({required super.paginationDatasource});

  @override
  Future<VacancyModel> getVacancyList(
      {String? next, VacancyParamsEntity? vacancyParamsEntity}) async {
    try {
      const url = '/vacancy/vacancy/list/';
      final Map<String, dynamic> query = {};
      if (vacancyParamsEntity != null) {
        if (vacancyParamsEntity.category != null &&
            vacancyParamsEntity.category!.isNotEmpty) {
          var value = '';
          for (var i = 0; i < vacancyParamsEntity.category!.length; i++) {
            value +=
                '${vacancyParamsEntity.category![i]}${i == vacancyParamsEntity.category!.length - 1 ? '' : ','}';
          }
          query.putIfAbsent('category', () => value);
        }
        if (vacancyParamsEntity.organization != null) {
          query.putIfAbsent(
              'organization', () => vacancyParamsEntity.organization);
        }
        if (vacancyParamsEntity.search != null) {
          query.putIfAbsent('search', () => vacancyParamsEntity.search);
        }
        if (vacancyParamsEntity.salary != null &&
            vacancyParamsEntity.salary!.isNotEmpty) {
          var value = '';
          for (final param in vacancyParamsEntity.salary!) {
            value += '$param,';
          }
          query.putIfAbsent('salary', () => value);
        }
        if (vacancyParamsEntity.experience != null &&
            vacancyParamsEntity.experience!.isNotEmpty) {
          var value = '';
          for (final param in vacancyParamsEntity.experience!) {
            value += '$param,';
          }
          query.putIfAbsent('experience', () => value);
        }
        if (vacancyParamsEntity.district != null &&
            vacancyParamsEntity.district!.isNotEmpty) {
          var value = '';
          for (final param in vacancyParamsEntity.district!) {
            value += '$param,';
          }
          query.putIfAbsent('district', () => value);
        }
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
        errorMessage:
            'Authentication Repository Dio Error. Error message: ${error.message}',
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
    try {
      final response = await dio.get('/vacancy/vacancy/top-organization/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TopOrganizationModel.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<VacancyListModel> getSingleVacancy({required String slug}) async {
    try {
      final response = await dio.get('/vacancy/vacancy/$slug/detail/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return VacancyListModel.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination> getSpecizationList() async {
    try {
      final response = await dio.get('/vacancy/vacancy/specization/list/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data, (p0) => SpecizationModel.fromJson);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<VacancyOptionModel>> getVacancyOption() async {
    try {
      final response = await dio.get('/vacancy/vacancy/list/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      final result = response.requestOptions.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.requestOptions.data as List)
            .map((e) => VacancyOptionModel.fromJson(e))
            .toList();
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<VacancyListModel>> getRelatedVacancyList(
      {required String slug}) async {
    try {
      final response = await dio.get('/vacancy/vacancy/$slug/related/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => VacancyListModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CandidateListModel>> getCandidateList(
      {String? next,
      String? search,
      List<int>? categoryId,
      CandidateListParams? params}) async {
    try {
      final Map<String, dynamic> query = {};
      if (search != null) {
        query.putIfAbsent('search', () => search);
      }
      if (categoryId != null && categoryId.isNotEmpty) {
        var value = '';
        for (var i = 0; i < categoryId.length; i++) {
          value += '${categoryId[i]}${i == categoryId.length - 1 ? '' : ','}';
        }
        query.putIfAbsent('specialization', () => value);
      }
      if (params?.experience != null) {
        var value = '';
        for (final param in params!.experience!) {
          value += '$param,';
        }
        query.putIfAbsent('experience', () => value);
      }
      if (params?.district != null) {
        var value = '';
        for (final param in params!.district!) {
          value += '$param,';
        }
        query.putIfAbsent('district', () => value);
      }
      final response = await dio.get(next ?? '/doctor/open-to-work/',
          queryParameters: query,
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CandidateListModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<CandidateSingleModel> getCandidateSingle({required int id}) async {
    try {
      final response = await dio.get('/doctor/$id/detail/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return CandidateSingleModel.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<DistrictModel>> getDistrict(
      {String? next, int? id}) async {
    try {
      final Map<String, dynamic> query = {};
      if (id != null) {
        query.putIfAbsent('region', () => id);
      }
      final response = await dio.get(next ?? '/district/',
          queryParameters: query,
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => DistrictModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<RegionModel>> getRegion({String? next}) async {
    try {
      final response = await dio.get(next ?? '/region/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}),
          queryParameters: {'limit': 6});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => RegionModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CategoryListModel>> getCategoryList(
      {String? next}) async {
    try {
      final response = await dio.get(next ?? '/vacancy/vacancy/specization/list/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CategoryListModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<VacancyOptionEntity>> getVacancyFilter() async {
    try {
      final response = await dio.get('/vacancy/vacancy/filters/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List)
            .map((e) => VacancyOptionModel.fromJson(e))
            .toList();
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CertificateEntity>> getCandidateCertificate(
      {required int id}) async {
    try {
      final response = await dio.get('/doctor/$id/certificates/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CertificateModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CandidateEducationEntity>> getCandidateEducation(
      {required int id}) async {
    try {
      final response = await dio.get('/doctor/$id/education/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {
                    'Authorization':
                        'Token ${StorageRepository.getString('token')}'
                  }
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(
            response.data,
            (p0) =>
                CandidateEducationModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CandidateWorkEntity>> getCandidateWork(
      {required int id}) async {
    try {
      final response = await dio.get('/doctor/$id/work/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CandidateWorkModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CandidateListEntity>> getRelatedCandidateList(
      {required int id}) async {
    try {
      final response = await dio.get('/doctor/$id/related/',
          options: Options(
              headers: StorageRepository.getString('token').isNotEmpty
                  ? {
                      'Authorization':
                          'Token ${StorageRepository.getString('token')}'
                    }
                  : {}));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CandidateListModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
