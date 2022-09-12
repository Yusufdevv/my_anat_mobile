import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_certificate.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/usecases/related_candidate.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';

part 'candidate_single_event.dart';

part 'candidate_single_state.dart';

class CandidateSingleBloc extends Bloc<CandidateSingleEvent, CandidateSingleState> {
  final CandidateSingleUseCase candidateSingleUseCase;
  final CandidateCertificateUseCase candidateCertificateUseCase;
  final CandidateEducationUseCase candidateEducationUseCase;
  final CandidateWorkUseCase candidateWorkUseCase;
  final RelatedCandidateListUseCase relatedCandidateListUseCase;

  CandidateSingleBloc({
    required this.candidateSingleUseCase,
    required this.candidateWorkUseCase,
    required this.candidateCertificateUseCase,
    required this.candidateEducationUseCase,
    required this.relatedCandidateListUseCase,
  }) : super(
          CandidateSingleState(
            status: FormzStatus.pure,
            candidate: CandidateSingleModel.fromJson(const {}),
            workEntity: const [],
            educationList: const [],
            certificateList: const [],
            workStatus: FormzStatus.pure,
            educationStatus: FormzStatus.pure,
            certificateStatus: FormzStatus.pure,
            candidateList: const [],
            fetchMore: false,
            paginatorStatus: PaginatorStatus.PAGINATOR_LOADING,
          ),
        ) {
    on<GetCandidateSingleEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await candidateSingleUseCase.call(CandidateSingleParams(id: event.id));
      if (result.isRight) {
        print('right ${state.candidate.position}');
        emit(state.copyWith(status: FormzStatus.submissionSuccess, candidate: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<CandidateCertificateEvent>((event, emit) async {
      emit(state.copyWith(certificateStatus: FormzStatus.submissionInProgress));
      final response = await candidateCertificateUseCase.call(event.id);
      if (response.isRight) {
        emit(state.copyWith(
          certificateStatus: FormzStatus.submissionSuccess,
          certificateList: response.right.results,
        ));
      } else {
        emit(state.copyWith(certificateStatus: FormzStatus.submissionFailure));
      }
    });
    on<CandidateEducationEvent>((event, emit) async {
      emit(state.copyWith(educationStatus: FormzStatus.submissionInProgress));
      final response = await candidateEducationUseCase.call(event.id);
      if (response.isRight) {
        emit(state.copyWith(
          educationStatus: FormzStatus.submissionSuccess,
          educationList: response.right.results,
        ));
      } else {
        emit(state.copyWith(educationStatus: FormzStatus.submissionSuccess));
      }
    });
    on<CandidateWorkEvent>((event, emit) async {
      emit(state.copyWith(workStatus: FormzStatus.submissionInProgress));
      final response = await candidateWorkUseCase.call(event.id);
      if (response.isRight) {
        print('right');
        emit(
          state.copyWith(
              workStatus: FormzStatus.submissionSuccess,
              workEntity: response.right.results.cast<CandidateWorkEntity>()),
        );
      } else {
        print('left');
        emit(state.copyWith(workStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetRelatedCandidateListEvent>((event, emit) async {
      final response = await relatedCandidateListUseCase.call(event.id);
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          fetchMore: result.next != null,
          next: result.next,
          candidateList: result.results.cast<CandidateListEntity>(),
        ));
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreRelatedCandidateListEvent>((event, emit) async {
      final response = await relatedCandidateListUseCase.call(event.id);
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          paginatorStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          next: result.next,
          fetchMore: result.next != null,
          candidateList: [...state.candidateList, ...result.results],
        ));
      } else {
        emit(state.copyWith(paginatorStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
  }
}
