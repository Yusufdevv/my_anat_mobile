part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.getNews() = _GetNews;

  const factory NewsEvent.getMoreNews() = _GetMoreNews;

  const factory NewsEvent.getNewSingle({required String slug}) = _GetNewSingle;
}
