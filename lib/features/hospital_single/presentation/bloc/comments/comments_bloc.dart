import 'dart:async';

import 'package:anatomica/features/hospital_single/data/models/comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_event.dart';

part 'comments_state.dart';

part 'comments_bloc.freezed.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUseCase getComments;

  CommentsBloc(this.getComments) : super(CommentsState()) {
    on<_GetComments>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress, ));
      final result = await getComments(TypeParameter(id: event.organizationId??-1, next: ''));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, comments: result.right.results));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, ));
      }
    });
  }
}
