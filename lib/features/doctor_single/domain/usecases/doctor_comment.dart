import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_comment.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:equatable/equatable.dart';

class DoctorCommentUseCase extends UseCase<DoctorCommentEntity, DoctorCommentParams> {
  final DoctorSingleRepository repository;

  DoctorCommentUseCase({required this.repository});

  @override
  Future<Either<Failure, DoctorCommentEntity>> call(DoctorCommentParams params) async {
    return await repository.sendDoctorComment(
      doctor: params.doctor,
      rating: params.rating,
      comment: params.comment,
    );
  }
}

class DoctorCommentParams extends Equatable {
  final int doctor;
  final double rating;
  final String comment;

  const DoctorCommentParams({
    required this.comment,
    required this.doctor,
    required this.rating,
  });

  @override
  List<Object?> get props => [comment, rating, doctor];
}
