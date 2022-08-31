import 'dart:async';

import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'h_articles_event.dart';
part 'h_articles_state.dart';
part 'h_articles_bloc.freezed.dart';

class HArticlesBloc extends Bloc<HArticlesEvent, HArticlesState> {
  final GetHArticlesUseCase getArticles;
  HArticlesBloc(this.getArticles) : super(HArticlesState()) {
    on<HArticlesEvent>((event, emit) async{
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result =await getArticles(TypeParameter(id: 0, next: ''));
      if(result.isRight){
        emit(state.copyWith(status: FormzStatus.submissionSuccess,articles: result.right.results));
      }else {
        emit(state.copyWith(status: FormzStatus.submissionFailure,));
      }
    });
  }
}
