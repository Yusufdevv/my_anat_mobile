import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_article_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_journal_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final OrderCreateArticleUseCase _orderCreateArticleUseCase;
  final OrderCreateJournalUseCase _orderCreateJournalUseCase;
  PaymentBloc({
    required OrderCreateJournalUseCase orderCreateJournalUseCase,
    required OrderCreateArticleUseCase orderCreateArticleUseCase,
  })  : _orderCreateJournalUseCase = orderCreateJournalUseCase,
        _orderCreateArticleUseCase = orderCreateArticleUseCase,
        super(const PaymentState()) {
    on<OrderCreateArticle>((event, emit) async {
      emit(const PaymentState(orderCreateStatus: FormzStatus.submissionInProgress));
      final result = await _orderCreateArticleUseCase.call(OrderCreateParams(
        id: event.articleId,
        price: event.price,
        phoneNumber: event.phone,
        email: event.email,
        isRegistered: event.isRegistered,
        paymentProvider: event.paymentProvider,
      ));
      if (result.isRight) {
        emit(const PaymentState(orderCreateStatus: FormzStatus.submissionSuccess));
        event.onSuccess(result.right);
      } else {
        emit(const PaymentState(orderCreateStatus: FormzStatus.submissionFailure));
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        } else {
          event.onError(result.left.toString());
        }
      }
    });
    on<OrderCreateJournal>((event, emit) async {
      emit(const PaymentState(orderCreateStatus: FormzStatus.submissionInProgress));
      final result = await _orderCreateJournalUseCase.call(OrderCreateParams(
        id: event.journalId,
        price: event.price,
        phoneNumber: event.phone,
        email: event.email,
        isRegistered: event.isRegistered,
        paymentProvider: event.paymentProvider,
      ));
      if (result.isRight) {
        emit(const PaymentState(orderCreateStatus: FormzStatus.submissionSuccess));
        event.onSuccess(result.right);
      } else {
        emit(const PaymentState(orderCreateStatus: FormzStatus.submissionFailure));
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        } else {
          event.onError(result.left.toString());
        }
      }
    });
  }
}
