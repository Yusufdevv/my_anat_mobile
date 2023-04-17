// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DoctorListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search, Point myPoint) getDoctors,
    required TResult Function() getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search, Point myPoint)? getDoctors,
    TResult? Function()? getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search, Point myPoint)? getDoctors,
    TResult Function()? getMoreDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetMoreDoctors value) getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetMoreDoctors value)? getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorListEventCopyWith<$Res> {
  factory $DoctorListEventCopyWith(
          DoctorListEvent value, $Res Function(DoctorListEvent) then) =
      _$DoctorListEventCopyWithImpl<$Res, DoctorListEvent>;
}

/// @nodoc
class _$DoctorListEventCopyWithImpl<$Res, $Val extends DoctorListEvent>
    implements $DoctorListEventCopyWith<$Res> {
  _$DoctorListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetDoctorsCopyWith<$Res> {
  factory _$$_GetDoctorsCopyWith(
          _$_GetDoctors value, $Res Function(_$_GetDoctors) then) =
      __$$_GetDoctorsCopyWithImpl<$Res>;
  @useResult
  $Res call({String search, Point myPoint});
}

/// @nodoc
class __$$_GetDoctorsCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res, _$_GetDoctors>
    implements _$$_GetDoctorsCopyWith<$Res> {
  __$$_GetDoctorsCopyWithImpl(
      _$_GetDoctors _value, $Res Function(_$_GetDoctors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? myPoint = null,
  }) {
    return _then(_$_GetDoctors(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      myPoint: null == myPoint
          ? _value.myPoint
          : myPoint // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc

class _$_GetDoctors implements _GetDoctors {
  _$_GetDoctors({required this.search, required this.myPoint});

  @override
  final String search;
  @override
  final Point myPoint;

  @override
  String toString() {
    return 'DoctorListEvent.getDoctors(search: $search, myPoint: $myPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctors &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.myPoint, myPoint) || other.myPoint == myPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, myPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      __$$_GetDoctorsCopyWithImpl<_$_GetDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search, Point myPoint) getDoctors,
    required TResult Function() getMoreDoctors,
  }) {
    return getDoctors(search, myPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search, Point myPoint)? getDoctors,
    TResult? Function()? getMoreDoctors,
  }) {
    return getDoctors?.call(search, myPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search, Point myPoint)? getDoctors,
    TResult Function()? getMoreDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(search, myPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetMoreDoctors value) getMoreDoctors,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetMoreDoctors value)? getMoreDoctors,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements DoctorListEvent {
  factory _GetDoctors(
      {required final String search,
      required final Point myPoint}) = _$_GetDoctors;

  String get search;
  Point get myPoint;
  @JsonKey(ignore: true)
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreDoctorsCopyWith<$Res> {
  factory _$$_GetMoreDoctorsCopyWith(
          _$_GetMoreDoctors value, $Res Function(_$_GetMoreDoctors) then) =
      __$$_GetMoreDoctorsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreDoctorsCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res, _$_GetMoreDoctors>
    implements _$$_GetMoreDoctorsCopyWith<$Res> {
  __$$_GetMoreDoctorsCopyWithImpl(
      _$_GetMoreDoctors _value, $Res Function(_$_GetMoreDoctors) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreDoctors implements _GetMoreDoctors {
  _$_GetMoreDoctors();

  @override
  String toString() {
    return 'DoctorListEvent.getMoreDoctors()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreDoctors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search, Point myPoint) getDoctors,
    required TResult Function() getMoreDoctors,
  }) {
    return getMoreDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search, Point myPoint)? getDoctors,
    TResult? Function()? getMoreDoctors,
  }) {
    return getMoreDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search, Point myPoint)? getDoctors,
    TResult Function()? getMoreDoctors,
    required TResult orElse(),
  }) {
    if (getMoreDoctors != null) {
      return getMoreDoctors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetMoreDoctors value) getMoreDoctors,
  }) {
    return getMoreDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetMoreDoctors value)? getMoreDoctors,
  }) {
    return getMoreDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
    required TResult orElse(),
  }) {
    if (getMoreDoctors != null) {
      return getMoreDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetMoreDoctors implements DoctorListEvent {
  factory _GetMoreDoctors() = _$_GetMoreDoctors;
}

/// @nodoc
mixin _$DoctorListState {
  List<HospitalDoctorsEntity> get doctors => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorListStateCopyWith<DoctorListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorListStateCopyWith<$Res> {
  factory $DoctorListStateCopyWith(
          DoctorListState value, $Res Function(DoctorListState) then) =
      _$DoctorListStateCopyWithImpl<$Res, DoctorListState>;
  @useResult
  $Res call(
      {List<HospitalDoctorsEntity> doctors,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class _$DoctorListStateCopyWithImpl<$Res, $Val extends DoctorListState>
    implements $DoctorListStateCopyWith<$Res> {
  _$DoctorListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
    Object? next = freezed,
    Object? fetchMore = null,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoctorListStateCopyWith<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  factory _$$_DoctorListStateCopyWith(
          _$_DoctorListState value, $Res Function(_$_DoctorListState) then) =
      __$$_DoctorListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HospitalDoctorsEntity> doctors,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class __$$_DoctorListStateCopyWithImpl<$Res>
    extends _$DoctorListStateCopyWithImpl<$Res, _$_DoctorListState>
    implements _$$_DoctorListStateCopyWith<$Res> {
  __$$_DoctorListStateCopyWithImpl(
      _$_DoctorListState _value, $Res Function(_$_DoctorListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
    Object? next = freezed,
    Object? fetchMore = null,
  }) {
    return _then(_$_DoctorListState(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DoctorListState implements _DoctorListState {
  _$_DoctorListState(
      {final List<HospitalDoctorsEntity> doctors = const [],
      this.status = FormzStatus.pure,
      this.next,
      this.fetchMore = false})
      : _doctors = doctors;

  final List<HospitalDoctorsEntity> _doctors;
  @override
  @JsonKey()
  List<HospitalDoctorsEntity> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;

  @override
  String toString() {
    return 'DoctorListState(doctors: $doctors, status: $status, next: $next, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoctorListState &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_doctors), status, next, fetchMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoctorListStateCopyWith<_$_DoctorListState> get copyWith =>
      __$$_DoctorListStateCopyWithImpl<_$_DoctorListState>(this, _$identity);
}

abstract class _DoctorListState implements DoctorListState {
  factory _DoctorListState(
      {final List<HospitalDoctorsEntity> doctors,
      final FormzStatus status,
      final String? next,
      final bool fetchMore}) = _$_DoctorListState;

  @override
  List<HospitalDoctorsEntity> get doctors;
  @override
  FormzStatus get status;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_DoctorListStateCopyWith<_$_DoctorListState> get copyWith =>
      throw _privateConstructorUsedError;
}
