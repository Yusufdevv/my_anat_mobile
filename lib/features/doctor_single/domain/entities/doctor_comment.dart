import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DoctorCommentEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0)
  final int doctor;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: '')
  final String comment;

  const DoctorCommentEntity({
    required this.comment,
    required this.rating,
    required this.id,
    required this.doctor,
  });

  @override
  List<Object?> get props => [comment, rating, id, doctor];
}
