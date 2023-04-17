import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/usecases/category_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase _categoryUseCase =
      CategoryUsecase(repository: serviceLocator<HomeRepoImpl>());

  CategoryBloc() : super(CategoryState()) {
    on<_GetCategories>(_getCategories);
    on<_GetMoreCategories>(_getMoreCategories);
  }

  _getCategories(_GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(categoryStatus: FormzStatus.submissionInProgress));
    final response = await _categoryUseCase.call(null);
    if (response.isRight) { 
      emit(state.copyWith(
        categoriesNext: response.right.next,
        categoryStatus: FormzStatus.submissionSuccess,
        categoriesFetchMore: response.right.next != null,
        categories: response.right.results,
      ));
    }
  }

  _getMoreCategories(
      _GetMoreCategories event, Emitter<CategoryState> emit) async {
    final response = await _categoryUseCase.call(state.categoriesNext);
    if (response.isRight) {
      emit(state.copyWith(
        categoriesNext: response.right.next,
        categoriesFetchMore: response.right.next != null,
        categories: [...state.categories, ...response.right.results],
      ));
    }
  }
}
