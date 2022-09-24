import 'package:anatomica/features/profile/data/models/purchased_article.dart';
import 'package:anatomica/features/profile/domain/usecases/get_purchased_article.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchased_article_event.dart';

part 'purchased_article_state.dart';

part 'purchased_article_bloc.freezed.dart';

class PurchasedArticleBloc
    extends Bloc<PurchasedArticleEvent, PurchasedArticleState> {
  final GetPurchasedArticleUS getArticles;

  PurchasedArticleBloc(this.getArticles) : super(PurchasedArticleState()) {
    on<_GetArticle>((event, emit) async {
      if (event.isRefresh == false) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }

      final result = await getArticles('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            articles: result.right.results));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreArticle>((event, emit) async {
      emit(state.copyWith(paginationStatus: FormzStatus.submissionInProgress));
      final result = await getArticles(state.next);
      if (result.isRight) {
        emit(state.copyWith(
            paginationStatus: FormzStatus.submissionSuccess,
            articles: [...state.articles, ...result.right.results]));
      } else {
        emit(state.copyWith(paginationStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
