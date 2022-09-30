part of 'article_single_bloc.dart';

@Freezed()
class ArticleSingleState with _$ArticleSingleState {
  factory ArticleSingleState({
    @Default(JournalArticleSingleEntity()) JournalArticleSingleEntity articleSingle,
    @Default(FormzStatus.pure) FormzStatus getSingleStatus,
  }) = _ArticleSingleState;
}
