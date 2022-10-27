import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'journal_pages_event.dart';
part 'journal_pages_state.dart';

class JournalPagesBloc extends Bloc<JournalPagesEvent, JournalPagesState> {
  final GetJournalPagesUseCase _getJournalPagesUseCase;
  JournalPagesBloc({required GetJournalPagesUseCase getJournalPagesUseCase})
      : _getJournalPagesUseCase = getJournalPagesUseCase,
        super(const JournalPagesState()) {
    on<GetJournalPages>((event, emit) async {
      emit(state.copyWith(getJournalPagesStatus: FormzStatus.submissionInProgress, slug: event.slug));
      final result = await _getJournalPagesUseCase.call(JournalPagesParams(slug: event.slug));
      if (result.isRight) {
        // final directory = await getApplicationDocumentsDirectory();
        // for (int i = 0; i < result.right.results.length; i++) {
        //   final file = File('${directory.path}/${event.slug}/page_$i.html');
        //   await file.writeAsString(result.right.results[i].content);
        // }
        emit(
          state.copyWith(
            getJournalPagesStatus: FormzStatus.submissionSuccess,
            pages: result.right.results,
            next: result.right.next,
            fetchMore: result.right.next != null,
            //pagePath: '${directory.path}/${event.slug}',
          ),
        );
      } else {
        emit(state.copyWith(getJournalPagesStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreJournalPages>((event, emit) async {
      final result = await _getJournalPagesUseCase.call(JournalPagesParams(slug: state.slug, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            pages: [...state.pages, ...result.right.results],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
}
