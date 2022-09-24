part of 'purchased_article_bloc.dart';


@Freezed()
class PurchasedArticleState with _$PurchasedArticleState {
  factory PurchasedArticleState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default([]) List<PurchasedArticleModel> articles,
    @Default(0) int count,
    String? next,
  }) = _PurchasedArticleState;
}
