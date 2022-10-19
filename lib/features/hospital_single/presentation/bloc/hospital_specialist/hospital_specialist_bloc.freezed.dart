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
    required TResult Function(int organizationId) getSpecialists,
    required TResult Function() getMoreSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getSpecialists,
    TResult? Function()? getMoreSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getSpecialists,
    TResult Function()? getMoreSpecialists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSpecialists value) getSpecialists,
    required TResult Function(_GetMoreSpecialists value) getMoreSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSpecialists value)? getSpecialists,
    TResult? Function(_GetMoreSpecialists value)? getMoreSpecialists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
    TResult Function(_GetMoreSpecialists value)? getMoreSpecialists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSpecialistEventCopyWith<$Res> {
  factory $HospitalSpecialistEventCopyWith(HospitalSpecialistEvent value,
          $Res Function(HospitalSpecialistEvent) then) =
      _$HospitalSpecialistEventCopyWithImpl<$Res, HospitalSpecialistEvent>;
}

/// @nodoc
class _$HospitalSpecialistEventCopyWithImpl<$Res,
        $Val extends HospitalSpecialistEvent>
    implements $HospitalSpecialistEventCopyWith<$Res> {
  _$HospitalSpecialistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetSpecialistsCopyWith<$Res> {
  factory _$$_GetSpecialistsCopyWith(
          _$_GetSpecialists value, $Res Function(_$_GetSpecialists) then) =
      __$$_GetSpecialistsCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetSpecialistsCopyWithImpl<$Res>
    extends _$HospitalSpecialistEventCopyWithImpl<$Res, _$_GetSpecialists>
    implements _$$_GetSpecialistsCopyWith<$Res> {
  __$$_GetSpecialistsCopyWithImpl(
      _$_GetSpecialists _value, $Res Function(_$_GetSpecialists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetSpecialists(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetSpecialists implements _GetSpecialists {
  _$_GetSpecialists({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString() {
    return 'HospitalSpecialistEvent.getSpecialists(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSpecialists &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSpecialistsCopyWith<_$_GetSpecialists> get copyWith =>
      __$$_GetSpecialistsCopyWithImpl<_$_GetSpecialists>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getSpecialists,
    required TResult Function() getMoreSpecialists,
  }) {
    return getSpecialists(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getSpecialists,
    TResult? Function()? getMoreSpecialists,
  }) {
    return getSpecialists?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getSpecialists,
    TResult Function()? getMoreSpecialists,
    required TResult orElse(),
  }) {
    if (getSpecialists != null) {
      return getSpecialists(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSpecialists value) getSpecialists,
    required TResult Function(_GetMoreSpecialists value) getMoreSpecialists,
  }) {
    return getSpecialists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSpecialists value)? getSpecialists,
    TResult? Function(_GetMoreSpecialists value)? getMoreSpecialists,
  }) {
    return getSpecialists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
    TResult Function(_GetMoreSpecialists value)? getMoreSpecialists,
    required TResult orElse(),
  }) {
    if (getSpecialists != null) {
      return getSpecialists(this);
    }
    return orElse();
  }
}

abstract class _GetSpecialists implements HospitalSpecialistEvent {
  factory _GetSpecialists({required final int organizationId}) =
      _$_GetSpecialists;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetSpecialistsCopyWith<_$_GetSpecialists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreSpecialistsCopyWith<$Res> {
  factory _$$_GetMoreSpecialistsCopyWith(_$_GetMoreSpecialists value,
          $Res Function(_$_GetMoreSpecialists) then) =
      __$$_GetMoreSpecialistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreSpecialistsCopyWithImpl<$Res>
    extends _$HospitalSpecialistEventCopyWithImpl<$Res, _$_GetMoreSpecialists>
    implements _$$_GetMoreSpecialistsCopyWith<$Res> {
  __$$_GetMoreSpecialistsCopyWithImpl(
      _$_GetMoreSpecialists _value, $Res Function(_$_GetMoreSpecialists) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreSpecialists implements _GetMoreSpecialists {
  _$_GetMoreSpecialists();

  @override
  String toString() {
    return 'HospitalSpecialistEvent.getMoreSpecialists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreSpecialists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getSpecialists,
    required TResult Function() getMoreSpecialists,
  }) {
    return getMoreSpecialists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getSpecialists,
    TResult? Function()? getMoreSpecialists,
  }) {
    return getMoreSpecialists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getSpecialists,
    TResult Function()? getMoreSpecialists,
    required TResult orElse(),
  }) {
    if (getMoreSpecialists != null) {
      return getMoreSpecialists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSpecialists value) getSpecialists,
    required TResult Function(_GetMoreSpecialists value) getMoreSpecialists,
  }) {
    return getMoreSpecialists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSpecialists value)? getSpecialists,
    TResult? Function(_GetMoreSpecialists value)? getMoreSpecialists,
  }) {
    return getMoreSpecialists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSpecialists value)? getSpecialists,
    TResult Function(_GetMoreSpecialists value)? getMoreSpecialists,
    required TResult orElse(),
  }) {
    if (getMoreSpecialists != null) {
      return getMoreSpecialists(this);
    }
    return orElse();
  }
}

abstract class _GetMoreSpecialists implements HospitalSpecialistEvent {
  factory _GetMoreSpecialists() = _$_GetMoreSpecialists;
}

/// @nodoc
mixin _$HospitalSpecialistState {
  List<HospitalDoctorsEntity> get specialists =>
      throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get organizationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalSpecialistStateCopyWith<HospitalSpecialistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSpecialistStateCopyWith<$Res> {
  factory $HospitalSpecialistStateCopyWith(HospitalSpecialistState value,
          $Res Function(HospitalSpecialistState) then) =
      _$HospitalSpecialistStateCopyWithImpl<$Res, HospitalSpecialistState>;
  @useResult
  $Res call(
      {List<HospitalDoctorsEntity> specialists,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      bool fetchMore,
      int organizationId});
}

/// @nodoc
class _$HospitalSpecialistStateCopyWithImpl<$Res,
        $Val extends HospitalSpecialistState>
    implements $HospitalSpecialistStateCopyWith<$Res> {
  _$HospitalSpecialistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialists = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
  }) {
    return _then(_value.copyWith(
      specialists: null == specialists
          ? _value.specialists
          : specialists // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HospitalSpecialistStateCopyWith<$Res>
    implements $HospitalSpecialistStateCopyWith<$Res> {
  factory _$$_HospitalSpecialistStateCopyWith(_$_HospitalSpecialistState value,
          $Res Function(_$_HospitalSpecialistState) then) =
      __$$_HospitalSpecialistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HospitalDoctorsEntity> specialists,
      FormzStatus status,
      FormzStatus paginationStatus,
      String? next,
      bool fetchMore,
      int organizationId});
}

/// @nodoc
class __$$_HospitalSpecialistStateCopyWithImpl<$Res>
    extends _$HospitalSpecialistStateCopyWithImpl<$Res,
        _$_HospitalSpecialistState>
    implements _$$_HospitalSpecialistStateCopyWith<$Res> {
  __$$_HospitalSpecialistStateCopyWithImpl(_$_HospitalSpecialistState _value,
      $Res Function(_$_HospitalSpecialistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialists = null,
    Object? status = null,
    Object? paginationStatus = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
  }) {
    return _then(_$_HospitalSpecialistState(
      specialists: null == specialists
          ? _value._specialists
          : specialists // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
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
    ));
  }
}

/// @nodoc

class _$_HospitalSpecialistState implements _HospitalSpecialistState {
  _$_HospitalSpecialistState(
      {final List<HospitalDoctorsEntity> specialists = const [],
      this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      this.next,
      this.fetchMore = false,
      this.organizationId = 0})
      : _specialists = specialists;

  final List<HospitalDoctorsEntity> _specialists;
  @override
  @JsonKey()
  List<HospitalDoctorsEntity> get specialists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialists);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final int organizationId;

  @override
  String toString() {
    return 'HospitalSpecialistState(specialists: $specialists, status: $status, paginationStatus: $paginationStatus, next: $next, fetchMore: $fetchMore, organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalSpecialistState &&
            const DeepCollectionEquality()
                .equals(other._specialists, _specialists) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_specialists),
      status,
      paginationStatus,
      next,
      fetchMore,
      organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HospitalSpecialistStateCopyWith<_$_HospitalSpecialistState>
      get copyWith =>
          __$$_HospitalSpecialistStateCopyWithImpl<_$_HospitalSpecialistState>(
              this, _$identity);
}

abstract class _HospitalSpecialistState implements HospitalSpecialistState {
  factory _HospitalSpecialistState(
      {final List<HospitalDoctorsEntity> specialists,
      final FormzStatus status,
      final FormzStatus paginationStatus,
      final String? next,
      final bool fetchMore,
      final int organizationId}) = _$_HospitalSpecialistState;

  @override
  List<HospitalDoctorsEntity> get specialists;
  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  int get organizationId;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalSpecialistStateCopyWith<_$_HospitalSpecialistState>
      get copyWith => throw _privateConstructorUsedError;
}
