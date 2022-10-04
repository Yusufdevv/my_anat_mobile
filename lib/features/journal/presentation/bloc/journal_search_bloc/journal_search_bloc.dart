import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/search_journal_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'journal_search_event.dart';
part 'journal_search_state.dart';

class JournalSearchBloc extends Bloc<JournalSearchEvent, JournalSearchState> {
  final SearchJournalUseCase _searchJournalUseCase;
  final GetJournalArticlesUseCase _getJournalArticlesUseCase;
  JournalSearchBloc({
    required SearchJournalUseCase searchJournalUseCase,
    required GetJournalArticlesUseCase getJournalArticlesUseCase,
  })  : _searchJournalUseCase = searchJournalUseCase,
        _getJournalArticlesUseCase = getJournalArticlesUseCase,
        super(const JournalSearchState()) {
    on<SearchJournals>((event, emit) async {
      if (event.query.isNotEmpty) {
        emit(state.copyWith(searchStatus: PaginatorStatus.PAGINATOR_LOADING));
        final results = await _searchJournalUseCase.call(SearchParams(query: event.query));
        if (results.isRight) {
          emit(
            state.copyWith(
              searchJournals: results.right.results,
              searchStatus: PaginatorStatus.PAGINATOR_SUCCESS,
              searchFetchMore: results.right.next != null,
              searchNext: results.right.next,
            ),
          );
        } else {
          emit(state.copyWith(searchStatus: PaginatorStatus.PAGINATOR_ERROR));
        }
      } else {
        emit(
          state.copyWith(
            searchJournals: [],
            searchStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          ),
        );
      }
    }, transformer: restartable());
    on<MoreSearchJournals>((event, emit) async {
      emit(state.copyWith(searchStatus: PaginatorStatus.PAGINATOR_LOADING));
      final results = await _searchJournalUseCase.call(SearchParams(query: '', next: state.searchNext));
      if (results.isRight) {
        emit(
          state.copyWith(
            searchJournals: [...state.searchJournals, ...results.right.results],
            searchStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            searchFetchMore: results.right.next != null,
            searchNext: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(searchStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    }, transformer: droppable());
    on<SearchArticles>((event, emit) async {
      if (event.query.isNotEmpty) {
        emit(state.copyWith(searchArticleStatus: FormzStatus.submissionInProgress, query: event.query));
        final results = await _getJournalArticlesUseCase.call(SearchParams(query: event.query));
        if (results.isRight) {
          emit(
            state.copyWith(
              searchArticles: results.right.results,
              searchArticleStatus: FormzStatus.submissionSuccess,
              searchArticleFetchMore: results.right.next != null,
              searchArticleNext: results.right.next,
            ),
          );
        } else {
          emit(state.copyWith(searchArticleStatus: FormzStatus.submissionFailure));
        }
      } else {
        emit(
          state.copyWith(
            searchArticles: [],
            searchArticleStatus: FormzStatus.submissionSuccess,
          ),
        );
      }
    }, transformer: restartable());
    on<MoreSearchArticles>((event, emit) async {
      final results =
          await _getJournalArticlesUseCase.call(SearchParams(query: state.articleQuery, next: state.searchArticleNext));
      if (results.isRight) {
        emit(
          state.copyWith(
            searchArticles: [...state.searchArticles, ...results.right.results],
            searchArticleStatus: FormzStatus.submissionSuccess,
            searchArticleFetchMore: results.right.next != null,
            searchArticleNext: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(searchArticleStatus: FormzStatus.submissionFailure));
      }
    }, transformer: droppable());
  }
}
