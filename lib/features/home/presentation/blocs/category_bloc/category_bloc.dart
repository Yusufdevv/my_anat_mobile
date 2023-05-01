import 'dart:async';

import 'package:anatomica/features/home/domain/entities/category_entity.dart';
import 'package:anatomica/features/home/domain/usecases/category_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/get_organizations_usecase.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase _categoryUseCase = CategoryUsecase();
  final GetOrganizationsUsecase organizationsUsecase = GetOrganizationsUsecase();

  CategoryBloc() : super(CategoryState()) {
    on<_GetCategories>(_getCategories);
    on<_GetMoreCategories>(_getMoreCategories);
    on<_GetOrganizations>(_getOrganizations);
    on<_GetMoreOrganizations>(_getMoreOrganizations);
    on<_ChangeCrossFade>(_changeCrossFade);
  }
  FutureOr<void> _changeCrossFade(_ChangeCrossFade event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(categoriesCrossFade: event.crossFade));
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

  _getMoreCategories(_GetMoreCategories event, Emitter<CategoryState> emit) async {
    final response = await _categoryUseCase.call(state.categoriesNext);
    if (response.isRight) {
      emit(state.copyWith(
        categoriesNext: response.right.next,
        categoriesFetchMore: response.right.next != null,
        categories: [...state.categories, ...response.right.results],
      ));
    }
  }

  _getOrganizations(_GetOrganizations event, Emitter<CategoryState> emit) async {
    final int v = event.type;
    final int type = state.categories[event.type].id;
    emit(state.copyWith(organizationsStatus: FormzStatus.submissionInProgress, selectedCategory: event.type));
    final response = await organizationsUsecase.call(OrganizationParams(type: type));
    if (response.isRight) {
      emit(state.copyWith(
        organizationsNext: response.right.next,
        organizationsStatus: FormzStatus.submissionSuccess,
        organizationsFetchMore: response.right.next != null,
        organizations: response.right.results,
      ));
    }
  }

  _getMoreOrganizations(_GetMoreOrganizations event, Emitter<CategoryState> emit) async {
    final int type = state.categories[state.selectedCategory].id;

    final response = await organizationsUsecase.call(OrganizationParams(type: type, next: state.organizationsNext));
    if (response.isRight) {
      emit(state.copyWith(
        organizationsNext: response.right.next,
        organizationsFetchMore: response.right.next != null,
        organizations: [
          ...state.organizations,
          ...response.right.results,
        ],
      ));
    }
  }
}
