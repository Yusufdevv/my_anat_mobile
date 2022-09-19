import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_interviews_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'doctor_interviews_event.dart';
part 'doctor_interviews_state.dart';

class DoctorInterviewsBloc extends Bloc<DoctorInterviewsEvent, DoctorInterviewsState> {
  final GetDoctorInterviewsUseCase _getDoctorInterviewsUseCase;
  DoctorInterviewsBloc({required GetDoctorInterviewsUseCase getDoctorInterviewsUseCase})
      : _getDoctorInterviewsUseCase = getDoctorInterviewsUseCase,
        super(const DoctorInterviewsState()) {
    on<GetDoctorInterviews>((event, emit) async {
      emit(state.copyWith(getInterviewStatus: FormzStatus.submissionInProgress, doctorId: event.doctorId));
      final result = await _getDoctorInterviewsUseCase.call(TypeParameter(id: event.doctorId));
      if (result.isRight) {
        emit(
          state.copyWith(
            interviews: result.right.results,
            getInterviewStatus: FormzStatus.submissionSuccess,
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(getInterviewStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreDoctorInterviews>((event, emit) async {
      final result = await _getDoctorInterviewsUseCase.call(TypeParameter(id: state.doctorId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            interviews: [...state.interviews, ...result.right.results],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
}
