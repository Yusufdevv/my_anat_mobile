// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapDoctorEvent {
  String get search => throw _privateConstructorUsedError;
  MapParameter? get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search, MapParameter? params)
        getMapDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search, MapParameter? params)? getMapDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search, MapParameter? params)? getMapDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMapDoctors value) getMapDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMapDoctors value)? getMapDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMapDoctors value)? getMapDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapDoctorEventCopyWith<MapDoctorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapDoctorEventCopyWith<$Res> {
  factory $MapDoctorEventCopyWith(
          MapDoctorEvent value, $Res Function(MapDoctorEvent) then) =
      _$MapDoctorEventCopyWithImpl<$Res, MapDoctorEvent>;
  @useResult
  $Res call({String search, MapParameter? params});
}

/// @nodoc
class _$MapDoctorEventCopyWithImpl<$Res, $Val extends MapDoctorEvent>
    implements $MapDoctorEventCopyWith<$Res> {
  _$MapDoctorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MapParameter?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetMapDoctorsCopyWith<$Res>
    implements $MapDoctorEventCopyWith<$Res> {
  factory _$$_GetMapDoctorsCopyWith(
          _$_GetMapDoctors value, $Res Function(_$_GetMapDoctors) then) =
      __$$_GetMapDoctorsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search, MapParameter? params});
}

/// @nodoc
class __$$_GetMapDoctorsCopyWithImpl<$Res>
    extends _$MapDoctorEventCopyWithImpl<$Res, _$_GetMapDoctors>
    implements _$$_GetMapDoctorsCopyWith<$Res> {
  __$$_GetMapDoctorsCopyWithImpl(
      _$_GetMapDoctors _value, $Res Function(_$_GetMapDoctors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? params = freezed,
  }) {
    return _then(_$_GetMapDoctors(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MapParameter?,
    ));
  }
}

/// @nodoc

class _$_GetMapDoctors implements _GetMapDoctors {
  _$_GetMapDoctors({required this.search, this.params});

  @override
  final String search;
  @override
  final MapParameter? params;

  @override
  String toString() {
    return 'MapDoctorEvent.getMapDoctors(search: $search, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMapDoctors &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMapDoctorsCopyWith<_$_GetMapDoctors> get copyWith =>
      __$$_GetMapDoctorsCopyWithImpl<_$_GetMapDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search, MapParameter? params)
        getMapDoctors,
  }) {
    return getMapDoctors(search, params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search, MapParameter? params)? getMapDoctors,
  }) {
    return getMapDoctors?.call(search, params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search, MapParameter? params)? getMapDoctors,
    required TResult orElse(),
  }) {
    if (getMapDoctors != null) {
      return getMapDoctors(search, params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMapDoctors value) getMapDoctors,
  }) {
    return getMapDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMapDoctors value)? getMapDoctors,
  }) {
    return getMapDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMapDoctors value)? getMapDoctors,
    required TResult orElse(),
  }) {
    if (getMapDoctors != null) {
      return getMapDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetMapDoctors implements MapDoctorEvent {
  factory _GetMapDoctors(
      {required final String search,
      final MapParameter? params}) = _$_GetMapDoctors;

  @override
  String get search;
  @override
  MapParameter? get params;
  @override
  @JsonKey(ignore: true)
  _$$_GetMapDoctorsCopyWith<_$_GetMapDoctors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapDoctorState {
  List<DoctorMapEntity> get doctors => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapDoctorStateCopyWith<MapDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapDoctorStateCopyWith<$Res> {
  factory $MapDoctorStateCopyWith(
          MapDoctorState value, $Res Function(MapDoctorState) then) =
      _$MapDoctorStateCopyWithImpl<$Res, MapDoctorState>;
  @useResult
  $Res call({List<DoctorMapEntity> doctors, FormzStatus status});
}

/// @nodoc
class _$MapDoctorStateCopyWithImpl<$Res, $Val extends MapDoctorState>
    implements $MapDoctorStateCopyWith<$Res> {
  _$MapDoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorMapEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapDoctorStateCopyWith<$Res>
    implements $MapDoctorStateCopyWith<$Res> {
  factory _$$_MapDoctorStateCopyWith(
          _$_MapDoctorState value, $Res Function(_$_MapDoctorState) then) =
      __$$_MapDoctorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DoctorMapEntity> doctors, FormzStatus status});
}

/// @nodoc
class __$$_MapDoctorStateCopyWithImpl<$Res>
    extends _$MapDoctorStateCopyWithImpl<$Res, _$_MapDoctorState>
    implements _$$_MapDoctorStateCopyWith<$Res> {
  __$$_MapDoctorStateCopyWithImpl(
      _$_MapDoctorState _value, $Res Function(_$_MapDoctorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
  }) {
    return _then(_$_MapDoctorState(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorMapEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_MapDoctorState implements _MapDoctorState {
  _$_MapDoctorState(
      {final List<DoctorMapEntity> doctors = const [],
      this.status = FormzStatus.pure})
      : _doctors = doctors;

  final List<DoctorMapEntity> _doctors;
  @override
  @JsonKey()
  List<DoctorMapEntity> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'MapDoctorState(doctors: $doctors, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapDoctorState &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doctors), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapDoctorStateCopyWith<_$_MapDoctorState> get copyWith =>
      __$$_MapDoctorStateCopyWithImpl<_$_MapDoctorState>(this, _$identity);
}

abstract class _MapDoctorState implements MapDoctorState {
  factory _MapDoctorState(
      {final List<DoctorMapEntity> doctors,
      final FormzStatus status}) = _$_MapDoctorState;

  @override
  List<DoctorMapEntity> get doctors;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MapDoctorStateCopyWith<_$_MapDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}
