 
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/home/domain/usecases/most_popular_doctors_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/most_popular_orgs_usecase.dart';
import 'package:anatomica/features/map/data/models/doctor_map_model.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'most_populars_bloc.freezed.dart';
part 'most_populars_event.dart';
part 'most_populars_state.dart';

class MostPopularsBloc extends Bloc<MostPopularsEvent, MostPopularsState> {
  final MostPopularOrgsUsecase _mostPopularOrgsUsecase =
      MostPopularOrgsUsecase( );
  final MostPopularDoctorsUsecase _mostPopularDoctorsUsecase =
      MostPopularDoctorsUsecase( );

  MostPopularsBloc() : super(MostPopularsState()) {
    on<_GetPopularDoctors>(_getPopularDoctors);
    on<_GetMorePopularDoctors>(_getMorePopularDoctors);
    on<_GetPopularOrgs>(_getPopularOrgs);
    on<_GetMorePopularOrgs>(_getMorePopularOrgs);
  }

  _getPopularDoctors(
      _GetPopularDoctors event, Emitter<MostPopularsState> emit) async {
    emit(
        state.copyWith(popularDoctorsStatus: FormzStatus.submissionInProgress));
    final response = await _mostPopularDoctorsUsecase.call(null);
    if (response.isRight) { 
      emit(state.copyWith(
        popularDoctorsNext: response.right.next,
        popularDoctorsStatus: FormzStatus.submissionSuccess,
        popularDoctorsFetchMore: response.right.next != null,
        popularDoctors: response.right.results,
      ));
    }
  }

  _getMorePopularDoctors(
      _GetMorePopularDoctors event, Emitter<MostPopularsState> emit) async {
    final response =
        await _mostPopularDoctorsUsecase.call(state.popularDoctorsNext);
    if (response.isRight) {
      emit(state.copyWith(
        popularDoctorsNext: response.right.next,
        popularDoctorsFetchMore: response.right.next != null,
        popularDoctors: [...state.popularDoctors, ...response.right.results],
      ));
    }
  }

  _getPopularOrgs(
      _GetPopularOrgs event, Emitter<MostPopularsState> emit) async {
    emit(state.copyWith(popularOrgsStatus: FormzStatus.submissionInProgress));
    final response = await _mostPopularOrgsUsecase.call(null);
    if (response.isRight) { 
      emit(state.copyWith(
        popularOrgsNext: response.right.next,
        popularOrgsStatus: FormzStatus.submissionSuccess,
        popularOrgsFetchMore: response.right.next != null,
        popularOrgs: response.right.results,
      ));
    }
  }

  _getMorePopularOrgs(
      _GetMorePopularOrgs event, Emitter<MostPopularsState> emit) async {
    final response = await _mostPopularOrgsUsecase.call(state.popularOrgsNext);
    if (response.isRight) {
      emit(state.copyWith(
        popularOrgsNext: response.right.next,
        popularOrgsFetchMore: response.right.next != null,
        popularOrgs: [...state.popularOrgs, ...response.right.results],
      ));
    }
  }
}
