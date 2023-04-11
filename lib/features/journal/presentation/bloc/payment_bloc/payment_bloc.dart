import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/journal/data/repositories/payment_repository_impl.dart';
import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/journal/domain/entities/prices_entity.dart';
import 'package:anatomica/features/journal/domain/usecases/check_payment_status_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_prices_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/order_create_article_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/order_create_journal_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/pay_for_monthly_subscription_usecase.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final OrderCreateArticleUseCase _orderCreateArticleUseCase =
      OrderCreateArticleUseCase(repository: serviceLocator<PaymentRepositoryImpl>());
  final OrderCreateJournalUseCase _orderCreateJournalUseCase =
      OrderCreateJournalUseCase(repository: serviceLocator<PaymentRepositoryImpl>());
  final CheckPaymentStatusUseCase _checkPaymentStatusUseCase =
      CheckPaymentStatusUseCase(repository: serviceLocator<PaymentRepositoryImpl>());
  final GetPricesUseCase _getPricesUseCase = GetPricesUseCase(repository: serviceLocator<PaymentRepositoryImpl>());
  final PayForMonthlySubscriptionUseCase _payForMonthlySubscriptionUseCase =
      PayForMonthlySubscriptionUseCase(repository: serviceLocator<PaymentRepositoryImpl>());

  PaymentBloc() : super(const PaymentState()) {
    on<OrderCreateArticle>((event, emit) async {
      emit(state.copyWith(orderCreateStatus: FormzStatus.submissionInProgress));
      final result = await _orderCreateArticleUseCase.call(OrderCreateParams(
        card: event.card,
        id: event.articleId,
        price: event.price,
        phoneNumber: event.phone,
        email: event.email,
        isRegistered: event.isRegistered,
        paymentProvider: event.paymentProvider,
      ));
      if (result.isRight) {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionSuccess));
        event.onSuccess(result.right.transactionCheckoutUrl);
      } else {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionFailure));
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        } else {
          event.onError(result.left.toString());
        }
      }
    });
    on<CheckPaymentStatus>((event, emit) async {
      emit(state.copyWith(checkPaymentStatus: FormzStatus.submissionInProgress));
      final result = await _checkPaymentStatusUseCase.call(state.paymentId);
      if (result.isRight) {
        emit(state.copyWith(checkPaymentStatus: FormzStatus.submissionSuccess, status: result.right));
      } else {
        emit(state.copyWith(checkPaymentStatus: FormzStatus.submissionFailure));
      }
    });
    on<OrderCreateJournal>((event, emit) async {
      emit(state.copyWith(orderCreateStatus: FormzStatus.submissionInProgress));
      final result = await _orderCreateJournalUseCase.call(OrderCreateParams(
        card: event.card,
        id: event.journalId,
        price: event.price,
        phoneNumber: event.phone,
        email: event.email,
        isRegistered: event.isRegistered,
        paymentProvider: event.paymentProvider,
      ));
      if (result.isRight) {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionSuccess));
        event.onSuccess(result.right.transactionCheckoutUrl);
      } else {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionFailure));
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        } else {
          event.onError(result.left.toString());
        }
      }
    });
    on<GetPrices>((event, emit) async {
      emit(state.copyWith(getPricesStatus: FormzStatus.submissionInProgress));
      final result = await _getPricesUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(getPricesStatus: FormzStatus.submissionSuccess, prices: result.right));
      } else {
        emit(state.copyWith(getPricesStatus: FormzStatus.submissionFailure));
      }
    });
    on<PayForMonthlySubscription>((event, emit) async {
      emit(state.copyWith(orderCreateStatus: FormzStatus.submissionInProgress));
      final result = await _payForMonthlySubscriptionUseCase
          .call(SubscriptionParams(paymentProvider: event.paymentProvider, period: event.period));
      if (result.isRight) {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionSuccess));
        event.onSuccess(result.right);
      } else {
        emit(state.copyWith(orderCreateStatus: FormzStatus.submissionFailure));
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
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
