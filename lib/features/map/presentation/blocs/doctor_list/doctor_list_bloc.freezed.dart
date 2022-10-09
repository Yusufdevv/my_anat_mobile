// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(String search) getDoctors,
    required TResult Function() getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
    TResult Function()? getMoreDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
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
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
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
      _$DoctorListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DoctorListEventCopyWithImpl<$Res>
    implements $DoctorListEventCopyWith<$Res> {
  _$DoctorListEventCopyWithImpl(this._value, this._then);

  final DoctorListEvent _value;
  // ignore: unused_field
  final $Res Function(DoctorListEvent) _then;
}

/// @nodoc
abstract class _$$_GetDoctorsCopyWith<$Res> {
  factory _$$_GetDoctorsCopyWith(
          _$_GetDoctors value, $Res Function(_$_GetDoctors) then) =
      __$$_GetDoctorsCopyWithImpl<$Res>;
  $Res call({String search});
}

/// @nodoc
class __$$_GetDoctorsCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$_GetDoctorsCopyWith<$Res> {
  __$$_GetDoctorsCopyWithImpl(
      _$_GetDoctors _value, $Res Function(_$_GetDoctors) _then)
      : super(_value, (v) => _then(v as _$_GetDoctors));

  @override
  _$_GetDoctors get _value => super._value as _$_GetDoctors;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetDoctors(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetDoctors implements _GetDoctors {
  _$_GetDoctors({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'DoctorListEvent.getDoctors(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctors &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      __$$_GetDoctorsCopyWithImpl<_$_GetDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) getDoctors,
    required TResult Function() getMoreDoctors,
  }) {
    return getDoctors(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
    TResult Function()? getMoreDoctors,
  }) {
    return getDoctors?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
    TResult Function()? getMoreDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(search);
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
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
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
  factory _GetDoctors({required final String search}) = _$_GetDoctors;

  String get search;
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
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$_GetMoreDoctorsCopyWith<$Res> {
  __$$_GetMoreDoctorsCopyWithImpl(
      _$_GetMoreDoctors _value, $Res Function(_$_GetMoreDoctors) _then)
      : super(_value, (v) => _then(v as _$_GetMoreDoctors));

  @override
  _$_GetMoreDoctors get _value => super._value as _$_GetMoreDoctors;
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
    required TResult Function(String search) getDoctors,
    required TResult Function() getMoreDoctors,
  }) {
    return getMoreDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
    TResult Function()? getMoreDoctors,
  }) {
    return getMoreDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? getDoctors,
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
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetMoreDoctors value)? getMoreDoctors,
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
      _$DoctorListStateCopyWithImpl<$Res>;
  $Res call(
      {List<HospitalDoctorsEntity> doctors,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class _$DoctorListStateCopyWithImpl<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  _$DoctorListStateCopyWithImpl(this._value, this._then);

  final DoctorListState _value;
  // ignore: unused_field
  final $Res Function(DoctorListState) _then;

  @override
  $Res call({
    Object? doctors = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_value.copyWith(
      doctors: doctors == freezed
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DoctorListStateCopyWith<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  factory _$$_DoctorListStateCopyWith(
          _$_DoctorListState value, $Res Function(_$_DoctorListState) then) =
      __$$_DoctorListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<HospitalDoctorsEntity> doctors,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class __$$_DoctorListStateCopyWithImpl<$Res>
    extends _$DoctorListStateCopyWithImpl<$Res>
    implements _$$_DoctorListStateCopyWith<$Res> {
  __$$_DoctorListStateCopyWithImpl(
      _$_DoctorListState _value, $Res Function(_$_DoctorListState) _then)
      : super(_value, (v) => _then(v as _$_DoctorListState));

  @override
  _$_DoctorListState get _value => super._value as _$_DoctorListState;

  @override
  $Res call({
    Object? doctors = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_$_DoctorListState(
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<HospitalDoctorsEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
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
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore));

  @JsonKey(ignore: true)
  @override
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
