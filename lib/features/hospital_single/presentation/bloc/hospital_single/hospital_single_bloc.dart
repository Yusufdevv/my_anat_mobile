import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository_impl.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_hospital.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_single_bloc.freezed.dart';
part 'hospital_single_event.dart';
part 'hospital_single_state.dart';

class HospitalSingleBloc extends Bloc<HospitalSingleEvent, HospitalSingleState> {
  final GetSingleHospitalUseCase useCase =
      GetSingleHospitalUseCase(repository: serviceLocator<HospitalSingleRepositoryImpl>());

  HospitalSingleBloc() : super(HospitalSingleState()) {
    on<_GetHospital>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.slug);
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess, hospital: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
