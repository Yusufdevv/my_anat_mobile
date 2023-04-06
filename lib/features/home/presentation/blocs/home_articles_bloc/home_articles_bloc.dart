import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_articles_bloc.freezed.dart';
part 'home_articles_event.dart';
part 'home_articles_state.dart';

class HomeArticlesBloc extends Bloc<HomeArticlesEvent, HomeArticlesState> {
  HomeArticlesBloc() : super(HomeArticlesState()) {
    on<_GetHomeArticles>((event, emit) {});
    on<_GetMoreHomeArticles>((event, emit) {});
  }

// getHomeArticles(_GetHomeArticles event, Emitter<HomeArticlesState> emit) async {
//   emit(state.copyWith(categoryStatus: FormzStatus.submissionInProgress));
//   final response = await _categoryUseCase.call(null);
//   if (response.isRight) {
//     print('response => ${response.right}');
//     emit(state.copyWith(
//       categoriesNext: response.right.next,
//       categoryStatus: FormzStatus.submissionSuccess,
//       categoriesFetchMore: response.right.next != null,
//       categories: response.right.results,
//     ));
//   }
// }
//
// getMoreHomeArticles(
//     _GetMoreHomeArticles event, Emitter<HomeArticlesState> emit) async {
//   final response = await _categoryUseCase.call(state.categoriesNext);
//   if (response.isRight) {
//     emit(state.copyWith(
//       categoriesNext: response.right.next,
//       categoriesFetchMore: response.right.next != null,
//       categories: [...state.categories, ...response.right.results],
//     ));
//   }
// }
}
