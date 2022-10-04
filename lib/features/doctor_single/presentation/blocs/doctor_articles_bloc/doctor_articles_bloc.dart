import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_articles_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'doctor_articles_event.dart';
part 'doctor_articles_state.dart';

class DoctorArticlesBloc extends Bloc<DoctorArticlesEvent, DoctorArticlesState> {
  final GetDoctorArticlesUseCase _getDoctorArticlesUseCase;

  DoctorArticlesBloc({required GetDoctorArticlesUseCase getDoctorArticlesUseCase})
      : _getDoctorArticlesUseCase = getDoctorArticlesUseCase,
        super(const DoctorArticlesState()) {
    on<GetDoctorArticles>((event, emit) async {
      emit(state.copyWith(getArticleStatus: FormzStatus.submissionInProgress, doctorId: event.doctorId));
      final result = await _getDoctorArticlesUseCase.call(TypeParameter(id: event.doctorId));
      if (result.isRight) {
        emit(
          state.copyWith(
            articles: result.right.results,
            getArticleStatus: FormzStatus.submissionSuccess,
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(getArticleStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreDoctorArticles>((event, emit) async {
      final result = await _getDoctorArticlesUseCase.call(TypeParameter(id: state.doctorId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            articles: [...state.articles, ...result.right.results],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
}
