part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState({
    @Default(<CategoryEntity>[]) List<CategoryEntity> categories,
    @Default(<OrgMapV2Model>[]) List<OrgMapV2Model> organizations,
    @Default(FormzStatus.pure) FormzStatus categoryStatus,
    @Default(FormzStatus.pure) FormzStatus organizationsStatus,
    String? categoriesNext,
    String? organizationsNext,
    @Default(false) bool categoriesFetchMore,
    @Default(false) bool organizationsFetchMore,
    @Default(-1) int selectedCategory,
  }) = _CategoryState;
}
