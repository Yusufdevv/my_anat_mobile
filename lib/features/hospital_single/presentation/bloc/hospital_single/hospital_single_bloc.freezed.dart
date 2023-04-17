// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_single_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HospitalSingleEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getHospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getHospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getHospital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospital value) getHospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHospital value)? getHospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospital value)? getHospital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalSingleEventCopyWith<HospitalSingleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSingleEventCopyWith<$Res> {
  factory $HospitalSingleEventCopyWith(
          HospitalSingleEvent value, $Res Function(HospitalSingleEvent) then) =
      _$HospitalSingleEventCopyWithImpl<$Res, HospitalSingleEvent>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class _$HospitalSingleEventCopyWithImpl<$Res, $Val extends HospitalSingleEvent>
    implements $HospitalSingleEventCopyWith<$Res> {
  _$HospitalSingleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetHospitalCopyWith<$Res>
    implements $HospitalSingleEventCopyWith<$Res> {
  factory _$$_GetHospitalCopyWith(
          _$_GetHospital value, $Res Function(_$_GetHospital) then) =
      __$$_GetHospitalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetHospitalCopyWithImpl<$Res>
    extends _$HospitalSingleEventCopyWithImpl<$Res, _$_GetHospital>
    implements _$$_GetHospitalCopyWith<$Res> {
  __$$_GetHospitalCopyWithImpl(
      _$_GetHospital _value, $Res Function(_$_GetHospital) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$_GetHospital(
      null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetHospital implements _GetHospital {
  _$_GetHospital(this.slug);

  @override
  final String slug;

  @override
  String toString() {
    return 'HospitalSingleEvent.getHospital(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetHospital &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetHospitalCopyWith<_$_GetHospital> get copyWith =>
      __$$_GetHospitalCopyWithImpl<_$_GetHospital>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getHospital,
  }) {
    return getHospital(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? getHospital,
  }) {
    return getHospital?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getHospital,
    required TResult orElse(),
  }) {
    if (getHospital != null) {
      return getHospital(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospital value) getHospital,
  }) {
    return getHospital(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHospital value)? getHospital,
  }) {
    return getHospital?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospital value)? getHospital,
    required TResult orElse(),
  }) {
    if (getHospital != null) {
      return getHospital(this);
    }
    return orElse();
  }
}

abstract class _GetHospital implements HospitalSingleEvent {
  factory _GetHospital(final String slug) = _$_GetHospital;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetHospitalCopyWith<_$_GetHospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HospitalSingleState {
  HospitalSingleEntity get hospital => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalSingleStateCopyWith<HospitalSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSingleStateCopyWith<$Res> {
  factory $HospitalSingleStateCopyWith(
          HospitalSingleState value, $Res Function(HospitalSingleState) then) =
      _$HospitalSingleStateCopyWithImpl<$Res, HospitalSingleState>;
  @useResult
  $Res call({HospitalSingleEntity hospital, FormzStatus status});
}

/// @nodoc
class _$HospitalSingleStateCopyWithImpl<$Res, $Val extends HospitalSingleState>
    implements $HospitalSingleStateCopyWith<$Res> {
  _$HospitalSingleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospital = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalSingleEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HospitalSingleStateCopyWith<$Res>
    implements $HospitalSingleStateCopyWith<$Res> {
  factory _$$_HospitalSingleStateCopyWith(_$_HospitalSingleState value,
          $Res Function(_$_HospitalSingleState) then) =
      __$$_HospitalSingleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HospitalSingleEntity hospital, FormzStatus status});
}

/// @nodoc
class __$$_HospitalSingleStateCopyWithImpl<$Res>
    extends _$HospitalSingleStateCopyWithImpl<$Res, _$_HospitalSingleState>
    implements _$$_HospitalSingleStateCopyWith<$Res> {
  __$$_HospitalSingleStateCopyWithImpl(_$_HospitalSingleState _value,
      $Res Function(_$_HospitalSingleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospital = null,
    Object? status = null,
  }) {
    return _then(_$_HospitalSingleState(
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalSingleEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_HospitalSingleState implements _HospitalSingleState {
  _$_HospitalSingleState(
      {this.hospital = const HospitalSingleEntity(),
      this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final HospitalSingleEntity hospital;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'HospitalSingleState(hospital: $hospital, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalSingleState &&
            (identical(other.hospital, hospital) ||
                other.hospital == hospital) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hospital, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HospitalSingleStateCopyWith<_$_HospitalSingleState> get copyWith =>
      __$$_HospitalSingleStateCopyWithImpl<_$_HospitalSingleState>(
          this, _$identity);
}

abstract class _HospitalSingleState implements HospitalSingleState {
  factory _HospitalSingleState(
      {final HospitalSingleEntity hospital,
      final FormzStatus status}) = _$_HospitalSingleState;

  @override
  HospitalSingleEntity get hospital;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalSingleStateCopyWith<_$_HospitalSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
