import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/journal/data/models/local_journal_model.dart';
import 'package:anatomica/features/journal/domain/entities/local_journal_entity.dart';
import 'package:anatomica/features/journal/domain/usecases/add_journal_to_db_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journals_from_db_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'journal_db_event.dart';
part 'journal_db_state.dart';

class JournalDbBloc extends Bloc<JournalDbEvent, JournalDbState> {
  final GetJournalsFromDbUseCase _getJournalsFromDbUseCase;
  final AddJournalToDbUseCase _addJournalToDbUseCase;
  JournalDbBloc({
    required GetJournalsFromDbUseCase getJournalsFromDbUseCase,
    required AddJournalToDbUseCase addJournalToDbUseCase,
  })  : _getJournalsFromDbUseCase = getJournalsFromDbUseCase,
        _addJournalToDbUseCase = addJournalToDbUseCase,
        super(const JournalDbState()) {
    on<GetJournalsFromDb>((event, emit) async {
      emit(state.copyWith(getJournalStatus: FormzStatus.submissionInProgress));
      final getJournalResult = await _getJournalsFromDbUseCase.call(NoParams());
      if (getJournalResult.isRight) {
        emit(state.copyWith(getJournalStatus: FormzStatus.submissionSuccess, localJournals: getJournalResult.right));
      } else {
        emit(state.copyWith(getJournalStatus: FormzStatus.submissionFailure));
      }
    });
    on<AddJournalToDb>((event, emit) async {
      emit(state.copyWith(addJournalStatus: FormzStatus.submissionInProgress));
      final addJournalToDb = await _addJournalToDbUseCase
          .call(LocalJournalModel(imageUrl: event.imageUrl, journalId: event.journalId, redaction: event.redaction));
      if (addJournalToDb.isRight) {
        emit(state.copyWith(addJournalStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(addJournalStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
