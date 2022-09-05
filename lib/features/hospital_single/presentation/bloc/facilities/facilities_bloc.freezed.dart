// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facilities_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FacilitiesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFacilities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFacilities value) getFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesEventCopyWith<$Res> {
  factory $FacilitiesEventCopyWith(
          FacilitiesEvent value, $Res Function(FacilitiesEvent) then) =
      _$FacilitiesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FacilitiesEventCopyWithImpl<$Res>
    implements $FacilitiesEventCopyWith<$Res> {
  _$FacilitiesEventCopyWithImpl(this._value, this._then);

  final FacilitiesEvent _value;
  // ignore: unused_field
  final $Res Function(FacilitiesEvent) _then;
}

/// @nodoc
abstract class _$$_GetFacilitiesCopyWith<$Res> {
  factory _$$_GetFacilitiesCopyWith(
          _$_GetFacilities value, $Res Function(_$_GetFacilities) then) =
      __$$_GetFacilitiesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetFacilitiesCopyWithImpl<$Res>
    extends _$FacilitiesEventCopyWithImpl<$Res>
    implements _$$_GetFacilitiesCopyWith<$Res> {
  __$$_GetFacilitiesCopyWithImpl(
      _$_GetFacilities _value, $Res Function(_$_GetFacilities) _then)
      : super(_value, (v) => _then(v as _$_GetFacilities));

  @override
  _$_GetFacilities get _value => super._value as _$_GetFacilities;
}

/// @nodoc

class _$_GetFacilities implements _GetFacilities {
  _$_GetFacilities();

  @override
  String toString() {
    return 'FacilitiesEvent.getFacilities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetFacilities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFacilities,
  }) {
    return getFacilities();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFacilities,
  }) {
    return getFacilities?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFacilities,
    required TResult orElse(),
  }) {
    if (getFacilities != null) {
      return getFacilities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFacilities value) getFacilities,
  }) {
    return getFacilities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
  }) {
    return getFacilities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    required TResult orElse(),
  }) {
    if (getFacilities != null) {
      return getFacilities(this);
    }
    return orElse();
  }
}

abstract class _GetFacilities implements FacilitiesEvent {
  factory _GetFacilities() = _$_GetFacilities;
}

/// @nodoc
mixin _$FacilitiesState {
  List<ComfortEntity> get comforts => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FacilitiesStateCopyWith<FacilitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilitiesStateCopyWith<$Res> {
  factory $FacilitiesStateCopyWith(
          FacilitiesState value, $Res Function(FacilitiesState) then) =
      _$FacilitiesStateCopyWithImpl<$Res>;
  $Res call(
      {List<ComfortEntity> comforts,
      FormzStatus status,
      int count,
      String next});
}

/// @nodoc
class _$FacilitiesStateCopyWithImpl<$Res>
    implements $FacilitiesStateCopyWith<$Res> {
  _$FacilitiesStateCopyWithImpl(this._value, this._then);

  final FacilitiesState _value;
  // ignore: unused_field
  final $Res Function(FacilitiesState) _then;

  @override
  $Res call({
    Object? comforts = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      comforts: comforts == freezed
          ? _value.comforts
          : comforts // ignore: cast_nullable_to_non_nullable
              as List<ComfortEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FacilitiesStateCopyWith<$Res>
    implements $FacilitiesStateCopyWith<$Res> {
  factory _$$_FacilitiesStateCopyWith(
          _$_FacilitiesState value, $Res Function(_$_FacilitiesState) then) =
      __$$_FacilitiesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ComfortEntity> comforts,
      FormzStatus status,
      int count,
      String next});
}

/// @nodoc
class __$$_FacilitiesStateCopyWithImpl<$Res>
    extends _$FacilitiesStateCopyWithImpl<$Res>
    implements _$$_FacilitiesStateCopyWith<$Res> {
  __$$_FacilitiesStateCopyWithImpl(
      _$_FacilitiesState _value, $Res Function(_$_FacilitiesState) _then)
      : super(_value, (v) => _then(v as _$_FacilitiesState));

  @override
  _$_FacilitiesState get _value => super._value as _$_FacilitiesState;

  @override
  $Res call({
    Object? comforts = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_$_FacilitiesState(
      comforts: comforts == freezed
          ? _value._comforts
          : comforts // ignore: cast_nullable_to_non_nullable
              as List<ComfortEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FacilitiesState implements _FacilitiesState {
  _$_FacilitiesState(
      {final List<ComfortEntity> comforts = const [],
      this.status = FormzStatus.pure,
      this.count = 0,
      this.next = ''})
      : _comforts = comforts;

  final List<ComfortEntity> _comforts;
  @override
  @JsonKey()
  List<ComfortEntity> get comforts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comforts);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final String next;

  @override
  String toString() {
    return 'FacilitiesState(comforts: $comforts, status: $status, count: $count, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilitiesState &&
            const DeepCollectionEquality().equals(other._comforts, _comforts) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.next, next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comforts),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(next));

  @JsonKey(ignore: true)
  @override
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      __$$_FacilitiesStateCopyWithImpl<_$_FacilitiesState>(this, _$identity);
}

abstract class _FacilitiesState implements FacilitiesState {
  factory _FacilitiesState(
      {final List<ComfortEntity> comforts,
      final FormzStatus status,
      final int count,
      final String next}) = _$_FacilitiesState;

  @override
  List<ComfortEntity> get comforts;
  @override
  FormzStatus get status;
  @override
  int get count;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}
