 
import 'package:anatomica/features/home/data/models/news_model.dart'; 
import 'package:anatomica/features/home/domain/usecases/new_single_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/news_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase newsUseCase =
      NewsUseCase( );
  final NewSingleUseCase _newSingleUseCase =
      NewSingleUseCase( );

  NewsBloc() : super(NewsState()) {
    on<_GetNews>(_getNewsEvent);
    on<_GetMoreNews>(_getMoreNewsEvent);
    on<_GetNewSingle>(_getNewSingle);
  }

  _getNewsEvent(_GetNews event, Emitter<NewsState> emit) async {
    emit(state.copyWith(newsStatus: FormzStatus.submissionInProgress));
    final response = await newsUseCase.call(null);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(state.copyWith(
        newsNext: response.right.next,
        newsStatus: FormzStatus.submissionSuccess,
        newsFetchMore: response.right.next != null,
        news: response.right.results,
      ));
    }
  }

  _getMoreNewsEvent(_GetMoreNews event, Emitter<NewsState> emit) async {
    final response = await newsUseCase.call(state.newsNext);
    if (response.isRight) {
      emit(state.copyWith(
        newsNext: response.right.next,
        newsFetchMore: response.right.next != null,
        news: [...state.news, ...response.right.results],
      ));
    }
  }

  _getNewSingle(_GetNewSingle event, Emitter<NewsState> emit) async {
    emit(state.copyWith(newSingleStatus: FormzStatus.submissionInProgress));
    final response = await _newSingleUseCase.call(event.slug);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(
        state.copyWith(
          newSingleStatus: FormzStatus.submissionSuccess,
          newSingle: response.right,
        ),
      );
    }
  }
}
