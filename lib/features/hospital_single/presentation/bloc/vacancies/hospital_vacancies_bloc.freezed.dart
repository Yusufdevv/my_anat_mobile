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
  int? get organizationId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? organizationId) getVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? organizationId)? getVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? organizationId)? getVacancies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVacancies value) getVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalVacanciesEventCopyWith<HospitalVacanciesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVacanciesEventCopyWith<$Res> {
  factory $HospitalVacanciesEventCopyWith(HospitalVacanciesEvent value,
          $Res Function(HospitalVacanciesEvent) then) =
      _$HospitalVacanciesEventCopyWithImpl<$Res>;
  $Res call({int? organizationId});
}

/// @nodoc
class _$HospitalVacanciesEventCopyWithImpl<$Res>
    implements $HospitalVacanciesEventCopyWith<$Res> {
  _$HospitalVacanciesEventCopyWithImpl(this._value, this._then);

  final HospitalVacanciesEvent _value;
  // ignore: unused_field
  final $Res Function(HospitalVacanciesEvent) _then;

  @override
  $Res call({
    Object? organizationId = freezed,
  }) {
    return _then(_value.copyWith(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetVacanciesCopyWith<$Res>
    implements $HospitalVacanciesEventCopyWith<$Res> {
  factory _$$_GetVacanciesCopyWith(
          _$_GetVacancies value, $Res Function(_$_GetVacancies) then) =
      __$$_GetVacanciesCopyWithImpl<$Res>;
  @override
  $Res call({int? organizationId});
}

/// @nodoc
class __$$_GetVacanciesCopyWithImpl<$Res>
    extends _$HospitalVacanciesEventCopyWithImpl<$Res>
    implements _$$_GetVacanciesCopyWith<$Res> {
  __$$_GetVacanciesCopyWithImpl(
      _$_GetVacancies _value, $Res Function(_$_GetVacancies) _then)
      : super(_value, (v) => _then(v as _$_GetVacancies));

  @override
  _$_GetVacancies get _value => super._value as _$_GetVacancies;

  @override
  $Res call({
    Object? organizationId = freezed,
  }) {
    return _then(_$_GetVacancies(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_GetVacancies implements _GetVacancies {
  _$_GetVacancies({this.organizationId});

  @override
  final int? organizationId;

  @override
  String toString() {
    return 'HospitalVacanciesEvent.getVacancies(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetVacancies &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(organizationId));

  @JsonKey(ignore: true)
  @override
  _$$_GetVacanciesCopyWith<_$_GetVacancies> get copyWith =>
      __$$_GetVacanciesCopyWithImpl<_$_GetVacancies>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? organizationId) getVacancies,
  }) {
    return getVacancies(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? organizationId)? getVacancies,
  }) {
    return getVacancies?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? organizationId)? getVacancies,
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
  }) {
    return getVacancies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
  }) {
    return getVacancies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVacancies value)? getVacancies,
    required TResult orElse(),
  }) {
    if (getVacancies != null) {
      return getVacancies(this);
    }
    return orElse();
  }
}

abstract class _GetVacancies implements HospitalVacanciesEvent {
  factory _GetVacancies({final int? organizationId}) = _$_GetVacancies;

  @override
  int? get organizationId;
  @override
  @JsonKey(ignore: true)
  _$$_GetVacanciesCopyWith<_$_GetVacancies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HospitalVacanciesState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<VacancyListEntity> get vacancies => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalVacanciesStateCopyWith<HospitalVacanciesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVacanciesStateCopyWith<$Res> {
  factory $HospitalVacanciesStateCopyWith(HospitalVacanciesState value,
          $Res Function(HospitalVacanciesState) then) =
      _$HospitalVacanciesStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      List<VacancyListEntity> vacancies,
      String next,
      int count});
}

/// @nodoc
class _$HospitalVacanciesStateCopyWithImpl<$Res>
    implements $HospitalVacanciesStateCopyWith<$Res> {
  _$HospitalVacanciesStateCopyWithImpl(this._value, this._then);

  final HospitalVacanciesState _value;
  // ignore: unused_field
  final $Res Function(HospitalVacanciesState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? vacancies = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      vacancies: vacancies == freezed
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as List<VacancyListEntity>,
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
abstract class _$$_HospitalVacanciesStateCopyWith<$Res>
    implements $HospitalVacanciesStateCopyWith<$Res> {
  factory _$$_HospitalVacanciesStateCopyWith(_$_HospitalVacanciesState value,
          $Res Function(_$_HospitalVacanciesState) then) =
      __$$_HospitalVacanciesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      List<VacancyListEntity> vacancies,
      String next,
      int count});
}

/// @nodoc
class __$$_HospitalVacanciesStateCopyWithImpl<$Res>
    extends _$HospitalVacanciesStateCopyWithImpl<$Res>
    implements _$$_HospitalVacanciesStateCopyWith<$Res> {
  __$$_HospitalVacanciesStateCopyWithImpl(_$_HospitalVacanciesState _value,
      $Res Function(_$_HospitalVacanciesState) _then)
      : super(_value, (v) => _then(v as _$_HospitalVacanciesState));

  @override
  _$_HospitalVacanciesState get _value =>
      super._value as _$_HospitalVacanciesState;

  @override
  $Res call({
    Object? status = freezed,
    Object? vacancies = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_HospitalVacanciesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      vacancies: vacancies == freezed
          ? _value._vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as List<VacancyListEntity>,
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

class _$_HospitalVacanciesState implements _HospitalVacanciesState {
  _$_HospitalVacanciesState(
      {this.status = FormzStatus.pure,
      final List<VacancyListEntity> vacancies = const [],
      this.next = '',
      this.count = 0})
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
  @JsonKey()
  final String next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'HospitalVacanciesState(status: $status, vacancies: $vacancies, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalVacanciesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._vacancies, _vacancies) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_vacancies),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalVacanciesStateCopyWith<_$_HospitalVacanciesState> get copyWith =>
      __$$_HospitalVacanciesStateCopyWithImpl<_$_HospitalVacanciesState>(
          this, _$identity);
}

abstract class _HospitalVacanciesState implements HospitalVacanciesState {
  factory _HospitalVacanciesState(
      {final FormzStatus status,
      final List<VacancyListEntity> vacancies,
      final String next,
      final int count}) = _$_HospitalVacanciesState;

  @override
  FormzStatus get status;
  @override
  List<VacancyListEntity> get vacancies;
  @override
  String get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalVacanciesStateCopyWith<_$_HospitalVacanciesState> get copyWith =>
      throw _privateConstructorUsedError;
}
