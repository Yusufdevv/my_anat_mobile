// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hospital_specialist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HospitalSpecialistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSpecialists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSpecialists value) getSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSpecialistEventCopyWith<$Res> {
  factory $HospitalSpecialistEventCopyWith(HospitalSpecialistEvent value,
          $Res Function(HospitalSpecialistEvent) then) =
      _$HospitalSpecialistEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HospitalSpecialistEventCopyWithImpl<$Res>
    implements $HospitalSpecialistEventCopyWith<$Res> {
  _$HospitalSpecialistEventCopyWithImpl(this._value, this._then);

  final HospitalSpecialistEvent _value;
  // ignore: unused_field
  final $Res Function(HospitalSpecialistEvent) _then;
}

/// @nodoc
abstract class _$$_GetSpecialistsCopyWith<$Res> {
  factory _$$_GetSpecialistsCopyWith(
          _$_GetSpecialists value, $Res Function(_$_GetSpecialists) then) =
      __$$_GetSpecialistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetSpecialistsCopyWithImpl<$Res>
    extends _$HospitalSpecialistEventCopyWithImpl<$Res>
    implements _$$_GetSpecialistsCopyWith<$Res> {
  __$$_GetSpecialistsCopyWithImpl(
      _$_GetSpecialists _value, $Res Function(_$_GetSpecialists) _then)
      : super(_value, (v) => _then(v as _$_GetSpecialists));

  @override
  _$_GetSpecialists get _value => super._value as _$_GetSpecialists;
}

/// @nodoc

class _$_GetSpecialists implements _GetSpecialists {
  _$_GetSpecialists();

  @override
  String toString() {
    return 'HospitalSpecialistEvent.getSpecialists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetSpecialists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSpecialists,
  }) {
    return getSpecialists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getSpecialists,
  }) {
    return getSpecialists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSpecialists,
    required TResult orElse(),
  }) {
    if (getSpecialists != null) {
      return getSpecialists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSpecialists value) getSpecialists,
  }) {
    return getSpecialists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
  }) {
    return getSpecialists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
    required TResult orElse(),
  }) {
    if (getSpecialists != null) {
      return getSpecialists(this);
    }
    return orElse();
  }
}

abstract class _GetSpecialists implements HospitalSpecialistEvent {
  factory _GetSpecialists() = _$_GetSpecialists;
}

/// @nodoc
mixin _$HospitalSpecialistState {
  List<DoctorsModel> get specialists => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalSpecialistStateCopyWith<HospitalSpecialistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSpecialistStateCopyWith<$Res> {
  factory $HospitalSpecialistStateCopyWith(HospitalSpecialistState value,
          $Res Function(HospitalSpecialistState) then) =
      _$HospitalSpecialistStateCopyWithImpl<$Res>;
  $Res call(
      {List<DoctorsModel> specialists,
      FormzStatus status,
      String next,
      int count});
}

/// @nodoc
class _$HospitalSpecialistStateCopyWithImpl<$Res>
    implements $HospitalSpecialistStateCopyWith<$Res> {
  _$HospitalSpecialistStateCopyWithImpl(this._value, this._then);

  final HospitalSpecialistState _value;
  // ignore: unused_field
  final $Res Function(HospitalSpecialistState) _then;

  @override
  $Res call({
    Object? specialists = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      specialists: specialists == freezed
          ? _value.specialists
          : specialists // ignore: cast_nullable_to_non_nullable
              as List<DoctorsModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HospitalSpecialistStateCopyWith<$Res>
    implements $HospitalSpecialistStateCopyWith<$Res> {
  factory _$$_HospitalSpecialistStateCopyWith(_$_HospitalSpecialistState value,
          $Res Function(_$_HospitalSpecialistState) then) =
      __$$_HospitalSpecialistStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DoctorsModel> specialists,
      FormzStatus status,
      String next,
      int count});
}

/// @nodoc
class __$$_HospitalSpecialistStateCopyWithImpl<$Res>
    extends _$HospitalSpecialistStateCopyWithImpl<$Res>
    implements _$$_HospitalSpecialistStateCopyWith<$Res> {
  __$$_HospitalSpecialistStateCopyWithImpl(_$_HospitalSpecialistState _value,
      $Res Function(_$_HospitalSpecialistState) _then)
      : super(_value, (v) => _then(v as _$_HospitalSpecialistState));

  @override
  _$_HospitalSpecialistState get _value =>
      super._value as _$_HospitalSpecialistState;

  @override
  $Res call({
    Object? specialists = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_HospitalSpecialistState(
      specialists: specialists == freezed
          ? _value._specialists
          : specialists // ignore: cast_nullable_to_non_nullable
              as List<DoctorsModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HospitalSpecialistState implements _HospitalSpecialistState {
  _$_HospitalSpecialistState(
      {final List<DoctorsModel> specialists = const [],
      this.status = FormzStatus.pure,
      this.next = '',
      this.count = 0})
      : _specialists = specialists;

  final List<DoctorsModel> _specialists;
  @override
  @JsonKey()
  List<DoctorsModel> get specialists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialists);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final String next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'HospitalSpecialistState(specialists: $specialists, status: $status, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalSpecialistState &&
            const DeepCollectionEquality()
                .equals(other._specialists, _specialists) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_specialists),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalSpecialistStateCopyWith<_$_HospitalSpecialistState>
      get copyWith =>
          __$$_HospitalSpecialistStateCopyWithImpl<_$_HospitalSpecialistState>(
              this, _$identity);
}

abstract class _HospitalSpecialistState implements HospitalSpecialistState {
  factory _HospitalSpecialistState(
      {final List<DoctorsModel> specialists,
      final FormzStatus status,
      final String next,
      final int count}) = _$_HospitalSpecialistState;

  @override
  List<DoctorsModel> get specialists;
  @override
  FormzStatus get status;
  @override
  String get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalSpecialistStateCopyWith<_$_HospitalSpecialistState>
      get copyWith => throw _privateConstructorUsedError;
}
