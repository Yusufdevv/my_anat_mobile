import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'h_articles_bloc.freezed.dart';
part 'h_articles_event.dart';
part 'h_articles_state.dart';

class HArticlesBloc extends Bloc<HArticlesEvent, HArticlesState> {
  final GetHArticlesUseCase getArticles;
  HArticlesBloc(this.getArticles) : super(HArticlesState()) {
    on<_GetArticles>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getArticles(TypeParameter(id: event.organizationId));
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            articles: result.right.results,
            next: result.right.next,
            fetchMore: result.right.next != null,
            organizationId: event.organizationId,
          ),
        );
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreArticles>((event, emit) async {
      final result = await getArticles(TypeParameter(id: state.organizationId, next: state.next));
      if (result.isRight) {
        emit(
          state.copyWith(
            next: result.right.next,
            fetchMore: result.right.next != null,
            articles: [...state.articles, ...result.right.results],
          ),
        );
      }
    });
  }
}
