// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapOrganizationEvent {
  MapParameter get param => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapOrganizationEventCopyWith<MapOrganizationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationEventCopyWith<$Res> {
  factory $MapOrganizationEventCopyWith(MapOrganizationEvent value,
          $Res Function(MapOrganizationEvent) then) =
      _$MapOrganizationEventCopyWithImpl<$Res>;
  $Res call({MapParameter param});
}

/// @nodoc
class _$MapOrganizationEventCopyWithImpl<$Res>
    implements $MapOrganizationEventCopyWith<$Res> {
  _$MapOrganizationEventCopyWithImpl(this._value, this._then);

  final MapOrganizationEvent _value;
  // ignore: unused_field
  final $Res Function(MapOrganizationEvent) _then;

  @override
  $Res call({
    Object? param = freezed,
  }) {
    return _then(_value.copyWith(
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as MapParameter,
    ));
  }
}

/// @nodoc
abstract class _$$_GetHospitalsCopyWith<$Res>
    implements $MapOrganizationEventCopyWith<$Res> {
  factory _$$_GetHospitalsCopyWith(
          _$_GetHospitals value, $Res Function(_$_GetHospitals) then) =
      __$$_GetHospitalsCopyWithImpl<$Res>;
  @override
  $Res call({MapParameter param});
}

/// @nodoc
class __$$_GetHospitalsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetHospitalsCopyWith<$Res> {
  __$$_GetHospitalsCopyWithImpl(
      _$_GetHospitals _value, $Res Function(_$_GetHospitals) _then)
      : super(_value, (v) => _then(v as _$_GetHospitals));

  @override
  _$_GetHospitals get _value => super._value as _$_GetHospitals;

  @override
  $Res call({
    Object? param = freezed,
  }) {
    return _then(_$_GetHospitals(
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as MapParameter,
    ));
  }
}

/// @nodoc

class _$_GetHospitals implements _GetHospitals {
  _$_GetHospitals({required this.param});

  @override
  final MapParameter param;

  @override
  String toString() {
    return 'MapOrganizationEvent.getHospitals(param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetHospitals &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      __$$_GetHospitalsCopyWithImpl<_$_GetHospitals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
  }) {
    return getHospitals(param);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
  }) {
    return getHospitals?.call(param);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(param);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
  }) {
    return getHospitals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
  }) {
    return getHospitals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(this);
    }
    return orElse();
  }
}

abstract class _GetHospitals implements MapOrganizationEvent {
  factory _GetHospitals({required final MapParameter param}) = _$_GetHospitals;

  @override
  MapParameter get param;
  @override
  @JsonKey(ignore: true)
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDoctorsCopyWith<$Res>
    implements $MapOrganizationEventCopyWith<$Res> {
  factory _$$_GetDoctorsCopyWith(
          _$_GetDoctors value, $Res Function(_$_GetDoctors) then) =
      __$$_GetDoctorsCopyWithImpl<$Res>;
  @override
  $Res call({MapParameter param});
}

/// @nodoc
class __$$_GetDoctorsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetDoctorsCopyWith<$Res> {
  __$$_GetDoctorsCopyWithImpl(
      _$_GetDoctors _value, $Res Function(_$_GetDoctors) _then)
      : super(_value, (v) => _then(v as _$_GetDoctors));

  @override
  _$_GetDoctors get _value => super._value as _$_GetDoctors;

  @override
  $Res call({
    Object? param = freezed,
  }) {
    return _then(_$_GetDoctors(
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as MapParameter,
    ));
  }
}

/// @nodoc

class _$_GetDoctors implements _GetDoctors {
  _$_GetDoctors({required this.param});

  @override
  final MapParameter param;

  @override
  String toString() {
    return 'MapOrganizationEvent.getDoctors(param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctors &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      __$$_GetDoctorsCopyWithImpl<_$_GetDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
  }) {
    return getDoctors(param);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
  }) {
    return getDoctors?.call(param);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(param);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements MapOrganizationEvent {
  factory _GetDoctors({required final MapParameter param}) = _$_GetDoctors;

  @override
  MapParameter get param;
  @override
  @JsonKey(ignore: true)
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapOrganizationState {
  List<MapHospitalModel> get hospitals => throw _privateConstructorUsedError;
  List<MapDoctorModel> get doctors => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapOrganizationStateCopyWith<MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationStateCopyWith<$Res> {
  factory $MapOrganizationStateCopyWith(MapOrganizationState value,
          $Res Function(MapOrganizationState) then) =
      _$MapOrganizationStateCopyWithImpl<$Res>;
  $Res call(
      {List<MapHospitalModel> hospitals,
      List<MapDoctorModel> doctors,
      FormzStatus status});
}

/// @nodoc
class _$MapOrganizationStateCopyWithImpl<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  _$MapOrganizationStateCopyWithImpl(this._value, this._then);

  final MapOrganizationState _value;
  // ignore: unused_field
  final $Res Function(MapOrganizationState) _then;

  @override
  $Res call({
    Object? hospitals = freezed,
    Object? doctors = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      hospitals: hospitals == freezed
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<MapHospitalModel>,
      doctors: doctors == freezed
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MapDoctorModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_MapOrganizationStateCopyWith<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  factory _$$_MapOrganizationStateCopyWith(_$_MapOrganizationState value,
          $Res Function(_$_MapOrganizationState) then) =
      __$$_MapOrganizationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MapHospitalModel> hospitals,
      List<MapDoctorModel> doctors,
      FormzStatus status});
}

/// @nodoc
class __$$_MapOrganizationStateCopyWithImpl<$Res>
    extends _$MapOrganizationStateCopyWithImpl<$Res>
    implements _$$_MapOrganizationStateCopyWith<$Res> {
  __$$_MapOrganizationStateCopyWithImpl(_$_MapOrganizationState _value,
      $Res Function(_$_MapOrganizationState) _then)
      : super(_value, (v) => _then(v as _$_MapOrganizationState));

  @override
  _$_MapOrganizationState get _value => super._value as _$_MapOrganizationState;

  @override
  $Res call({
    Object? hospitals = freezed,
    Object? doctors = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_MapOrganizationState(
      hospitals: hospitals == freezed
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<MapHospitalModel>,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MapDoctorModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_MapOrganizationState implements _MapOrganizationState {
  _$_MapOrganizationState(
      {final List<MapHospitalModel> hospitals = const [],
      final List<MapDoctorModel> doctors = const [],
      this.status = FormzStatus.pure})
      : _hospitals = hospitals,
        _doctors = doctors;

  final List<MapHospitalModel> _hospitals;
  @override
  @JsonKey()
  List<MapHospitalModel> get hospitals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  final List<MapDoctorModel> _doctors;
  @override
  @JsonKey()
  List<MapDoctorModel> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'MapOrganizationState(hospitals: $hospitals, doctors: $doctors, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapOrganizationState &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hospitals),
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      __$$_MapOrganizationStateCopyWithImpl<_$_MapOrganizationState>(
          this, _$identity);
}

abstract class _MapOrganizationState implements MapOrganizationState {
  factory _MapOrganizationState(
      {final List<MapHospitalModel> hospitals,
      final List<MapDoctorModel> doctors,
      final FormzStatus status}) = _$_MapOrganizationState;

  @override
  List<MapHospitalModel> get hospitals;
  @override
  List<MapDoctorModel> get doctors;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}
