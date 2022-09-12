part of 'h_articles_bloc.dart';


@Freezed()
 class HArticlesEvent with _$HArticlesEvent {
   factory HArticlesEvent.getArticles({int? organizationId})=_GetArticles;
}
