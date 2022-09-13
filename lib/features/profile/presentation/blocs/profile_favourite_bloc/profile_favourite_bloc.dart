import 'dart:async';

import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_doctor_stream_usecase.dart';
import 'package:anatomica/features/common/domain/usecases/like_unlike_vacancy_stream_usecase.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/domain/usecases/get_liked_candidates_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_liked_vacancies_usecase.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_favourite_event.dart';
part 'profile_favourite_state.dart';

class ProfileFavouriteBloc extends Bloc<ProfileFavouriteEvent, ProfileFavouriteState> {
  final GetLikedVacanciesUseCase _getLikedVacanciesUseCase;
  final GetLikedCandidatesUseCase _getLikedCandidatesUseCase;
  final LikeUnlikeVacancyStreamUseCase _likeUnlikeVacancyStreamUseCase;
  final LikeUnlikeDoctorStreamUseCase _likeUnlikeDoctorStreamUseCase;
  late StreamSubscription<VacancyListEntity> vacancyLikeSubscription;
  late StreamSubscription<CandidateListEntity> candidateLikeSubscription;
  ProfileFavouriteBloc({
    required GetLikedCandidatesUseCase getLikedCandidatesUseCase,
    required GetLikedVacanciesUseCase getLikedVacanciesUseCase,
    required LikeUnlikeVacancyStreamUseCase likeUnlikeVacancyStreamUseCase,
    required LikeUnlikeDoctorStreamUseCase likeUnlikeDoctorStreamUseCase,
  })  : _getLikedCandidatesUseCase = getLikedCandidatesUseCase,
        _getLikedVacanciesUseCase = getLikedVacanciesUseCase,
        _likeUnlikeDoctorStreamUseCase = likeUnlikeDoctorStreamUseCase,
        _likeUnlikeVacancyStreamUseCase = likeUnlikeVacancyStreamUseCase,
        super(const ProfileFavouriteState()) {
    vacancyLikeSubscription = _likeUnlikeVacancyStreamUseCase.call(NoParams()).listen((event) {
      add(AddRemoveLikedVacancies(vacancy: event));
    });
    candidateLikeSubscription = _likeUnlikeDoctorStreamUseCase.call(NoParams()).listen((event) {
      add(AddRemoveLikedCandidates(candidate: event));
    });
    on<AddRemoveLikedCandidates>((event, emit) {
      if (event.candidate.isFavorite) {
        final newList = [...state.likedCandidates];
        newList.add(event.candidate);
        emit(state.copyWith(likedCandidates: newList));
      } else {
        final newList = [...state.likedCandidates];
        newList.removeWhere((vacancy) => vacancy.id == event.candidate.id);
        emit(state.copyWith(likedCandidates: newList));
      }
    });
    on<AddRemoveLikedVacancies>((event, emit) {
      if (event.vacancy.isFavorite) {
        final newList = [...state.likedVacancies];
        newList.add(event.vacancy);
        emit(state.copyWith(likedVacancies: newList));
      } else {
        final newList = [...state.likedVacancies];
        newList.removeWhere((vacancy) => vacancy.id == event.vacancy.id);
        emit(state.copyWith(likedVacancies: newList));
      }
    });
    on<GetLikedVacancies>((event, emit) async {
      emit(state.copyWith(vacancyStatus: PaginatorStatus.PAGINATOR_LOADING));
      final result = await _getLikedVacanciesUseCase.call(null);
      if (result.isRight) {
        emit(
          state.copyWith(
            vacancyStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            vacancyFetchMore: result.right.next != null,
            vacancyNext: result.right.next,
            likedVacancies: result.right.results,
          ),
        );
      } else {
        emit(
          state.copyWith(vacancyStatus: PaginatorStatus.PAGINATOR_ERROR),
        );
      }
    });
    on<GetMoreLikedVacancies>((event, emit) async {
      final result = await _getLikedVacanciesUseCase.call(state.vacancyNext);
      if (result.isRight) {
        emit(
          state.copyWith(
            vacancyStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            vacancyFetchMore: result.right.next != null,
            vacancyNext: result.right.next,
            likedVacancies: [...state.likedVacancies, ...result.right.results],
          ),
        );
      }
    });
    on<GetLikedCandidates>((event, emit) async {
      emit(state.copyWith(candidateStatus: PaginatorStatus.PAGINATOR_LOADING));
      final result = await _getLikedCandidatesUseCase.call(null);
      if (result.isRight) {
        emit(
          state.copyWith(
            candidateStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            candidateFetchMore: result.right.next != null,
            candidateNext: result.right.next,
            likedCandidates: result.right.results,
          ),
        );
      } else {
        emit(
          state.copyWith(candidateStatus: PaginatorStatus.PAGINATOR_ERROR),
        );
      }
    });
    on<GetMoreLikedCandidates>((event, emit) async {
      final result = await _getLikedCandidatesUseCase.call(state.candidateNext);
      if (result.isRight) {
        emit(
          state.copyWith(
            candidateStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            candidateFetchMore: result.right.next != null,
            candidateNext: result.right.next,
            likedCandidates: [...state.likedCandidates, ...result.right.results],
          ),
        );
      }
    });
  }
}
