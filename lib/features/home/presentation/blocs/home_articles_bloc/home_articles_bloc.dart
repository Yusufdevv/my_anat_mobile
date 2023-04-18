import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/home/data/models/banner_model.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/usecases/banners_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/top_articles_usecase.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_articles_bloc.freezed.dart';
part 'home_articles_event.dart';
part 'home_articles_state.dart';

class HomeArticlesBloc extends Bloc<HomeArticlesEvent, HomeArticlesState> {
  final TopArticlesUsecase _topArticlesUsecase =
      TopArticlesUsecase(repository: serviceLocator<HomeRepoImpl>());
  final BannersUsecase _bannersUsecase =
      BannersUsecase();

  HomeArticlesBloc() : super(HomeArticlesState()) {
    on<_GetHomeArticles>(_getHomeArticles);
    on<_GetMoreHomeArticles>(_getMoreHomeArticles);
    on<_GetBanners>(_getBanners);
    on<_GetMoreBanners>(_getMoreBanners);
  }

  _getHomeArticles(
      _GetHomeArticles event, Emitter<HomeArticlesState> emit) async {
    emit(state.copyWith(homeArticlesStatus: FormzStatus.submissionInProgress));
    final response = await _topArticlesUsecase.call(null);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(state.copyWith(
        homeArticlesNext: response.right.next,
        homeArticlesStatus: FormzStatus.submissionSuccess,
        homeArticlesFetchMore: response.right.next != null,
        homeArticles: response.right.results,
      ));
    }
  }

  _getMoreHomeArticles(
      _GetMoreHomeArticles event, Emitter<HomeArticlesState> emit) async {
    final response = await _topArticlesUsecase.call(state.homeArticlesNext);
    if (response.isRight) {
      emit(state.copyWith(
        homeArticlesNext: response.right.next,
        homeArticlesFetchMore: response.right.next != null,
        homeArticles: [...state.homeArticles, ...response.right.results],
      ));
    }
  }

  _getBanners(_GetBanners event, Emitter<HomeArticlesState> emit) async {
    emit(state.copyWith(bannersStatus: FormzStatus.submissionInProgress));
    final response = await _bannersUsecase.call(null);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(state.copyWith(
        bannersNext: response.right.next,
        bannersStatus: FormzStatus.submissionSuccess,
        bannersFetchMore: response.right.next != null,
        banners: response.right.results,
      ));
    }
  }

  _getMoreBanners(
      _GetMoreBanners event, Emitter<HomeArticlesState> emit) async {
    final response = await _bannersUsecase.call(state.bannersNext);
    if (response.isRight) {
      emit(state.copyWith(
        bannersNext: response.right.next,
        bannersFetchMore: response.right.next != null,
        banners: [...state.banners, ...response.right.results],
      ));
    }
  }
}
