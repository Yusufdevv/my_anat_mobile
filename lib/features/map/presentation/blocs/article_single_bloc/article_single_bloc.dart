import 'package:anatomica/features/journal/domain/entities/journal_article_single.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_single_bloc.freezed.dart';
part 'article_single_event.dart';
part 'article_single_state.dart';

class ArticleSingleBloc extends Bloc<ArticleSingleEvent, ArticleSingleState> {
  final GetJournalArticleSingleUseCase _getJournalArticleSingleUseCase;
  ArticleSingleBloc({required GetJournalArticleSingleUseCase getJournalArticleSingleUseCase})
      : _getJournalArticleSingleUseCase = getJournalArticleSingleUseCase,
        super(ArticleSingleState()) {
    on<_GetSingleArticle>((event, emit) async {
      emit(state.copyWith(getSingleStatus: FormzStatus.submissionInProgress));
      final result = await _getJournalArticleSingleUseCase.call(event.slug);
      if (result.isRight) {
        emit(state.copyWith(getSingleStatus: FormzStatus.submissionSuccess, articleSingle: result.right));
      } else {
        emit(state.copyWith(getSingleStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
