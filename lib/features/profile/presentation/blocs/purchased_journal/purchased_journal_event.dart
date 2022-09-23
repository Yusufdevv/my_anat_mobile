part of 'purchased_journal_bloc.dart';


@Freezed()
class PurchasedJournalEvent with _$PurchasedJournalEvent {
  factory PurchasedJournalEvent.getArticle({ required bool isRefresh})=_GetJournal;
  factory PurchasedJournalEvent.getMoreArticle()=_GetMoreJournal;
}
