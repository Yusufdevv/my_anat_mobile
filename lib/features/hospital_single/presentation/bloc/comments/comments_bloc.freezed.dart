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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEventCopyWith<$Res> {
  factory $CommentsEventCopyWith(
          CommentsEvent value, $Res Function(CommentsEvent) then) =
      _$CommentsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentsEventCopyWithImpl<$Res>
    implements $CommentsEventCopyWith<$Res> {
  _$CommentsEventCopyWithImpl(this._value, this._then);

  final CommentsEvent _value;
  // ignore: unused_field
  final $Res Function(CommentsEvent) _then;
}

/// @nodoc
abstract class _$$_GetCommentsCopyWith<$Res> {
  factory _$$_GetCommentsCopyWith(
          _$_GetComments value, $Res Function(_$_GetComments) then) =
      __$$_GetCommentsCopyWithImpl<$Res>;
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_GetCommentsCopyWith<$Res> {
  __$$_GetCommentsCopyWithImpl(
      _$_GetComments _value, $Res Function(_$_GetComments) _then)
      : super(_value, (v) => _then(v as _$_GetComments));

  @override
  _$_GetComments get _value => super._value as _$_GetComments;

  @override
  $Res call({
    Object? organizationId = freezed,
  }) {
    return _then(_$_GetComments(
      organizationId: organizationId == freezed
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
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(organizationId));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return getComments(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_GetMoreCommentsCopyWith<$Res> {
  __$$_GetMoreCommentsCopyWithImpl(
      _$_GetMoreComments _value, $Res Function(_$_GetMoreComments) _then)
      : super(_value, (v) => _then(v as _$_GetMoreComments));

  @override
  _$_GetMoreComments get _value => super._value as _$_GetMoreComments;
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return getMoreComments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) {
    return getMoreComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
  $Res call({int doctorId});
}

/// @nodoc
class __$$_GetDoctorCommentsCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_GetDoctorCommentsCopyWith<$Res> {
  __$$_GetDoctorCommentsCopyWithImpl(
      _$_GetDoctorComments _value, $Res Function(_$_GetDoctorComments) _then)
      : super(_value, (v) => _then(v as _$_GetDoctorComments));

  @override
  _$_GetDoctorComments get _value => super._value as _$_GetDoctorComments;

  @override
  $Res call({
    Object? doctorId = freezed,
  }) {
    return _then(_$_GetDoctorComments(
      doctorId: doctorId == freezed
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
            const DeepCollectionEquality().equals(other.doctorId, doctorId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(doctorId));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return getDoctorComments(doctorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) {
    return getDoctorComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_GetMoreDoctorCommentsCopyWith<$Res> {
  __$$_GetMoreDoctorCommentsCopyWithImpl(_$_GetMoreDoctorComments _value,
      $Res Function(_$_GetMoreDoctorComments) _then)
      : super(_value, (v) => _then(v as _$_GetMoreDoctorComments));

  @override
  _$_GetMoreDoctorComments get _value =>
      super._value as _$_GetMoreDoctorComments;
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return getMoreDoctorComments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) {
    return getMoreDoctorComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
  $Res call({PostCommentEntity comment, VoidCallback onSuccess});
}

/// @nodoc
class __$$_PostCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_PostCommentCopyWith<$Res> {
  __$$_PostCommentCopyWithImpl(
      _$_PostComment _value, $Res Function(_$_PostComment) _then)
      : super(_value, (v) => _then(v as _$_PostComment));

  @override
  _$_PostComment get _value => super._value as _$_PostComment;

  @override
  $Res call({
    Object? comment = freezed,
    Object? onSuccess = freezed,
  }) {
    return _then(_$_PostComment(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as PostCommentEntity,
      onSuccess: onSuccess == freezed
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
            const DeepCollectionEquality().equals(other.comment, comment) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(comment), onSuccess);

  @JsonKey(ignore: true)
  @override
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return postComment(comment, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
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
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
  $Res call({int doctor, double rating, String comment, Function onSuccess});
}

/// @nodoc
class __$$_SendDoctorCommentCopyWithImpl<$Res>
    extends _$CommentsEventCopyWithImpl<$Res>
    implements _$$_SendDoctorCommentCopyWith<$Res> {
  __$$_SendDoctorCommentCopyWithImpl(
      _$_SendDoctorComment _value, $Res Function(_$_SendDoctorComment) _then)
      : super(_value, (v) => _then(v as _$_SendDoctorComment));

  @override
  _$_SendDoctorComment get _value => super._value as _$_SendDoctorComment;

  @override
  $Res call({
    Object? doctor = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? onSuccess = freezed,
  }) {
    return _then(_$_SendDoctorComment(
      doctor: doctor == freezed
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: onSuccess == freezed
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$_SendDoctorComment implements _SendDoctorComment {
  _$_SendDoctorComment(
      {required this.doctor,
      required this.rating,
      required this.comment,
      required this.onSuccess});

  @override
  final int doctor;
  @override
  final double rating;
  @override
  final String comment;
  @override
  final Function onSuccess;

  @override
  String toString() {
    return 'CommentsEvent.sendDoctorComment(doctor: $doctor, rating: $rating, comment: $comment, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendDoctorComment &&
            const DeepCollectionEquality().equals(other.doctor, doctor) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.onSuccess, onSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(doctor),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(onSuccess));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function(
            int doctor, double rating, String comment, Function onSuccess)
        sendDoctorComment,
  }) {
    return sendDoctorComment(doctor, rating, comment, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getComments,
    TResult Function()? getMoreComments,
    TResult Function(int doctorId)? getDoctorComments,
    TResult Function()? getMoreDoctorComments,
    TResult Function(PostCommentEntity comment, VoidCallback onSuccess)?
        postComment,
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
  }) {
    return sendDoctorComment?.call(doctor, rating, comment, onSuccess);
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
    TResult Function(
            int doctor, double rating, String comment, Function onSuccess)?
        sendDoctorComment,
    required TResult orElse(),
  }) {
    if (sendDoctorComment != null) {
      return sendDoctorComment(doctor, rating, comment, onSuccess);
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
  }) {
    return sendDoctorComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetMoreComments value)? getMoreComments,
    TResult Function(_GetDoctorComments value)? getDoctorComments,
    TResult Function(_GetMoreDoctorComments value)? getMoreDoctorComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_SendDoctorComment value)? sendDoctorComment,
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
      required final Function onSuccess}) = _$_SendDoctorComment;

  int get doctor;
  double get rating;
  String get comment;
  Function get onSuccess;
  @JsonKey(ignore: true)
  _$$_SendDoctorCommentCopyWith<_$_SendDoctorComment> get copyWith =>
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

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res>;
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
      dynamic sendDoctorCommentStatus});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  final CommentsState _value;
  // ignore: unused_field
  final $Res Function(CommentsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? comments = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? organizationId = freezed,
    Object? doctorCommentStatus = freezed,
    Object? doctorComments = freezed,
    Object? doctorCommentNext = freezed,
    Object? doctorCommentFetchMore = freezed,
    Object? doctorId = freezed,
    Object? doctorCommentCount = freezed,
    Object? hospitalCommentCount = freezed,
    Object? postCommentStatus = freezed,
    Object? sendDoctorCommentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentStatus: doctorCommentStatus == freezed
          ? _value.doctorCommentStatus
          : doctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      doctorComments: doctorComments == freezed
          ? _value.doctorComments
          : doctorComments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      doctorCommentNext: doctorCommentNext == freezed
          ? _value.doctorCommentNext
          : doctorCommentNext // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCommentFetchMore: doctorCommentFetchMore == freezed
          ? _value.doctorCommentFetchMore
          : doctorCommentFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorId: doctorId == freezed
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentCount: doctorCommentCount == freezed
          ? _value.doctorCommentCount
          : doctorCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalCommentCount: hospitalCommentCount == freezed
          ? _value.hospitalCommentCount
          : hospitalCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentStatus: postCommentStatus == freezed
          ? _value.postCommentStatus
          : postCommentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sendDoctorCommentStatus: sendDoctorCommentStatus == freezed
          ? _value.sendDoctorCommentStatus
          : sendDoctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentsStateCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$_CommentsStateCopyWith(
          _$_CommentsState value, $Res Function(_$_CommentsState) then) =
      __$$_CommentsStateCopyWithImpl<$Res>;
  @override
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
      dynamic sendDoctorCommentStatus});
}

/// @nodoc
class __$$_CommentsStateCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res>
    implements _$$_CommentsStateCopyWith<$Res> {
  __$$_CommentsStateCopyWithImpl(
      _$_CommentsState _value, $Res Function(_$_CommentsState) _then)
      : super(_value, (v) => _then(v as _$_CommentsState));

  @override
  _$_CommentsState get _value => super._value as _$_CommentsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? comments = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? organizationId = freezed,
    Object? doctorCommentStatus = freezed,
    Object? doctorComments = freezed,
    Object? doctorCommentNext = freezed,
    Object? doctorCommentFetchMore = freezed,
    Object? doctorId = freezed,
    Object? doctorCommentCount = freezed,
    Object? hospitalCommentCount = freezed,
    Object? postCommentStatus = freezed,
    Object? sendDoctorCommentStatus = freezed,
  }) {
    return _then(_$_CommentsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentStatus: doctorCommentStatus == freezed
          ? _value.doctorCommentStatus
          : doctorCommentStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      doctorComments: doctorComments == freezed
          ? _value._doctorComments
          : doctorComments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      doctorCommentNext: doctorCommentNext == freezed
          ? _value.doctorCommentNext
          : doctorCommentNext // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCommentFetchMore: doctorCommentFetchMore == freezed
          ? _value.doctorCommentFetchMore
          : doctorCommentFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      doctorId: doctorId == freezed
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int,
      doctorCommentCount: doctorCommentCount == freezed
          ? _value.doctorCommentCount
          : doctorCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalCommentCount: hospitalCommentCount == freezed
          ? _value.hospitalCommentCount
          : hospitalCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentStatus: postCommentStatus == freezed
          ? _value.postCommentStatus
          : postCommentStatus,
      sendDoctorCommentStatus: sendDoctorCommentStatus == freezed
          ? _value.sendDoctorCommentStatus
          : sendDoctorCommentStatus,
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
      this.sendDoctorCommentStatus = FormzStatus.pure})
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
  String toString() {
    return 'CommentsState(status: $status, comments: $comments, next: $next, fetchMore: $fetchMore, organizationId: $organizationId, doctorCommentStatus: $doctorCommentStatus, doctorComments: $doctorComments, doctorCommentNext: $doctorCommentNext, doctorCommentFetchMore: $doctorCommentFetchMore, doctorId: $doctorId, doctorCommentCount: $doctorCommentCount, hospitalCommentCount: $hospitalCommentCount, postCommentStatus: $postCommentStatus, sendDoctorCommentStatus: $sendDoctorCommentStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore) &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId) &&
            const DeepCollectionEquality()
                .equals(other.doctorCommentStatus, doctorCommentStatus) &&
            const DeepCollectionEquality()
                .equals(other._doctorComments, _doctorComments) &&
            const DeepCollectionEquality()
                .equals(other.doctorCommentNext, doctorCommentNext) &&
            const DeepCollectionEquality()
                .equals(other.doctorCommentFetchMore, doctorCommentFetchMore) &&
            const DeepCollectionEquality().equals(other.doctorId, doctorId) &&
            const DeepCollectionEquality()
                .equals(other.doctorCommentCount, doctorCommentCount) &&
            const DeepCollectionEquality()
                .equals(other.hospitalCommentCount, hospitalCommentCount) &&
            const DeepCollectionEquality()
                .equals(other.postCommentStatus, postCommentStatus) &&
            const DeepCollectionEquality().equals(
                other.sendDoctorCommentStatus, sendDoctorCommentStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore),
      const DeepCollectionEquality().hash(organizationId),
      const DeepCollectionEquality().hash(doctorCommentStatus),
      const DeepCollectionEquality().hash(_doctorComments),
      const DeepCollectionEquality().hash(doctorCommentNext),
      const DeepCollectionEquality().hash(doctorCommentFetchMore),
      const DeepCollectionEquality().hash(doctorId),
      const DeepCollectionEquality().hash(doctorCommentCount),
      const DeepCollectionEquality().hash(hospitalCommentCount),
      const DeepCollectionEquality().hash(postCommentStatus),
      const DeepCollectionEquality().hash(sendDoctorCommentStatus));

  @JsonKey(ignore: true)
  @override
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
      final dynamic sendDoctorCommentStatus}) = _$_CommentsState;

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
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
