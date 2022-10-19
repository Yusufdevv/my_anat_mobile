// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hospital_vacancies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HospitalVacanciesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getVacancies,
    required TResult Function() getMoreVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getVacancies,
    TResult? Function()? getMoreVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getVacancies,
    TResult Function()? getMoreVacancies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVacancies value) getVacancies,
    required TResult Function(_GetMoreVacancies value) getMoreVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVacancies value)? getVacancies,
    TResult? Function(_GetMoreVacancies value)? getMoreVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
    TResult Function(_GetMoreVacancies value)? getMoreVacancies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVacanciesEventCopyWith<$Res> {
  factory $HospitalVacanciesEventCopyWith(HospitalVacanciesEvent value,
          $Res Function(HospitalVacanciesEvent) then) =
      _$HospitalVacanciesEventCopyWithImpl<$Res, HospitalVacanciesEvent>;
}

/// @nodoc
class _$HospitalVacanciesEventCopyWithImpl<$Res,
        $Val extends HospitalVacanciesEvent>
    implements $HospitalVacanciesEventCopyWith<$Res> {
  _$HospitalVacanciesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetVacanciesCopyWith<$Res> {
  factory _$$_GetVacanciesCopyWith(
          _$_GetVacancies value, $Res Function(_$_GetVacancies) then) =
      __$$_GetVacanciesCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetVacanciesCopyWithImpl<$Res>
    extends _$HospitalVacanciesEventCopyWithImpl<$Res, _$_GetVacancies>
    implements _$$_GetVacanciesCopyWith<$Res> {
  __$$_GetVacanciesCopyWithImpl(
      _$_GetVacancies _value, $Res Function(_$_GetVacancies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetVacancies(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetVacancies implements _GetVacancies {
  _$_GetVacancies({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString() {
    return 'HospitalVacanciesEvent.getVacancies(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetVacancies &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetVacanciesCopyWith<_$_GetVacancies> get copyWith =>
      __$$_GetVacanciesCopyWithImpl<_$_GetVacancies>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getVacancies,
    required TResult Function() getMoreVacancies,
  }) {
    return getVacancies(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getVacancies,
    TResult? Function()? getMoreVacancies,
  }) {
    return getVacancies?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getVacancies,
    TResult Function()? getMoreVacancies,
    required TResult orElse(),
  }) {
    if (getVacancies != null) {
      return getVacancies(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVacancies value) getVacancies,
    required TResult Function(_GetMoreVacancies value) getMoreVacancies,
  }) {
    return getVacancies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVacancies value)? getVacancies,
    TResult? Function(_GetMoreVacancies value)? getMoreVacancies,
  }) {
    return getVacancies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
    TResult Function(_GetMoreVacancies value)? getMoreVacancies,
    required TResult orElse(),
  }) {
    if (getVacancies != null) {
      return getVacancies(this);
    }
    return orElse();
  }
}

abstract class _GetVacancies implements HospitalVacanciesEvent {
  factory _GetVacancies({required final int organizationId}) = _$_GetVacancies;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetVacanciesCopyWith<_$_GetVacancies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreVacanciesCopyWith<$Res> {
  factory _$$_GetMoreVacanciesCopyWith(
          _$_GetMoreVacancies value, $Res Function(_$_GetMoreVacancies) then) =
      __$$_GetMoreVacanciesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreVacanciesCopyWithImpl<$Res>
    extends _$HospitalVacanciesEventCopyWithImpl<$Res, _$_GetMoreVacancies>
    implements _$$_GetMoreVacanciesCopyWith<$Res> {
  __$$_GetMoreVacanciesCopyWithImpl(
      _$_GetMoreVacancies _value, $Res Function(_$_GetMoreVacancies) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreVacancies implements _GetMoreVacancies {
  _$_GetMoreVacancies();

  @override
  String toString() {
    return 'HospitalVacanciesEvent.getMoreVacancies()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreVacancies);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getVacancies,
    required TResult Function() getMoreVacancies,
  }) {
    return getMoreVacancies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getVacancies,
    TResult? Function()? getMoreVacancies,
  }) {
    return getMoreVacancies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getVacancies,
    TResult Function()? getMoreVacancies,
    required TResult orElse(),
  }) {
    if (getMoreVacancies != null) {
      return getMoreVacancies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVacancies value) getVacancies,
    required TResult Function(_GetMoreVacancies value) getMoreVacancies,
  }) {
    return getMoreVacancies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVacancies value)? getVacancies,
    TResult? Function(_GetMoreVacancies value)? getMoreVacancies,
  }) {
    return getMoreVacancies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
    TResult Function(_GetMoreVacancies value)? getMoreVacancies,
    required TResult orElse(),
  }) {
    if (getMoreVacancies != null) {
      return getMoreVacancies(this);
    }
    return orElse();
  }
}

abstract class _GetMoreVacancies implements HospitalVacanciesEvent {
  factory _GetMoreVacancies() = _$_GetMoreVacancies;
}

/// @nodoc
mixin _$HospitalVacanciesState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<VacancyListEntity> get vacancies => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get organizationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalVacanciesStateCopyWith<HospitalVacanciesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVacanciesStateCopyWith<$Res> {
  factory $HospitalVacanciesStateCopyWith(HospitalVacanciesState value,
          $Res Function(HospitalVacanciesState) then) =
      _$HospitalVacanciesStateCopyWithImpl<$Res, HospitalVacanciesState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<VacancyListEntity> vacancies,
      String? next,
      bool fetchMore,
      int organizationId});
}

/// @nodoc
class _$HospitalVacanciesStateCopyWithImpl<$Res,
        $Val extends HospitalVacanciesState>
    implements $HospitalVacanciesStateCopyWith<$Res> {
  _$HospitalVacanciesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? vacancies = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      vacancies: null == vacancies
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as List<VacancyListEntity>,
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
abstract class _$$_HospitalVacanciesStateCopyWith<$Res>
    implements $HospitalVacanciesStateCopyWith<$Res> {
  factory _$$_HospitalVacanciesStateCopyWith(_$_HospitalVacanciesState value,
          $Res Function(_$_HospitalVacanciesState) then) =
      __$$_HospitalVacanciesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<VacancyListEntity> vacancies,
      String? next,
      bool fetchMore,
      int organizationId});
}

/// @nodoc
class __$$_HospitalVacanciesStateCopyWithImpl<$Res>
    extends _$HospitalVacanciesStateCopyWithImpl<$Res,
        _$_HospitalVacanciesState>
    implements _$$_HospitalVacanciesStateCopyWith<$Res> {
  __$$_HospitalVacanciesStateCopyWithImpl(_$_HospitalVacanciesState _value,
      $Res Function(_$_HospitalVacanciesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? vacancies = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? organizationId = null,
  }) {
    return _then(_$_HospitalVacanciesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      vacancies: null == vacancies
          ? _value._vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as List<VacancyListEntity>,
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

class _$_HospitalVacanciesState implements _HospitalVacanciesState {
  _$_HospitalVacanciesState(
      {this.status = FormzStatus.pure,
      final List<VacancyListEntity> vacancies = const [],
      this.next,
      this.fetchMore = false,
      this.organizationId = 0})
      : _vacancies = vacancies;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<VacancyListEntity> _vacancies;
  @override
  @JsonKey()
  List<VacancyListEntity> get vacancies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vacancies);
  }

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
    return 'HospitalVacanciesState(status: $status, vacancies: $vacancies, next: $next, fetchMore: $fetchMore, organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalVacanciesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._vacancies, _vacancies) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_vacancies),
      next,
      fetchMore,
      organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HospitalVacanciesStateCopyWith<_$_HospitalVacanciesState> get copyWith =>
      __$$_HospitalVacanciesStateCopyWithImpl<_$_HospitalVacanciesState>(
          this, _$identity);
}

abstract class _HospitalVacanciesState implements HospitalVacanciesState {
  factory _HospitalVacanciesState(
      {final FormzStatus status,
      final List<VacancyListEntity> vacancies,
      final String? next,
      final bool fetchMore,
      final int organizationId}) = _$_HospitalVacanciesState;

  @override
  FormzStatus get status;
  @override
  List<VacancyListEntity> get vacancies;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  int get organizationId;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalVacanciesStateCopyWith<_$_HospitalVacanciesState> get copyWith =>
      throw _privateConstructorUsedError;
}
