import 'dart:ui';

import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_comments_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/post_comment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_bloc.freezed.dart';
part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUseCase getComments;
  final PostCommentUseCase _postCommentUseCase;
  final GetDoctorCommentsUseCase _getDoctorCommentsUseCase;

  CommentsBloc(this.getComments,
      {required PostCommentUseCase postCommentUseCase, required GetDoctorCommentsUseCase getDoctorCommentsUseCase})
      : _postCommentUseCase = postCommentUseCase,
        _getDoctorCommentsUseCase = getDoctorCommentsUseCase,
        super(CommentsState()) {
    on<_GetComments>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        organizationId: event.organizationId,
      ));
      final result = await getComments(TypeParameter(id: event.organizationId));
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          comments: result.right.results,
          next: result.right.next,
          fetchMore: result.right.next != null,
          hospitalCommentCount: result.right.count,
        ));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreComments>((event, emit) async {
      final result = await getComments(TypeParameter(id: state.organizationId));
      if (result.isRight) {
        emit(state.copyWith(
          comments: [...state.comments, ...result.right.results],
          next: result.right.next,
          fetchMore: result.right.next != null,
        ));
      }
    });
    on<_GetDoctorComments>((event, emit) async {
      emit(state.copyWith(
        doctorCommentStatus: FormzStatus.submissionInProgress,
        doctorId: event.doctorId,
      ));
      final result = await _getDoctorCommentsUseCase(TypeParameter(id: event.doctorId));
      if (result.isRight) {
        emit(state.copyWith(
          doctorCommentStatus: FormzStatus.submissionSuccess,
          doctorComments: result.right.results,
          doctorCommentNext: result.right.next,
          doctorCommentFetchMore: result.right.next != null,
          doctorCommentCount: result.right.count,
        ));
      } else {
        emit(state.copyWith(
          doctorCommentStatus: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreDoctorComments>((event, emit) async {
      final result = await getComments(TypeParameter(id: state.organizationId));
      if (result.isRight) {
        emit(state.copyWith(
          doctorComments: [...state.doctorComments, ...result.right.results],
          doctorCommentNext: result.right.next,
          doctorCommentFetchMore: result.right.next != null,
        ));
      }
    });
    on<_PostComment>((event, emit) async {
      emit(state.copyWith(postCommentStatus: FormzStatus.submissionInProgress));
      final result = await _postCommentUseCase
          .call(PostCommentParams(comment: event.comment, organizationId: state.organizationId));
      if (result.isRight) {
        emit(state.copyWith(postCommentStatus: FormzStatus.submissionSuccess));
        event.onSuccess();
      } else {
        emit(state.copyWith(postCommentStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
