import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/profile/domain/entities/faq_entity.dart';
import 'package:anatomica/features/profile/domain/usecases/get_faq_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final GetFaqUseCase _getFaqUseCase;

  FaqBloc({required GetFaqUseCase getFaqUseCase})
      : _getFaqUseCase = getFaqUseCase,
        super(
          const FaqState(status: PaginatorStatus.PAGINATOR_INITIAL, next: null, fetchMore: false, faqs: []),
        ) {
    on<GetFaqs>((event, emit) async {
      emit(state.copyWith(status: PaginatorStatus.PAGINATOR_LOADING));
      final result = await _getFaqUseCase.call(null);
      if (result.isRight) {
        emit(state.copyWith(
            faqs: result.right.results,
            status: PaginatorStatus.PAGINATOR_SUCCESS,
            next: result.right.next,
            fetchMore: result.right.next != null));
      } else {
        emit(state.copyWith(status: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreFaqs>((event, emit) async {
      emit(state.copyWith(status: PaginatorStatus.PAGINATOR_LOADING));
      final result = await _getFaqUseCase.call(state.next);
      if (result.isRight) {
        emit(state.copyWith(
            faqs: [...state.faqs, ...result.right.results],
            status: PaginatorStatus.PAGINATOR_SUCCESS,
            next: result.right.next,
            fetchMore: result.right.next != null));
      } else {
        emit(state.copyWith(status: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
  }
}
