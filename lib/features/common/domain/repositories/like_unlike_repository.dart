import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

abstract class LikeUnlikeRepository {
  Stream<VacancyListEntity> likeUnlikeVacancyStream();
  Stream<CandidateListEntity> likeUnlikeDoctorStream();
  Future<Either<Failure, void>> likeVacancy(VacancyListEntity vacancy);
  Future<Either<Failure, void>> unlikeVacancy(VacancyListEntity vacancy);
  Future<Either<Failure, void>> likeDoctor(CandidateListEntity doctor);
  Future<Either<Failure, void>> unlikeDoctor(CandidateListEntity doctor);
}
