// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hospital_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HospitalListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CrossFadeState crossFadeState) changePage,
    required TResult Function(String search) getHospitals,
    required TResult Function() getMoreHospitals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetMoreHospitals value) getMoreHospitals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalListEventCopyWith<$Res> {
  factory $HospitalListEventCopyWith(
          HospitalListEvent value, $Res Function(HospitalListEvent) then) =
      _$HospitalListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HospitalListEventCopyWithImpl<$Res>
    implements $HospitalListEventCopyWith<$Res> {
  _$HospitalListEventCopyWithImpl(this._value, this._then);

  final HospitalListEvent _value;
  // ignore: unused_field
  final $Res Function(HospitalListEvent) _then;
}

/// @nodoc
abstract class _$$_ChangePageCopyWith<$Res> {
  factory _$$_ChangePageCopyWith(
          _$_ChangePage value, $Res Function(_$_ChangePage) then) =
      __$$_ChangePageCopyWithImpl<$Res>;
  $Res call({CrossFadeState crossFadeState});
}

/// @nodoc
class __$$_ChangePageCopyWithImpl<$Res>
    extends _$HospitalListEventCopyWithImpl<$Res>
    implements _$$_ChangePageCopyWith<$Res> {
  __$$_ChangePageCopyWithImpl(
      _$_ChangePage _value, $Res Function(_$_ChangePage) _then)
      : super(_value, (v) => _then(v as _$_ChangePage));

  @override
  _$_ChangePage get _value => super._value as _$_ChangePage;

  @override
  $Res call({
    Object? crossFadeState = freezed,
  }) {
    return _then(_$_ChangePage(
      crossFadeState == freezed
          ? _value.crossFadeState
          : crossFadeState // ignore: cast_nullable_to_non_nullable
              as CrossFadeState,
    ));
  }
}

/// @nodoc

class _$_ChangePage implements _ChangePage {
  _$_ChangePage(this.crossFadeState);

  @override
  final CrossFadeState crossFadeState;

  @override
  String toString() {
    return 'HospitalListEvent.changePage(crossFadeState: $crossFadeState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePage &&
            const DeepCollectionEquality()
                .equals(other.crossFadeState, crossFadeState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(crossFadeState));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      __$$_ChangePageCopyWithImpl<_$_ChangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CrossFadeState crossFadeState) changePage,
    required TResult Function(String search) getHospitals,
    required TResult Function() getMoreHospitals,
  }) {
    return changePage(crossFadeState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
  }) {
    return changePage?.call(crossFadeState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(crossFadeState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetMoreHospitals value) getMoreHospitals,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class _ChangePage implements HospitalListEvent {
  factory _ChangePage(final CrossFadeState crossFadeState) = _$_ChangePage;

  CrossFadeState get crossFadeState;
  @JsonKey(ignore: true)
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetHospitalsCopyWith<$Res> {
  factory _$$_GetHospitalsCopyWith(
          _$_GetHospitals value, $Res Function(_$_GetHospitals) then) =
      __$$_GetHospitalsCopyWithImpl<$Res>;
  $Res call({String search});
}

/// @nodoc
class __$$_GetHospitalsCopyWithImpl<$Res>
    extends _$HospitalListEventCopyWithImpl<$Res>
    implements _$$_GetHospitalsCopyWith<$Res> {
  __$$_GetHospitalsCopyWithImpl(
      _$_GetHospitals _value, $Res Function(_$_GetHospitals) _then)
      : super(_value, (v) => _then(v as _$_GetHospitals));

  @override
  _$_GetHospitals get _value => super._value as _$_GetHospitals;

  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$_GetHospitals(
      search: search == freezed
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetHospitals implements _GetHospitals {
  _$_GetHospitals({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'HospitalListEvent.getHospitals(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetHospitals &&
            const DeepCollectionEquality().equals(other.search, search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(search));

  @JsonKey(ignore: true)
  @override
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      __$$_GetHospitalsCopyWithImpl<_$_GetHospitals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CrossFadeState crossFadeState) changePage,
    required TResult Function(String search) getHospitals,
    required TResult Function() getMoreHospitals,
  }) {
    return getHospitals(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
  }) {
    return getHospitals?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetMoreHospitals value) getMoreHospitals,
  }) {
    return getHospitals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
  }) {
    return getHospitals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(this);
    }
    return orElse();
  }
}

abstract class _GetHospitals implements HospitalListEvent {
  factory _GetHospitals({required final String search}) = _$_GetHospitals;

  String get search;
  @JsonKey(ignore: true)
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreHospitalsCopyWith<$Res> {
  factory _$$_GetMoreHospitalsCopyWith(
          _$_GetMoreHospitals value, $Res Function(_$_GetMoreHospitals) then) =
      __$$_GetMoreHospitalsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreHospitalsCopyWithImpl<$Res>
    extends _$HospitalListEventCopyWithImpl<$Res>
    implements _$$_GetMoreHospitalsCopyWith<$Res> {
  __$$_GetMoreHospitalsCopyWithImpl(
      _$_GetMoreHospitals _value, $Res Function(_$_GetMoreHospitals) _then)
      : super(_value, (v) => _then(v as _$_GetMoreHospitals));

  @override
  _$_GetMoreHospitals get _value => super._value as _$_GetMoreHospitals;
}

/// @nodoc

class _$_GetMoreHospitals implements _GetMoreHospitals {
  _$_GetMoreHospitals();

  @override
  String toString() {
    return 'HospitalListEvent.getMoreHospitals()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreHospitals);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CrossFadeState crossFadeState) changePage,
    required TResult Function(String search) getHospitals,
    required TResult Function() getMoreHospitals,
  }) {
    return getMoreHospitals();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
  }) {
    return getMoreHospitals?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CrossFadeState crossFadeState)? changePage,
    TResult Function(String search)? getHospitals,
    TResult Function()? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (getMoreHospitals != null) {
      return getMoreHospitals();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetMoreHospitals value) getMoreHospitals,
  }) {
    return getMoreHospitals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
  }) {
    return getMoreHospitals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetMoreHospitals value)? getMoreHospitals,
    required TResult orElse(),
  }) {
    if (getMoreHospitals != null) {
      return getMoreHospitals(this);
    }
    return orElse();
  }
}

abstract class _GetMoreHospitals implements HospitalListEvent {
  factory _GetMoreHospitals() = _$_GetMoreHospitals;
}

/// @nodoc
mixin _$HospitalListState {
  CrossFadeState get crossFadeState => throw _privateConstructorUsedError;
  List<HospitalEntity> get hospitals => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HospitalListStateCopyWith<HospitalListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalListStateCopyWith<$Res> {
  factory $HospitalListStateCopyWith(
          HospitalListState value, $Res Function(HospitalListState) then) =
      _$HospitalListStateCopyWithImpl<$Res>;
  $Res call(
      {CrossFadeState crossFadeState,
      List<HospitalEntity> hospitals,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class _$HospitalListStateCopyWithImpl<$Res>
    implements $HospitalListStateCopyWith<$Res> {
  _$HospitalListStateCopyWithImpl(this._value, this._then);

  final HospitalListState _value;
  // ignore: unused_field
  final $Res Function(HospitalListState) _then;

  @override
  $Res call({
    Object? crossFadeState = freezed,
    Object? hospitals = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_value.copyWith(
      crossFadeState: crossFadeState == freezed
          ? _value.crossFadeState
          : crossFadeState // ignore: cast_nullable_to_non_nullable
              as CrossFadeState,
      hospitals: hospitals == freezed
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<HospitalEntity>,
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
abstract class _$$_HospitalListStateCopyWith<$Res>
    implements $HospitalListStateCopyWith<$Res> {
  factory _$$_HospitalListStateCopyWith(_$_HospitalListState value,
          $Res Function(_$_HospitalListState) then) =
      __$$_HospitalListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CrossFadeState crossFadeState,
      List<HospitalEntity> hospitals,
      FormzStatus status,
      String? next,
      bool fetchMore});
}

/// @nodoc
class __$$_HospitalListStateCopyWithImpl<$Res>
    extends _$HospitalListStateCopyWithImpl<$Res>
    implements _$$_HospitalListStateCopyWith<$Res> {
  __$$_HospitalListStateCopyWithImpl(
      _$_HospitalListState _value, $Res Function(_$_HospitalListState) _then)
      : super(_value, (v) => _then(v as _$_HospitalListState));

  @override
  _$_HospitalListState get _value => super._value as _$_HospitalListState;

  @override
  $Res call({
    Object? crossFadeState = freezed,
    Object? hospitals = freezed,
    Object? status = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_$_HospitalListState(
      crossFadeState: crossFadeState == freezed
          ? _value.crossFadeState
          : crossFadeState // ignore: cast_nullable_to_non_nullable
              as CrossFadeState,
      hospitals: hospitals == freezed
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<HospitalEntity>,
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

class _$_HospitalListState implements _HospitalListState {
  _$_HospitalListState(
      {this.crossFadeState = CrossFadeState.showFirst,
      final List<HospitalEntity> hospitals = const [],
      this.status = FormzStatus.pure,
      this.next,
      this.fetchMore = false})
      : _hospitals = hospitals;

  @override
  @JsonKey()
  final CrossFadeState crossFadeState;
  final List<HospitalEntity> _hospitals;
  @override
  @JsonKey()
  List<HospitalEntity> get hospitals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
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
    return 'HospitalListState(crossFadeState: $crossFadeState, hospitals: $hospitals, status: $status, next: $next, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalListState &&
            const DeepCollectionEquality()
                .equals(other.crossFadeState, crossFadeState) &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(crossFadeState),
      const DeepCollectionEquality().hash(_hospitals),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalListStateCopyWith<_$_HospitalListState> get copyWith =>
      __$$_HospitalListStateCopyWithImpl<_$_HospitalListState>(
          this, _$identity);
}

abstract class _HospitalListState implements HospitalListState {
  factory _HospitalListState(
      {final CrossFadeState crossFadeState,
      final List<HospitalEntity> hospitals,
      final FormzStatus status,
      final String? next,
      final bool fetchMore}) = _$_HospitalListState;

  @override
  CrossFadeState get crossFadeState;
  @override
  List<HospitalEntity> get hospitals;
  @override
  FormzStatus get status;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalListStateCopyWith<_$_HospitalListState> get copyWith =>
      throw _privateConstructorUsedError;
}
