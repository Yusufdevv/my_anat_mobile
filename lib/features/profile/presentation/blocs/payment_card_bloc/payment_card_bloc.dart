import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:anatomica/features/profile/domain/usecases/confirm_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/create_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/delete_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_payment_cards_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'payment_card_event.dart';

part 'payment_card_state.dart';

class PaymentCardBloc extends Bloc<PaymentCardEvent, PaymentCardState> {
  final GetPaymentCardsUseCase _getPaymentCardUsecase =
      GetPaymentCardsUseCase();
  final CreatePaymentCardsUseCase _createPaymentCardsUseCase =
      CreatePaymentCardsUseCase();
  final ConfirmPaymentCardsUseCase _confirmPaymentCardsUseCase =
      ConfirmPaymentCardsUseCase();
  final DeletePaymentCardsUseCase _deletePaymentCardsUseCase =
      DeletePaymentCardsUseCase();

  PaymentCardBloc() : super(const PaymentCardState.empty()) {
    ///
    on<GetPaymentCardsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await _getPaymentCardUsecase.call(null);
      if (result.isRight) {
        emit(state.copyWith(
            paymentCards: result.right.results,
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: (FormzStatus.submissionFailure)));
      }
    });

    ///
    on<CreatePaymentCardEvent>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));
      final result = await _createPaymentCardsUseCase.call(CreateCardParam(
          expireDate: event.param.expireDate,
          cardNumber: event.param.cardNumber));
      if (result.isRight) {
        event.onSucces();
        emit(state.copyWith(secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError((result.left as DioError).message);
        emit(state.copyWith(secondStatus: (FormzStatus.submissionFailure)));
      }
    });

    ///
    on<ConfirmPaymentCardEvent>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));
      final result = await _confirmPaymentCardsUseCase.call(ConfirmCardParam(
        session: event.param.session,
        otp: event.param.otp,
        cardNumber: event.param.cardNumber,
      ));
      if (result.isRight) {
        event.onSucces();

        emit(state.copyWith(secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError((result.left as DioError).message);
        emit(state.copyWith(secondStatus: FormzStatus.submissionFailure));
      }
    });

    ///
    on<DeletePaymentCard>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));

      final result = await _deletePaymentCardsUseCase.call(event.id);
      if (result.isRight) {
        final cards = state.paymentCards;
        final index =
            state.paymentCards.indexWhere((element) => element.id == event.id);
        cards.removeAt(index);
        emit(state.copyWith(
            paymentCards: [...cards],
            secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError((result.left as DioError).message);
        emit(state.copyWith(secondStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
