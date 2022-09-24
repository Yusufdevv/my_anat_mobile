import 'dart:ui';

import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/doctor_comment_delete.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_comments_usecase.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/delete_comment.dart';
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
  final DoctorCommentUseCase _doctorCommentUseCase;
  final DoctorCommentDeleteUseCase _doctorCommentDeleteUseCase;
  final DeletePostCommentUseCase _deletePostCommentUseCase;

  CommentsBloc(
    this.getComments, {
    required PostCommentUseCase postCommentUseCase,
    required GetDoctorCommentsUseCase getDoctorCommentsUseCase,
    required DoctorCommentUseCase doctorCommentUseCase,
    required DoctorCommentDeleteUseCase doctorCommentDeleteUseCase,
    required DeletePostCommentUseCase deletePostCommentUseCase,
  })  : _postCommentUseCase = postCommentUseCase,
        _doctorCommentDeleteUseCase = doctorCommentDeleteUseCase,
        _doctorCommentUseCase = doctorCommentUseCase,
        _deletePostCommentUseCase = deletePostCommentUseCase,
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
    on<_SendDoctorComment>((event, emit) async {
      emit(state.copyWith(sendDoctorCommentStatus: FormzStatus.submissionInProgress));
      final result = await _doctorCommentUseCase.call(DoctorCommentParams(
        comment: event.comment,
        doctor: event.doctor,
        rating: event.rating,
      ));
      if (result.isRight) {
        emit(state.copyWith(doctorCommentStatus: FormzStatus.submissionSuccess));
        event.onSuccess();
      } else {
        emit(state.copyWith(doctorCommentStatus: FormzStatus.submissionFailure));
      }
    });
    on<_DeleteDoctorComment>((event, emit) async {
      final result = await _doctorCommentDeleteUseCase.call(event.id);
      if (result.isRight) {
        event.onSuccess();
      }
    });
    on<_DeleteHospitalComment>((event, emit) async {
      print('event');
      final List<CommentEntity> comment = [...state.comments];
      final result = await _deletePostCommentUseCase.call(event.id);
      if (result.isRight) {
        event.onSuccess();
        comment.removeWhere((element) => element.id == event.id);
        emit(state.copyWith(comments: comment));
      } else {
        event.onError();
        print('event fail');
      }
    });
  }
}
