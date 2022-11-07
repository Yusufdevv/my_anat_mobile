import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_hospital_specialists_usecase.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_specialist_bloc.freezed.dart';
part 'hospital_specialist_event.dart';
part 'hospital_specialist_state.dart';

class HospitalSpecialistBloc extends Bloc<HospitalSpecialistEvent, HospitalSpecialistState> {
  final GetHospitalSpecialistsUseCase getSpecialists;

  HospitalSpecialistBloc(this.getSpecialists) : super(HospitalSpecialistState()) {
    on<_GetSpecialists>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));

      final result = await getSpecialists(TypeParameter(id: event.organizationId));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          specialists: result.right.results,
          next: result.right.next,
          fetchMore: result.right.next != null,
          organizationId: event.organizationId,
        ));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreSpecialists>((event, emit) async {
      final result = await getSpecialists(TypeParameter(id: state.organizationId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            paginationStatus: FormzStatus.submissionSuccess,
            next: result.right.next,
            fetchMore: result.right.next != null,
            specialists: [...state.specialists, ...result.right.results],
          ),
        );
      }
    });
  }
}
