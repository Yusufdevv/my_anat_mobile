import 'package:anatomica/features/common/domain/usecases/like_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_vacancy_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_doctor_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/unlike_vacancy_usecase.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final LikeDoctorUseCase _likeDoctorUseCase;
  final UnlikeDoctorUseCase _unlikeDoctorUseCase;
  final UnlikeVacancyUseCase _unlikeVacancyUseCase;
  final LikeVacancyUseCase _likeVacancyUseCase;
  FavouriteBloc({
    required LikeDoctorUseCase likeDoctorUseCase,
    required UnlikeDoctorUseCase unlikeDoctorUseCase,
    required LikeVacancyUseCase likeVacancyUseCase,
    required UnlikeVacancyUseCase unlikeVacancyUseCase,
  })  : _likeVacancyUseCase = likeVacancyUseCase,
        _unlikeVacancyUseCase = unlikeVacancyUseCase,
        _unlikeDoctorUseCase = unlikeDoctorUseCase,
        _likeDoctorUseCase = likeDoctorUseCase,
        super(const FavouriteState()) {
    on<LikeUnlikeVacancy>((event, emit) async {
      if (event.vacancy.isFavorite) {
        emit(const FavouriteState(isFavourite: false));
        await _unlikeVacancyUseCase.call(event.vacancy);
        emit(const FavouriteState(isFavourite: null));
      } else {
        emit(const FavouriteState(isFavourite: true));
        await _likeVacancyUseCase.call(event.vacancy);
        emit(const FavouriteState(isFavourite: null));
      }
    });
  }
}
