import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_article_single.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_single_entity.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_single_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journale_single_articles_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/search_journal_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final GetJournalUseCase _getJournalUseCase = GetJournalUseCase(
    repository: serviceLocator<JournalRepositoryImpl>(),
  );
  final GetJournalArticlesUseCase _getJournalArticlesUseCase = GetJournalArticlesUseCase(
    repository: serviceLocator<JournalRepositoryImpl>(),
  );
  final GetJournalArticleSingleUseCase _getJournalArticleSingleUseCase = GetJournalArticleSingleUseCase(
    repository: serviceLocator<JournalRepositoryImpl>(),
  );
  final GetJournalSingleArticlesUseCase _getJournalSingleArticlesUseCase = GetJournalSingleArticlesUseCase(
    repository: serviceLocator<JournalRepositoryImpl>(),
  );
  final GetJournalSingleUseCase _getJournalSingleUseCase = GetJournalSingleUseCase(
    repository: serviceLocator<JournalRepositoryImpl>(),
  );
  JournalBloc() : super(const JournalState()) {
    on<GetJournals>((event, emit) async {
      emit(state.copyWith(status: PaginatorStatus.PAGINATOR_LOADING));
      final results = await _getJournalUseCase.call(null);
      if (results.isRight) {
        emit(
          state.copyWith(
            journals: results.right.results,
            status: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: results.right.next != null,
            next: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreJournals>((event, emit) async {
      final results = await _getJournalUseCase.call(state.next);
      if (results.isRight) {
        emit(
          state.copyWith(
            journals: [...state.journals, ...results.right.results],
            status: PaginatorStatus.PAGINATOR_SUCCESS,
            fetchMore: results.right.next != null,
            next: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: PaginatorStatus.PAGINATOR_ERROR));
      }
    });

    on<GetJournalArticles>((event, emit) async {
      emit(state.copyWith(journalArticleStatus: PaginatorStatus.PAGINATOR_LOADING));
      final results = await _getJournalArticlesUseCase.call(const SearchParams(query: ''));
      if (results.isRight) {
        emit(
          state.copyWith(
            journalArticles: results.right.results,
            journalArticleStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            journalArticleFetchMore: results.right.next != null,
            journalArticleNext: results.right.next,
          ),
        );
        if (results.right.results.isNotEmpty) {
          add(GetFirstArticleDetail(slug: results.right.results.first.slug));
        }
      } else {
        emit(state.copyWith(journalArticleStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreJournalArticles>((event, emit) async {
      final results = await _getJournalArticlesUseCase.call(SearchParams(query: '', next: state.journalArticleNext));
      if (results.isRight) {
        emit(
          state.copyWith(
            journalArticles: [...state.journalArticles, ...results.right.results],
            journalArticleStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            journalArticleFetchMore: results.right.next != null,
            journalArticleNext: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(journalArticleStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetFirstArticleDetail>((event, emit) async {
      emit(state.copyWith(getFirstArticleStatus: FormzStatus.submissionInProgress));
      final result = await _getJournalArticleSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(state.copyWith(getFirstArticleStatus: FormzStatus.submissionSuccess, firstArticle: result.right));
      } else {
        emit(state.copyWith(getFirstArticleStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetJournalSingleArticles>((event, emit) async {
      emit(state.copyWith(journalSingleArticleStatus: PaginatorStatus.PAGINATOR_LOADING));
      final results = await _getJournalSingleArticlesUseCase.call(JournalSingleArticleParams(id: event.id));
      if (results.isRight) {
        emit(
          state.copyWith(
            journalSingleArticles: results.right.results,
            journalSingleArticleStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            journalSingleArticleFetchMore: results.right.next != null,
            journalSingleArticleNext: results.right.next,
          ),
        );
        if (results.right.results.isNotEmpty) {
          add(GetFirstArticleDetail(slug: results.right.results.first.slug));
        }
      } else {
        emit(state.copyWith(journalSingleArticleStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreJournalSingleArticles>((event, emit) async {
      final results = await _getJournalSingleArticlesUseCase
          .call(JournalSingleArticleParams(id: event.id, next: state.journalSingleArticleNext));
      if (results.isRight) {
        emit(
          state.copyWith(
            journalSingleArticles: [...state.journalArticles, ...results.right.results],
            journalSingleArticleStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            journalSingleArticleFetchMore: results.right.next != null,
            journalSingleArticleNext: results.right.next,
          ),
        );
      } else {
        emit(state.copyWith(journalSingleArticleStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetSingleArticle>((event, emit) async {
      emit(state.copyWith(articleSingleStatus: FormzStatus.submissionInProgress));
      final result = await _getJournalArticleSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(state.copyWith(articleSingleStatus: FormzStatus.submissionSuccess, articleSingle: result.right));
      } else {
        emit(
          state.copyWith(articleSingleStatus: FormzStatus.submissionFailure),
        );
      }
    });
    on<GetJournalSingle>((event, emit) async {
      emit(state.copyWith(getJournalSingleStatus: FormzStatus.submissionInProgress));
      final result = await _getJournalSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(state.copyWith(getJournalSingleStatus: FormzStatus.submissionSuccess, journalSingle: result.right));
      } else {
        emit(
          state.copyWith(getJournalSingleStatus: FormzStatus.submissionFailure),
        );
      }
    });
  }
}
