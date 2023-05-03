import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/models/payment_history_model.dart';
import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:anatomica/features/profile/domain/entities/uploaded_image_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<Failure, UserEntity>> getProfile();

  Future<Either<Failure, void>> deleteAccount();

  Future<Either<Failure, void>> editProfile(Map<String, dynamic> data);

  Future<Either<Failure, String>> sendCodeToPhone({required String phone});

  Future<Either<Failure, String>> sendCodeToEmail({required String email});

  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword});

  Future<Either<Failure, UploadedImageEntity>> uploadImg(FormData formData);

  Future<Either<Failure, GenericPagination<FaqEntity>>> getFaq({String? next});

  Future<Either<Failure, GenericPagination<CandidateListEntity>>>
      getLikedCandidate({String? next});

  Future<Either<Failure, GenericPagination<VacancyListEntity>>> getLikedVacancy(
      {String? next});

  Future<Either<Failure, GenericPagination<PaymentHistoryModel>>>
      getMyPayments({
    String? next,
    String? search,
    String? provider,
    String? purpose,
    String? status,
  });

  Future<Either<Failure, void>> verifyOtpCode({
    required String type,
    required String signature,
    required String code,
    String? phone,
    String? email,
  });
}
