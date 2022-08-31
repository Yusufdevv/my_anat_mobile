part of 'h_articles_bloc.dart';

@Freezed()
 class HArticlesState with _$HArticlesState {
   factory HArticlesState ({
     @Default([]) List<JournalArticleEntity> articles,
     @Default(FormzStatus.pure) FormzStatus status,
     @Default(0) int  count,
     @Default('') String   next,
 })=_HArticlesState;
 }


