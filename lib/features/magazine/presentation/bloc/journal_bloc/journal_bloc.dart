import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_entity.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/search_journal_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final GetJournalUseCase _getJournalUseCase;
  final SearchJournalUseCase _searchJournalUseCase;
  JournalBloc({
    required GetJournalUseCase getJournalUseCase,
    required SearchJournalUseCase searchJournalUseCase,
  })  : _getJournalUseCase = getJournalUseCase,
        _searchJournalUseCase = searchJournalUseCase,
        super(const JournalState()) {
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
    on<SearchJournals>((event, emit) async {
      if (event.query.isNotEmpty) {
        emit(state.copyWith(searchStatus: PaginatorStatus.PAGINATOR_LOADING));
        final results = await searchJournalUseCase.call(SearchParams(query: event.query));
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
      final results = await searchJournalUseCase.call(SearchParams(query: '', next: state.searchNext));
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
  }
}
