// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(int organizationId)? getFacilities,
    TResult? Function()? getMoreFacilities,
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
    TResult? Function(_GetFacilities value)? getFacilities,
    TResult? Function(_GetMoreFacilities value)? getMoreFacilities,
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
      _$FacilitiesEventCopyWithImpl<$Res, FacilitiesEvent>;
}

/// @nodoc
class _$FacilitiesEventCopyWithImpl<$Res, $Val extends FacilitiesEvent>
    implements $FacilitiesEventCopyWith<$Res> {
  _$FacilitiesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetFacilitiesCopyWith<$Res> {
  factory _$$_GetFacilitiesCopyWith(
          _$_GetFacilities value, $Res Function(_$_GetFacilities) then) =
      __$$_GetFacilitiesCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetFacilitiesCopyWithImpl<$Res>
    extends _$FacilitiesEventCopyWithImpl<$Res, _$_GetFacilities>
    implements _$$_GetFacilitiesCopyWith<$Res> {
  __$$_GetFacilitiesCopyWithImpl(
      _$_GetFacilities _value, $Res Function(_$_GetFacilities) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetFacilities(
      organizationId: null == organizationId
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
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(int organizationId)? getFacilities,
    TResult? Function()? getMoreFacilities,
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
    TResult? Function(_GetFacilities value)? getFacilities,
    TResult? Function(_GetMoreFacilities value)? getMoreFacilities,
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
    extends _$FacilitiesEventCopyWithImpl<$Res, _$_GetMoreFacilities>
    implements _$$_GetMoreFacilitiesCopyWith<$Res> {
  __$$_GetMoreFacilitiesCopyWithImpl(
      _$_GetMoreFacilities _value, $Res Function(_$_GetMoreFacilities) _then)
      : super(_value, _then);
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
    TResult? Function(int organizationId)? getFacilities,
    TResult? Function()? getMoreFacilities,
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
    TResult? Function(_GetFacilities value)? getFacilities,
    TResult? Function(_GetMoreFacilities value)? getMoreFacilities,
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
      _$FacilitiesStateCopyWithImpl<$Res, FacilitiesState>;
  @useResult
  $Res call(
      {List<ComfortEntity> comforts,
      FormzStatus status,
      bool fetchMore,
      String? next,
      int organizationId,
      int facilityCount});
}

/// @nodoc
class _$FacilitiesStateCopyWithImpl<$Res, $Val extends FacilitiesState>
    implements $FacilitiesStateCopyWith<$Res> {
  _$FacilitiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comforts = null,
    Object? status = null,
    Object? fetchMore = null,
    Object? next = freezed,
    Object? organizationId = null,
    Object? facilityCount = null,
  }) {
    return _then(_value.copyWith(
      comforts: null == comforts
          ? _value.comforts
          : comforts // ignore: cast_nullable_to_non_nullable
              as List<ComfortEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityCount: null == facilityCount
          ? _value.facilityCount
          : facilityCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilitiesStateCopyWith<$Res>
    implements $FacilitiesStateCopyWith<$Res> {
  factory _$$_FacilitiesStateCopyWith(
          _$_FacilitiesState value, $Res Function(_$_FacilitiesState) then) =
      __$$_FacilitiesStateCopyWithImpl<$Res>;
  @override
  @useResult
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
    extends _$FacilitiesStateCopyWithImpl<$Res, _$_FacilitiesState>
    implements _$$_FacilitiesStateCopyWith<$Res> {
  __$$_FacilitiesStateCopyWithImpl(
      _$_FacilitiesState _value, $Res Function(_$_FacilitiesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comforts = null,
    Object? status = null,
    Object? fetchMore = null,
    Object? next = freezed,
    Object? organizationId = null,
    Object? facilityCount = null,
  }) {
    return _then(_$_FacilitiesState(
      comforts: null == comforts
          ? _value._comforts
          : comforts // ignore: cast_nullable_to_non_nullable
              as List<ComfortEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityCount: null == facilityCount
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
    if (_comforts is EqualUnmodifiableListView) return _comforts;
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.facilityCount, facilityCount) ||
                other.facilityCount == facilityCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comforts),
      status,
      fetchMore,
      next,
      organizationId,
      facilityCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
