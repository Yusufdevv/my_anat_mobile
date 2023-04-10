import 'package:anatomica/features/profile/data/models/craete_card_response_model.dart';
import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:anatomica/features/profile/domain/usecases/confirm_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/create_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/delete_payment_cards_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_payment_cards_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'payment_cards_event.dart';

part 'payment_cards_state.dart';

class PaymentCardsBloc extends Bloc<PaymentCardsEvent, PaymentCardsState> {
  final GetPaymentCardsUseCase _getPaymentCardUsecase = GetPaymentCardsUseCase();
  final CreatePaymentCardsUseCase _createPaymentCardsUseCase = CreatePaymentCardsUseCase();
  final ConfirmPaymentCardsUseCase _confirmPaymentCardsUseCase = ConfirmPaymentCardsUseCase();
  final DeletePaymentCardsUseCase _deletePaymentCardsUseCase = DeletePaymentCardsUseCase();

  PaymentCardsBloc() : super(const PaymentCardsState.empty()) {
    ///
    on<GetPaymentCardsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await _getPaymentCardUsecase.call(null);
      if (result.isRight) {
        if (result.right.results.isNotEmpty) {
          emit(state.copyWith(selectedCard: result.right.results[0]));
        }
        emit(state.copyWith(
          paymentCards: result.right.results,
          status: FormzStatus.submissionSuccess,
        ));
      } else {
        emit(state.copyWith(status: (FormzStatus.submissionFailure)));
      }
    });

    ///
    on<CreatePaymentCardEvent>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));
      final result = await _createPaymentCardsUseCase
          .call(CreateCardParam(expireDate: event.param.expireDate, cardNumber: event.param.cardNumber));
      if (result.isRight) {
        event.onSucces();
        emit(state.copyWith(createCardResponseModel: result.right, secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError(result.left.toString());
        emit(state.copyWith(secondStatus: (FormzStatus.submissionFailure)));
      }
    });

    ///
    on<ConfirmPaymentCardEvent>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));
      final result = await _confirmPaymentCardsUseCase.call(ConfirmCardParam(
        session: state.createCardResponseModel?.session ?? 0,
        otp: event.param.otp,
        cardNumber: event.param.cardNumber,
      ));
      if (result.isRight) {
        add(GetPaymentCardsEvent());
        event.onSucces();
        emit(state.copyWith(secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError(result.left.toString());
        emit(state.copyWith(secondStatus: FormzStatus.submissionFailure));
      }
    });

    on<SetSelectedPaymentCardEvent>((event, emit) async {
      final selectedCard = state.paymentCards.firstWhere((element) => element.id == event.id);
      emit(state.copyWith(selectedCard: selectedCard));
      print('selected card id ${state.selectedCard}');
    });

    ///
    on<DeletePaymentCard>((event, emit) async {
      emit(state.copyWith(secondStatus: FormzStatus.submissionInProgress));

      final result = await _deletePaymentCardsUseCase.call(event.id);
      if (result.isRight) {
        final cards = state.paymentCards;
        final index = state.paymentCards.indexWhere((element) => element.id == event.id);
        cards.removeAt(index);
        emit(state.copyWith(paymentCards: [...cards], secondStatus: FormzStatus.submissionSuccess));
      } else {
        event.onError(result.left.toString());
        emit(state.copyWith(secondStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
