part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  factory NewsState({
    @Default([]) List<NewsModel> news,
    NewsModel? newSingle,
    @Default(FormzStatus.pure) FormzStatus newsStatus,
    @Default(FormzStatus.pure) FormzStatus newSingleStatus,
    String? newsNext,
    @Default(false) bool newsFetchMore,
  }) = _NewsState;
}
