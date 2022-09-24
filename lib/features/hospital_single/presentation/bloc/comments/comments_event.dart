part of 'comments_bloc.dart';

@Freezed()
class CommentsEvent with _$CommentsEvent {
  factory CommentsEvent.getComments({required int organizationId}) = _GetComments;

  factory CommentsEvent.getMoreComments() = _GetMoreComments;

  factory CommentsEvent.getDoctorComments({required int doctorId}) = _GetDoctorComments;

  factory CommentsEvent.getMoreDoctorComments() = _GetMoreDoctorComments;

  factory CommentsEvent.postComment(
      {required PostCommentEntity comment, required VoidCallback onSuccess}) = _PostComment;

  factory CommentsEvent.sendDoctorComment({
    required int doctor,
    required double rating,
    required String comment,
    required Function onSuccess,
    required Function(String message) onError,
  }) = _SendDoctorComment;

  factory CommentsEvent.deleteDoctorComment(
      {required int id,
      required Function onSuccess,
      required Function onError}) = _DeleteDoctorComment;

  factory CommentsEvent.deleteHospitalComment(
      {required int id,
      required Function onSuccess,
      required Function onError}) = _DeleteHospitalComment;
}
