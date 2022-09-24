part of 'purchased_article_bloc.dart';


@Freezed()
 class PurchasedArticleEvent with _$PurchasedArticleEvent {
   factory PurchasedArticleEvent.getArticle({ required bool isRefresh})=_GetArticle;
   factory PurchasedArticleEvent.getMoreArticle()=_GetMoreArticle;
 }
