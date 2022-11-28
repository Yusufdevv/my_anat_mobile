// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEventCopyWith<$Res> {
  factory $CommentsEventCopyWith(
          CommentsEvent value, $Res Function(CommentsEvent) then) =
      _$CommentsEventCopyWithImpl<$Res, CommentsEvent>;
}

/// @nodoc
class _$CommentsEventCopyWithImpl<$Res, $Val extends CommentsEvent>
    implements $CommentsEventCopyWith<$Res> {
  _$CommentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCommentsCopyWith<$Res> {
  factory _$$_GetCommentsCopyWith(
          _$_GetComments value, $Res Function(_$_GetComments) then) =
      __$$_GetCommentsCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_GetComments>
    implements _$$_GetCommentsCopyWith<$Res> {
  __$$_GetCommentsCopyWithImpl(
      _$_GetComments _value, $Res Function(_$_GetComments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetComments(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetComments implements _GetComments {
  _$_GetComments({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString() {
    return 'CommentsEvent.getComments(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetComments &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCommentsCopyWith<_$_GetComments> get copyWith =>
      __$$_GetCommentsCopyWithImpl<_$_GetComments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return getComments(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return getComments?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return getComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(this);
    }
    return orElse();
  }
}

abstract class _GetComments implements CommentsEvent {
  factory _GetComments({required final int organizationId}) = _$_GetComments;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetCommentsCopyWith<_$_GetComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreCommentsCopyWith<$Res> {
  factory _$$_GetMoreCommentsCopyWith(
          _$_GetMoreComments value, $Res Function(_$_GetMoreComments) then) =
      __$$_GetMoreCommentsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_GetMoreComments>
    implements _$$_GetMoreCommentsCopyWith<$Res> {
  __$$_GetMoreCommentsCopyWithImpl(
      _$_GetMoreComments _value, $Res Function(_$_GetMoreComments) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreComments implements _GetMoreComments {
  _$_GetMoreComments();

  @override
  String toString() {
    return 'CommentsEvent.getMoreComments()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreComments);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return getMoreComments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return getMoreComments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getMoreComments != null) {
      return getMoreComments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return getMoreComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return getMoreComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getMoreComments != null) {
      return getMoreComments(this);
    }
    return orElse();
  }
}

abstract class _GetMoreComments implements CommentsEvent {
  factory _GetMoreComments() = _$_GetMoreComments;
}

/// @nodoc
abstract class _$$_GetDoctorCommentsCopyWith<$Res> {
  factory _$$_GetDoctorCommentsCopyWith(_$_GetDoctorComments value,
          $Res Function(_$_GetDoctorComments) then) =
      __$$_GetDoctorCommentsCopyWithImpl<$Res>;
  @useResult
  $Res call({int doctorId});
}

/// @nodoc
class __$$_GetDoctorCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_GetDoctorComments>
    implements _$$_GetDoctorCommentsCopyWith<$Res> {
  __$$_GetDoctorCommentsCopyWithImpl(
      _$_GetDoctorComments _value, $Res Function(_$_GetDoctorComments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
  }) {
    return _then(_$_GetDoctorComments(
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetDoctorComments implements _GetDoctorComments {
  _$_GetDoctorComments({required this.doctorId});

  @override
  final int doctorId;

  @override
  String toString() {
    return 'CommentsEvent.getDoctorComments(doctorId: $doctorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctorComments &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDoctorCommentsCopyWith<_$_GetDoctorComments> get copyWith =>
      __$$_GetDoctorCommentsCopyWithImpl<_$_GetDoctorComments>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return getDoctorComments(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return getDoctorComments?.call(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getDoctorComments != null) {
      return getDoctorComments(doctorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return getDoctorComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return getDoctorComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getDoctorComments != null) {
      return getDoctorComments(this);
    }
    return orElse();
  }
}

abstract class _GetDoctorComments implements CommentsEvent {
  factory _GetDoctorComments({required final int doctorId}) =
      _$_GetDoctorComments;

  int get doctorId;
  @JsonKey(ignore: true)
  _$$_GetDoctorCommentsCopyWith<_$_GetDoctorComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreDoctorCommentsCopyWith<$Res> {
  factory _$$_GetMoreDoctorCommentsCopyWith(_$_GetMoreDoctorComments value,
          $Res Function(_$_GetMoreDoctorComments) then) =
      __$$_GetMoreDoctorCommentsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreDoctorCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_GetMoreDoctorComments>
    implements _$$_GetMoreDoctorCommentsCopyWith<$Res> {
  __$$_GetMoreDoctorCommentsCopyWithImpl(_$_GetMoreDoctorComments _value,
      $Res Function(_$_GetMoreDoctorComments) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreDoctorComments implements _GetMoreDoctorComments {
  _$_GetMoreDoctorComments();

  @override
  String toString() {
    return 'CommentsEvent.getMoreDoctorComments()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreDoctorComments);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return getMoreDoctorComments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return getMoreDoctorComments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getMoreDoctorComments != null) {
      return getMoreDoctorComments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return getMoreDoctorComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return getMoreDoctorComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (getMoreDoctorComments != null) {
      return getMoreDoctorComments(this);
    }
    return orElse();
  }
}

abstract class _GetMoreDoctorComments implements CommentsEvent {
  factory _GetMoreDoctorComments() = _$_GetMoreDoctorComments;
}

/// @nodoc
abstract class _$$_PostCommentCopyWith<$Res> {
  factory _$$_PostCommentCopyWith(
          _$_PostComment value, $Res Function(_$_PostComment) then) =
      __$$_PostCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({PostCommentEntity comment, VoidCallback onSuccess});
}

/// @nodoc
class __$$_PostCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_PostComment>
    implements _$$_PostCommentCopyWith<$Res> {
  __$$_PostCommentCopyWithImpl(
      _$_PostComment _value, $Res Function(_$_PostComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_PostComment(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as PostCommentEntity,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_PostComment implements _PostComment {
  _$_PostComment({required this.comment, required this.onSuccess});

  @override
  final PostCommentEntity comment;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'CommentsEvent.postComment(comment: $comment, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostComment &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.onSuccess, onSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, comment, const DeepCollectionEquality().hash(onSuccess));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      __$$_PostCommentCopyWithImpl<_$_PostComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return postComment(comment, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return postComment?.call(comment, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(comment, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return postComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(this);
    }
    return orElse();
  }
}

abstract class _PostComment implements CommentsEvent {
  factory _PostComment(
      {required final PostCommentEntity comment,
      required final VoidCallback onSuccess}) = _$_PostComment;

  PostCommentEntity get comment;
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendDoctorCommentCopyWith<$Res> {
  factory _$$_SendDoctorCommentCopyWith(_$_SendDoctorComment value,
          $Res Function(_$_SendDoctorComment) then) =
      __$$_SendDoctorCommentCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int doctor,
      double rating,
      String comment,
      Function onSuccess,
      dynamic Function(String) onError});
}

/// @nodoc
class __$$_SendDoctorCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_SendDoctorComment>
    implements _$$_SendDoctorCommentCopyWith<$Res> {
  __$$_SendDoctorCommentCopyWithImpl(
      _$_SendDoctorComment _value, $Res Function(_$_SendDoctorComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctor = null,
    Object? rating = null,
    Object? comment = null,
    Object? onSuccess = null,
    Object? onError = null,
  }) {
    return _then(_$_SendDoctorComment(
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
    ));
  }
}

/// @nodoc

class _$_SendDoctorComment implements _SendDoctorComment {
  _$_SendDoctorComment(
      {required this.doctor,
      required this.rating,
      required this.comment,
      required this.onSuccess,
      required this.onError});

  @override
  final int doctor;
  @override
  final double rating;
  @override
  final String comment;
  @override
  final Function onSuccess;
  @override
  final dynamic Function(String) onError;

  @override
  String toString() {
    return 'CommentsEvent.sendDoctorComment(doctor: $doctor, rating: $rating, comment: $comment, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendDoctorComment &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, doctor, rating, comment, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendDoctorCommentCopyWith<_$_SendDoctorComment> get copyWith =>
      __$$_SendDoctorCommentCopyWithImpl<_$_SendDoctorComment>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return sendDoctorComment(doctor, rating, comment, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return sendDoctorComment?.call(doctor, rating, comment, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (sendDoctorComment != null) {
      return sendDoctorComment(doctor, rating, comment, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return sendDoctorComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return sendDoctorComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (sendDoctorComment != null) {
      return sendDoctorComment(this);
    }
    return orElse();
  }
}

abstract class _SendDoctorComment implements CommentsEvent {
  factory _SendDoctorComment(
      {required final int doctor,
      required final double rating,
      required final String comment,
      required final Function onSuccess,
      required final dynamic Function(String) onError}) = _$_SendDoctorComment;

  int get doctor;
  double get rating;
  String get comment;
  Function get onSuccess;
  dynamic Function(String) get onError;
  @JsonKey(ignore: true)
  _$$_SendDoctorCommentCopyWith<_$_SendDoctorComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteDoctorCommentCopyWith<$Res> {
  factory _$$_DeleteDoctorCommentCopyWith(_$_DeleteDoctorComment value,
          $Res Function(_$_DeleteDoctorComment) then) =
      __$$_DeleteDoctorCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, Function onSuccess, Function onError});
}

/// @nodoc
class __$$_DeleteDoctorCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_DeleteDoctorComment>
    implements _$$_DeleteDoctorCommentCopyWith<$Res> {
  __$$_DeleteDoctorCommentCopyWithImpl(_$_DeleteDoctorComment _value,
      $Res Function(_$_DeleteDoctorComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onSuccess = null,
    Object? onError = null,
  }) {
    return _then(_$_DeleteDoctorComment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$_DeleteDoctorComment implements _DeleteDoctorComment {
  _$_DeleteDoctorComment(
      {required this.id, required this.onSuccess, required this.onError});

  @override
  final int id;
  @override
  final Function onSuccess;
  @override
  final Function onError;

  @override
  String toString() {
    return 'CommentsEvent.deleteDoctorComment(id: $id, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteDoctorComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteDoctorCommentCopyWith<_$_DeleteDoctorComment> get copyWith =>
      __$$_DeleteDoctorCommentCopyWithImpl<_$_DeleteDoctorComment>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return deleteDoctorComment(id, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return deleteDoctorComment?.call(id, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (deleteDoctorComment != null) {
      return deleteDoctorComment(id, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return deleteDoctorComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return deleteDoctorComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (deleteDoctorComment != null) {
      return deleteDoctorComment(this);
    }
    return orElse();
  }
}

abstract class _DeleteDoctorComment implements CommentsEvent {
  factory _DeleteDoctorComment(
      {required final int id,
      required final Function onSuccess,
      required final Function onError}) = _$_DeleteDoctorComment;

  int get id;
  Function get onSuccess;
  Function get onError;
  @JsonKey(ignore: true)
  _$$_DeleteDoctorCommentCopyWith<_$_DeleteDoctorComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteHospitalCommentCopyWith<$Res> {
  factory _$$_DeleteHospitalCommentCopyWith(_$_DeleteHospitalComment value,
          $Res Function(_$_DeleteHospitalComment) then) =
      __$$_DeleteHospitalCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, Function onSuccess, Function onError});
}

/// @nodoc
class __$$_DeleteHospitalCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res, _$_DeleteHospitalComment>
    implements _$$_DeleteHospitalCommentCopyWith<$Res> {
  __$$_DeleteHospitalCommentCopyWithImpl(_$_DeleteHospitalComment _value,
      $Res Function(_$_DeleteHospitalComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onSuccess = null,
    Object? onError = null,
  }) {
    return _then(_$_DeleteHospitalComment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$_DeleteHospitalComment implements _DeleteHospitalComment {
  _$_DeleteHospitalComment(
      {required this.id, required this.onSuccess, required this.onError});

  @override
  final int id;
  @override
  final Function onSuccess;
  @override
  final Function onError;

  @override
  String toString() {
    return 'CommentsEvent.deleteHospitalComment(id: $id, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteHospitalComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteHospitalCommentCopyWith<_$_DeleteHospitalComment> get copyWith =>
      __$$_DeleteHospitalCommentCopyWithImpl<_$_DeleteHospitalComment>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getComments,
    required TResult Function() getMoreComments,
    required TResult Function(int doctorId) getDoctorComments,
    required TResult Function() getMoreDoctorComments,
    required TResult Function(PostCommentEntity comment, VoidCallback onSuccess)
        postComment,
    required TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)
        sendDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteDoctorComment,
    required TResult Function(int id, Function onSuccess, Function onError)
        deleteHospitalComment,
  }) {
    return deleteHospitalComment(id, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getComments,
    TResult? Function()? getMoreComments,
    TResult? Function(int doctorId)? getDoctorComments,
    TResult? Function()? getMoreDoctorComments,
    TResult? Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult? Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult? Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
  }) {
    return deleteHospitalComment?.call(id, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(int doctor, double rating, String comment,
            Function onSuccess, dynamic Function(String) onError)?
        sendDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteDoctorComment,
    TResult Function(int id, Function onSuccess, Function onError)?
        deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (deleteHospitalComment != null) {
      return deleteHospitalComment(id, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetMoreComments value) getMoreComments,
    required TResult Function(_GetDoctorComments value) getDoctorComments,
    required TResult Function(_GetMoreDoctorComments value)
        getMoreDoctorComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_SendDoctorComment value) sendDoctorComment,
    required TResult Function(_DeleteDoctorComment value) deleteDoctorComment,
    required TResult Function(_DeleteHospitalComment value)
        deleteHospitalComment,
  }) {
    return deleteHospitalComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComments value)? getComments,
    TResult? Function(_GetMoreComments value)? getMoreComments,
    TResult? Function(_GetDoctorComments value)? getDoctorComments,
    TResult? Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult? Function(_PostComment value)? postComment,
    TResult? Function(_SendDoctorComment value)? sendDoctorComment,
    TResult? Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult? Function(_DeleteHospitalComment value)? deleteHospitalComment,
  }) {
    return deleteHospitalComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
    TResult Function(_DeleteDoctorComment value)? deleteDoctorComment,
    TResult Function(_DeleteHospitalComment value)? deleteHospitalComment,
    required TResult orElse(),
  }) {
    if (deleteHospitalComment != null) {
      return deleteHospitalComment(this);
    }
    return orElse();
  }
}

abstract class _DeleteHospitalComment implements CommentsEvent {
  factory _DeleteHospitalComment(
      {required final int id,
      required final Function onSuccess,
      required final Function onError}) = _$_DeleteHospitalComment;

  int get id;
  Function get onSuccess;
  Function get onError;
  @JsonKey(ignore: true)
  _$$_DeleteHospitalCommentCopyWith<_$_DeleteHospitalComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentsState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<CommentEntity> get comments => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get organizationId => throw _privateConstructorUsedError;
  FormzStatus get doctorCommentStatus => throw _privateConstructorUsedError;
  List<CommentEntity> get doctorComments => throw _privateConstructorUsedError;
  String? get doctorCommentNext => throw _privateConstructorUsedError;
  bool get doctorCommentFetchMore => throw _privateConstructorUsedError;
  int get doctorId => throw _privateConstructorUsedError;
  int get doctorCommentCount => throw _privateConstructorUsedError;
  int get hospitalCommentCount => throw _privateConstructorUsedError;
  dynamic get postCommentStatus => throw _privateConstructorUsedError;
  dynamic get sendDoctorCommentStatus => throw _privateConstructorUsedError;
  bool get isDoctorCommented => throw _privateConstructorUsedError;
  bool get isOrganizationCommented => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<CommentEntity> comments,
      String? next,
      bool fetchMore,
      int organizationId,
      FormzStatus doctorCommentStatus,
      List<CommentEntity> doctorComments,
      String? doctorCommentNext,
      bool doctorCommentFetchMore,
      int doctorId,
      int doctorCommentCount,
      int hospitalCommentCount,
      dynamic postCommentStatus,
      dynamic sendDoctorCommentStatus,
      bool isDoctorCommented,
      bool isOrganizationCommented});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? comments = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
    Object? doctorCommentStatus = null,
    Object? doctorComments = null,
    Object? doctorCommentNext = freezed,
    Object? doctorCommentFetchMore = null,
    Object? doctorId = null,
    Object? doctorCommentCount = null,
    Object? hospitalCommentCount = null,
    Object? postCommentStatus = null,
    Object? sendDoctorCommentStatus = null,
    Object? isDoctorCommented = null,
    Object? isOrganizationCommented = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentStatus: null == doctorCommentStatus
          ? _value.doctorCommentStatus
          : doctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      doctorComments: null == doctorComments
          ? _value.doctorComments
          : doctorComments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      doctorCommentNext: freezed == doctorCommentNext
          ? _value.doctorCommentNext
          : doctorCommentNext // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCommentFetchMore: null == doctorCommentFetchMore
          ? _value.doctorCommentFetchMore
          : doctorCommentFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentCount: null == doctorCommentCount
          ? _value.doctorCommentCount
          : doctorCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalCommentCount: null == hospitalCommentCount
          ? _value.hospitalCommentCount
          : hospitalCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentStatus: null == postCommentStatus
          ? _value.postCommentStatus
          : postCommentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sendDoctorCommentStatus: null == sendDoctorCommentStatus
          ? _value.sendDoctorCommentStatus
          : sendDoctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isDoctorCommented: null == isDoctorCommented
          ? _value.isDoctorCommented
          : isDoctorCommented // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrganizationCommented: null == isOrganizationCommented
          ? _value.isOrganizationCommented
          : isOrganizationCommented // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentsStateCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$_CommentsStateCopyWith(
          _$_CommentsState value, $Res Function(_$_CommentsState) then) =
      __$$_CommentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<CommentEntity> comments,
      String? next,
      bool fetchMore,
      int organizationId,
      FormzStatus doctorCommentStatus,
      List<CommentEntity> doctorComments,
      String? doctorCommentNext,
      bool doctorCommentFetchMore,
      int doctorId,
      int doctorCommentCount,
      int hospitalCommentCount,
      dynamic postCommentStatus,
      dynamic sendDoctorCommentStatus,
      bool isDoctorCommented,
      bool isOrganizationCommented});
}

/// @nodoc
class __$$_CommentsStateCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$_CommentsState>
    implements _$$_CommentsStateCopyWith<$Res> {
  __$$_CommentsStateCopyWithImpl(
      _$_CommentsState _value, $Res Function(_$_CommentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? comments = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
    Object? doctorCommentStatus = null,
    Object? doctorComments = null,
    Object? doctorCommentNext = freezed,
    Object? doctorCommentFetchMore = null,
    Object? doctorId = null,
    Object? doctorCommentCount = null,
    Object? hospitalCommentCount = null,
    Object? postCommentStatus = null,
    Object? sendDoctorCommentStatus = null,
    Object? isDoctorCommented = null,
    Object? isOrganizationCommented = null,
  }) {
    return _then(_$_CommentsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentStatus: null == doctorCommentStatus
          ? _value.doctorCommentStatus
          : doctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      doctorComments: null == doctorComments
          ? _value._doctorComments
          : doctorComments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      doctorCommentNext: freezed == doctorCommentNext
          ? _value.doctorCommentNext
          : doctorCommentNext // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCommentFetchMore: null == doctorCommentFetchMore
          ? _value.doctorCommentFetchMore
          : doctorCommentFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentCount: null == doctorCommentCount
          ? _value.doctorCommentCount
          : doctorCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalCommentCount: null == hospitalCommentCount
          ? _value.hospitalCommentCount
          : hospitalCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentStatus: null == postCommentStatus
          ? _value.postCommentStatus
          : postCommentStatus,
      sendDoctorCommentStatus: null == sendDoctorCommentStatus
          ? _value.sendDoctorCommentStatus
          : sendDoctorCommentStatus,
      isDoctorCommented: null == isDoctorCommented
          ? _value.isDoctorCommented
          : isDoctorCommented // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrganizationCommented: null == isOrganizationCommented
          ? _value.isOrganizationCommented
          : isOrganizationCommented // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CommentsState implements _CommentsState {
  _$_CommentsState(
      {this.status = FormzStatus.pure,
      final List<CommentEntity> comments = const [],
      this.next,
      this.fetchMore = false,
      this.organizationId = 0,
      this.doctorCommentStatus = FormzStatus.pure,
      final List<CommentEntity> doctorComments = const [],
      this.doctorCommentNext,
      this.doctorCommentFetchMore = false,
      this.doctorId = 0,
      this.doctorCommentCount = 0,
      this.hospitalCommentCount = 0,
      this.postCommentStatus = FormzStatus.pure,
      this.sendDoctorCommentStatus = FormzStatus.pure,
      this.isDoctorCommented = false,
      this.isOrganizationCommented = false})
      : _comments = comments,
        _doctorComments = doctorComments;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<CommentEntity> _comments;
  @override
  @JsonKey()
  List<CommentEntity> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final int organizationId;
  @override
  @JsonKey()
  final FormzStatus doctorCommentStatus;
  final List<CommentEntity> _doctorComments;
  @override
  @JsonKey()
  List<CommentEntity> get doctorComments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorComments);
  }

  @override
  final String? doctorCommentNext;
  @override
  @JsonKey()
  final bool doctorCommentFetchMore;
  @override
  @JsonKey()
  final int doctorId;
  @override
  @JsonKey()
  final int doctorCommentCount;
  @override
  @JsonKey()
  final int hospitalCommentCount;
  @override
  @JsonKey()
  final dynamic postCommentStatus;
  @override
  @JsonKey()
  final dynamic sendDoctorCommentStatus;
  @override
  @JsonKey()
  final bool isDoctorCommented;
  @override
  @JsonKey()
  final bool isOrganizationCommented;

  @override
  String toString() {
    return 'CommentsState(status: $status, comments: $comments, next: $next, fetchMore: $fetchMore, organizationId: $organizationId, doctorCommentStatus: $doctorCommentStatus, doctorComments: $doctorComments, doctorCommentNext: $doctorCommentNext, doctorCommentFetchMore: $doctorCommentFetchMore, doctorId: $doctorId, doctorCommentCount: $doctorCommentCount, hospitalCommentCount: $hospitalCommentCount, postCommentStatus: $postCommentStatus, sendDoctorCommentStatus: $sendDoctorCommentStatus, isDoctorCommented: $isDoctorCommented, isOrganizationCommented: $isOrganizationCommented)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.doctorCommentStatus, doctorCommentStatus) ||
                other.doctorCommentStatus == doctorCommentStatus) &&
            const DeepCollectionEquality()
                .equals(other._doctorComments, _doctorComments) &&
            (identical(other.doctorCommentNext, doctorCommentNext) ||
                other.doctorCommentNext == doctorCommentNext) &&
            (identical(other.doctorCommentFetchMore, doctorCommentFetchMore) ||
                other.doctorCommentFetchMore == doctorCommentFetchMore) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorCommentCount, doctorCommentCount) ||
                other.doctorCommentCount == doctorCommentCount) &&
            (identical(other.hospitalCommentCount, hospitalCommentCount) ||
                other.hospitalCommentCount == hospitalCommentCount) &&
            const DeepCollectionEquality()
                .equals(other.postCommentStatus, postCommentStatus) &&
            const DeepCollectionEquality().equals(
                other.sendDoctorCommentStatus, sendDoctorCommentStatus) &&
            (identical(other.isDoctorCommented, isDoctorCommented) ||
                other.isDoctorCommented == isDoctorCommented) &&
            (identical(
                    other.isOrganizationCommented, isOrganizationCommented) ||
                other.isOrganizationCommented == isOrganizationCommented));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_comments),
      next,
      fetchMore,
      organizationId,
      doctorCommentStatus,
      const DeepCollectionEquality().hash(_doctorComments),
      doctorCommentNext,
      doctorCommentFetchMore,
      doctorId,
      doctorCommentCount,
      hospitalCommentCount,
      const DeepCollectionEquality().hash(postCommentStatus),
      const DeepCollectionEquality().hash(sendDoctorCommentStatus),
      isDoctorCommented,
      isOrganizationCommented);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      __$$_CommentsStateCopyWithImpl<_$_CommentsState>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  factory _CommentsState(
      {final FormzStatus status,
      final List<CommentEntity> comments,
      final String? next,
      final bool fetchMore,
      final int organizationId,
      final FormzStatus doctorCommentStatus,
      final List<CommentEntity> doctorComments,
      final String? doctorCommentNext,
      final bool doctorCommentFetchMore,
      final int doctorId,
      final int doctorCommentCount,
      final int hospitalCommentCount,
      final dynamic postCommentStatus,
      final dynamic sendDoctorCommentStatus,
      final bool isDoctorCommented,
      final bool isOrganizationCommented}) = _$_CommentsState;

  @override
  FormzStatus get status;
  @override
  List<CommentEntity> get comments;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  int get organizationId;
  @override
  FormzStatus get doctorCommentStatus;
  @override
  List<CommentEntity> get doctorComments;
  @override
  String? get doctorCommentNext;
  @override
  bool get doctorCommentFetchMore;
  @override
  int get doctorId;
  @override
  int get doctorCommentCount;
  @override
  int get hospitalCommentCount;
  @override
  dynamic get postCommentStatus;
  @override
  dynamic get sendDoctorCommentStatus;
  @override
  bool get isDoctorCommented;
  @override
  bool get isOrganizationCommented;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
