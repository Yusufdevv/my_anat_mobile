import 'dart:async';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_outline_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_table_of_contents.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'journal_pages_event.dart';
part 'journal_pages_state.dart';

class JournalPagesBloc extends Bloc<JournalPagesEvent, JournalPagesState> {
  final GetJournalPagesUseCase _getJournalPagesUseCase;
  final GetJournalContentsUseCase _getJournalContentsUseCase;

  JournalPagesBloc({
    required GetJournalPagesUseCase getJournalPagesUseCase,
    required GetJournalContentsUseCase getJournalContentsUseCase,
  })  : _getJournalPagesUseCase = getJournalPagesUseCase,
        _getJournalContentsUseCase = getJournalContentsUseCase,
        super(const JournalPagesState()) {
    on<JournalUpgradeFontSizeEvent>(_upgradeFontSize);
    on<JournalDownGradeFontSizeEvent>(_downgradeFontSize);
    on<GetJournalPages>((event, emit) async {
      emit(state.copyWith(getJournalPagesStatus: FormzStatus.submissionInProgress, slug: event.slug));
      final result = await _getJournalPagesUseCase.call(JournalPagesParams(slug: event.slug));

      if (result.isRight) {
        for (var i = 0; i < result.right.results.length; i++) {}
        emit(
          state.copyWith(
            getJournalPagesStatus: FormzStatus.submissionSuccess,
            pages: result.right.results
                .map((e) => e.remizeContents(fontSize: fontSizesInPixels[state.fontSizeIndex]))
                .toList(),
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(getJournalPagesStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreJournalPages>((event, emit) async {
      final result = await _getJournalPagesUseCase.call(JournalPagesParams(slug: state.slug, next: state.next));
      if (result.isRight) {
        print('results next => ${result.right.next}');
        emit(
          state.copyWith(
            pages: [
              ...state.pages,
              ...result.right.results
                  .map((e) => e.remizeContents(fontSize: fontSizesInPixels[state.fontSizeIndex]))
                  .toList()
            ],
            next: result.right.next,
            fetchMore: result.right.next != null,
          ),
        );
      }
    });
    on<GetJournalTableOfContents>((event, emit) async {
      emit(state.copyWith(getJournalContentsStatus: FormzStatus.submissionInProgress, slug: event.slug));
      final result = await _getJournalContentsUseCase.call(JournalPagesParams(slug: event.slug));
      if (result.isRight) {
        emit(
          state.copyWith(
            getJournalContentsStatus: FormzStatus.submissionSuccess,
            contents: result.right.results,
            contentsNext: result.right.next,
            contentsFetchMore: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(getJournalContentsStatus: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreJournalTableOfContents>((event, emit) async {
      final result = await _getJournalContentsUseCase.call(JournalPagesParams(slug: state.slug, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            contents: [...state.contents, ...result.right.results],
            contentsNext: result.right.next,
            contentsFetchMore: result.right.next != null,
          ),
        );
      }
    });
  }
  FutureOr<void> _upgradeFontSize(JournalUpgradeFontSizeEvent event, Emitter<JournalPagesState> emit) async {
    if (state.fontSizeIndex > 5) return;
    final size = state.fontSizeIndex + 1;
    emit(state.copyWith(
        fontSizeIndex: size, pages: state.pages.map((e) => e.setSize(fontSize: fontSizesInPixels[size])).toList()));
  }

  FutureOr<void> _downgradeFontSize(JournalDownGradeFontSizeEvent event, Emitter<JournalPagesState> emit) async {
    if (state.fontSizeIndex < 1) return;
    final size = state.fontSizeIndex - 1;
    emit(state.copyWith(
        fontSizeIndex: size, pages: state.pages.map((e) => e.setSize(fontSize: fontSizesInPixels[size])).toList()));
  }
}

const List<int> sizesInPercentage = [
  50,
  70,
  90,
  100,
  110,
  130,
  150,
];
const List<double> fontSizesInPixels = [
  8.0,
  11.2,
  14.4,
  16.0,
  17.6,
  20.8,
  24.0,
];
