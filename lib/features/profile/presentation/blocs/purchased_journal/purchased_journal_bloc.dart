import 'package:anatomica/features/profile/data/models/purchased_journal.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_journal.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchased_journal_bloc.freezed.dart';
part 'purchased_journal_event.dart';
part 'purchased_journal_state.dart';

class PurchasedJournalBloc
    extends Bloc<PurchasedJournalEvent, PurchasedJournalState> {
  final GetPurchasedJournalUS getJournals;

  PurchasedJournalBloc(this.getJournals) : super(PurchasedJournalState()) {
    on<_GetJournal>((event, emit) async {
      if (event.isRefresh == false) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }

      final result = await getJournals('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            journals: result.right.results));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreJournal>((event, emit) async {
      emit(state.copyWith(paginationStatus: FormzStatus.submissionInProgress));
      final result = await getJournals(state.next);
      if (result.isRight) {
        emit(state.copyWith(
            paginationStatus: FormzStatus.submissionSuccess,
            journals: [
              ...state.journals,
              ...result.right.results,
            ]));
      } else {
        emit(state.copyWith(paginationStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
