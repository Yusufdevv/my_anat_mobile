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
    required TResult Function(int organizationId) getFacilities,
    required TResult Function() getMoreFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFacilities value) getFacilities,
    required TResult Function(_GetMoreFacilities value) getMoreFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
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
  $Res call({int organizationId});
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

  @override
  $Res call({
    Object? organizationId = freezed,
  }) {
    return _then(_$_GetFacilities(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetFacilities implements _GetFacilities {
  _$_GetFacilities({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString() {
    return 'FacilitiesEvent.getFacilities(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFacilities &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(organizationId));

  @JsonKey(ignore: true)
  @override
  _$$_GetFacilitiesCopyWith<_$_GetFacilities> get copyWith =>
      __$$_GetFacilitiesCopyWithImpl<_$_GetFacilities>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getFacilities,
    required TResult Function() getMoreFacilities,
  }) {
    return getFacilities(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
  }) {
    return getFacilities?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
    required TResult orElse(),
  }) {
    if (getFacilities != null) {
      return getFacilities(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFacilities value) getFacilities,
    required TResult Function(_GetMoreFacilities value) getMoreFacilities,
  }) {
    return getFacilities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
  }) {
    return getFacilities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
    required TResult orElse(),
  }) {
    if (getFacilities != null) {
      return getFacilities(this);
    }
    return orElse();
  }
}

abstract class _GetFacilities implements FacilitiesEvent {
  factory _GetFacilities({required final int organizationId}) =
      _$_GetFacilities;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetFacilitiesCopyWith<_$_GetFacilities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreFacilitiesCopyWith<$Res> {
  factory _$$_GetMoreFacilitiesCopyWith(_$_GetMoreFacilities value,
          $Res Function(_$_GetMoreFacilities) then) =
      __$$_GetMoreFacilitiesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreFacilitiesCopyWithImpl<$Res>
    extends _$FacilitiesEventCopyWithImpl<$Res>
    implements _$$_GetMoreFacilitiesCopyWith<$Res> {
  __$$_GetMoreFacilitiesCopyWithImpl(
      _$_GetMoreFacilities _value, $Res Function(_$_GetMoreFacilities) _then)
      : super(_value, (v) => _then(v as _$_GetMoreFacilities));

  @override
  _$_GetMoreFacilities get _value => super._value as _$_GetMoreFacilities;
}

/// @nodoc

class _$_GetMoreFacilities implements _GetMoreFacilities {
  _$_GetMoreFacilities();

  @override
  String toString() {
    return 'FacilitiesEvent.getMoreFacilities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreFacilities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getFacilities,
    required TResult Function() getMoreFacilities,
  }) {
    return getMoreFacilities();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
  }) {
    return getMoreFacilities?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getFacilities,
    TResult Function()? getMoreFacilities,
    required TResult orElse(),
  }) {
    if (getMoreFacilities != null) {
      return getMoreFacilities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFacilities value) getFacilities,
    required TResult Function(_GetMoreFacilities value) getMoreFacilities,
  }) {
    return getMoreFacilities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
  }) {
    return getMoreFacilities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFacilities value)? getFacilities,
    TResult Function(_GetMoreFacilities value)? getMoreFacilities,
    required TResult orElse(),
  }) {
    if (getMoreFacilities != null) {
      return getMoreFacilities(this);
    }
    return orElse();
  }
}

abstract class _GetMoreFacilities implements FacilitiesEvent {
  factory _GetMoreFacilities() = _$_GetMoreFacilities;
}

/// @nodoc
mixin _$FacilitiesState {
  List<ComfortEntity> get comforts => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  int get organizationId => throw _privateConstructorUsedError;
  int get facilityCount => throw _privateConstructorUsedError;

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
      bool fetchMore,
      String? next,
      int organizationId,
      int facilityCount});
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
    Object? fetchMore = freezed,
    Object? next = freezed,
    Object? organizationId = freezed,
    Object? facilityCount = freezed,
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
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityCount: facilityCount == freezed
          ? _value.facilityCount
          : facilityCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      bool fetchMore,
      String? next,
      int organizationId,
      int facilityCount});
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
    Object? fetchMore = freezed,
    Object? next = freezed,
    Object? organizationId = freezed,
    Object? facilityCount = freezed,
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
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityCount: facilityCount == freezed
          ? _value.facilityCount
          : facilityCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FacilitiesState implements _FacilitiesState {
  _$_FacilitiesState(
      {final List<ComfortEntity> comforts = const [],
      this.status = FormzStatus.pure,
      this.fetchMore = false,
      this.next,
      this.organizationId = 0,
      this.facilityCount = 0})
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
  final bool fetchMore;
  @override
  final String? next;
  @override
  @JsonKey()
  final int organizationId;
  @override
  @JsonKey()
  final int facilityCount;

  @override
  String toString() {
    return 'FacilitiesState(comforts: $comforts, status: $status, fetchMore: $fetchMore, next: $next, organizationId: $organizationId, facilityCount: $facilityCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilitiesState &&
            const DeepCollectionEquality().equals(other._comforts, _comforts) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId) &&
            const DeepCollectionEquality()
                .equals(other.facilityCount, facilityCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comforts),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(fetchMore),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(organizationId),
      const DeepCollectionEquality().hash(facilityCount));

  @JsonKey(ignore: true)
  @override
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      __$$_FacilitiesStateCopyWithImpl<_$_FacilitiesState>(this, _$identity);
}

abstract class _FacilitiesState implements FacilitiesState {
  factory _FacilitiesState(
      {final List<ComfortEntity> comforts,
      final FormzStatus status,
      final bool fetchMore,
      final String? next,
      final int organizationId,
      final int facilityCount}) = _$_FacilitiesState;

  @override
  List<ComfortEntity> get comforts;
  @override
  FormzStatus get status;
  @override
  bool get fetchMore;
  @override
  String? get next;
  @override
  int get organizationId;
  @override
  int get facilityCount;
  @override
  @JsonKey(ignore: true)
  _$$_FacilitiesStateCopyWith<_$_FacilitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}
