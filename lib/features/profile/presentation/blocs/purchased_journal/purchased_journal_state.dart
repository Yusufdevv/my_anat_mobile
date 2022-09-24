part of 'purchased_journal_bloc.dart';


@Freezed()
class PurchasedJournalState with _$PurchasedJournalState {
  factory PurchasedJournalState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default([]) List<PurchasedJournalModel> journals,
    @Default(0) int count,
    String? next,
  }) = _PurchasedJournalState;
}
