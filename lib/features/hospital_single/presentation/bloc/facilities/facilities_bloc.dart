import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facilities_bloc.freezed.dart';
part 'facilities_event.dart';
part 'facilities_state.dart';

class FacilitiesBloc extends Bloc<FacilitiesEvent, FacilitiesState> {
  final GetComfortsUseCase getComforts;

  FacilitiesBloc(this.getComforts) : super(FacilitiesState()) {
    on<_GetFacilities>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getComforts(TypeParameter(id: event.organizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            comforts: result.right.results,
            next: result.right.next,
            organizationId: event.organizationId,
            facilityCount: result.right.count,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreFacilities>((event, emit) async {
      final result = await getComforts(TypeParameter(id: state.organizationId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            comforts: [...state.comforts, ...result.right.results],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
}
