part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState({
    @Default([]) List categories,
    @Default(FormzStatus.pure) FormzStatus categoryStatus,
    String? categoriesNext,
    @Default(false) bool categoriesFetchMore,
  }) = _CategoryState;
}
