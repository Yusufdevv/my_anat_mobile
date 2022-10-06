part of 'journal_db_bloc.dart';

class JournalDbState extends Equatable {
  final FormzStatus getJournalStatus;
  final FormzStatus addJournalStatus;
  final List<LocalJournalEntity> localJournals;
  const JournalDbState({
    this.getJournalStatus = FormzStatus.pure,
    this.addJournalStatus = FormzStatus.pure,
    this.localJournals = const [],
  });

  JournalDbState copyWith({
    FormzStatus? getJournalStatus,
    FormzStatus? addJournalStatus,
    List<LocalJournalEntity>? localJournals,
  }) =>
      JournalDbState(
        addJournalStatus: addJournalStatus ?? this.addJournalStatus,
        getJournalStatus: getJournalStatus ?? this.getJournalStatus,
        localJournals: localJournals ?? this.localJournals,
      );

  @override
  List<Object?> get props => [
        getJournalStatus,
        addJournalStatus,
        localJournals,
      ];
}
