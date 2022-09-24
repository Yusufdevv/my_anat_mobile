// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchased_journal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasedJournalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getArticle,
    required TResult Function() getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetJournal value) getArticle,
    required TResult Function(_GetMoreJournal value) getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedJournalEventCopyWith<$Res> {
  factory $PurchasedJournalEventCopyWith(PurchasedJournalEvent value,
          $Res Function(PurchasedJournalEvent) then) =
      _$PurchasedJournalEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PurchasedJournalEventCopyWithImpl<$Res>
    implements $PurchasedJournalEventCopyWith<$Res> {
  _$PurchasedJournalEventCopyWithImpl(this._value, this._then);

  final PurchasedJournalEvent _value;
  // ignore: unused_field
  final $Res Function(PurchasedJournalEvent) _then;
}

/// @nodoc
abstract class _$$_GetJournalCopyWith<$Res> {
  factory _$$_GetJournalCopyWith(
          _$_GetJournal value, $Res Function(_$_GetJournal) then) =
      __$$_GetJournalCopyWithImpl<$Res>;
  $Res call({bool isRefresh});
}

/// @nodoc
class __$$_GetJournalCopyWithImpl<$Res>
    extends _$PurchasedJournalEventCopyWithImpl<$Res>
    implements _$$_GetJournalCopyWith<$Res> {
  __$$_GetJournalCopyWithImpl(
      _$_GetJournal _value, $Res Function(_$_GetJournal) _then)
      : super(_value, (v) => _then(v as _$_GetJournal));

  @override
  _$_GetJournal get _value => super._value as _$_GetJournal;

  @override
  $Res call({
    Object? isRefresh = freezed,
  }) {
    return _then(_$_GetJournal(
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetJournal implements _GetJournal {
  _$_GetJournal({required this.isRefresh});

  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'PurchasedJournalEvent.getArticle(isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetJournal &&
            const DeepCollectionEquality().equals(other.isRefresh, isRefresh));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isRefresh));

  @JsonKey(ignore: true)
  @override
  _$$_GetJournalCopyWith<_$_GetJournal> get copyWith =>
      __$$_GetJournalCopyWithImpl<_$_GetJournal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getArticle,
    required TResult Function() getMoreArticle,
  }) {
    return getArticle(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
  }) {
    return getArticle?.call(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getArticle != null) {
      return getArticle(isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetJournal value) getArticle,
    required TResult Function(_GetMoreJournal value) getMoreArticle,
  }) {
    return getArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
  }) {
    return getArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getArticle != null) {
      return getArticle(this);
    }
    return orElse();
  }
}

abstract class _GetJournal implements PurchasedJournalEvent {
  factory _GetJournal({required final bool isRefresh}) = _$_GetJournal;

  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$_GetJournalCopyWith<_$_GetJournal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreJournalCopyWith<$Res> {
  factory _$$_GetMoreJournalCopyWith(
          _$_GetMoreJournal value, $Res Function(_$_GetMoreJournal) then) =
      __$$_GetMoreJournalCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreJournalCopyWithImpl<$Res>
    extends _$PurchasedJournalEventCopyWithImpl<$Res>
    implements _$$_GetMoreJournalCopyWith<$Res> {
  __$$_GetMoreJournalCopyWithImpl(
      _$_GetMoreJournal _value, $Res Function(_$_GetMoreJournal) _then)
      : super(_value, (v) => _then(v as _$_GetMoreJournal));

  @override
  _$_GetMoreJournal get _value => super._value as _$_GetMoreJournal;
}

/// @nodoc

class _$_GetMoreJournal implements _GetMoreJournal {
  _$_GetMoreJournal();

  @override
  String toString() {
    return 'PurchasedJournalEvent.getMoreArticle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreJournal);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getArticle,
    required TResult Function() getMoreArticle,
  }) {
    return getMoreArticle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
  }) {
    return getMoreArticle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getArticle,
    TResult Function()? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getMoreArticle != null) {
      return getMoreArticle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetJournal value) getArticle,
    required TResult Function(_GetMoreJournal value) getMoreArticle,
  }) {
    return getMoreArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
  }) {
    return getMoreArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetJournal value)? getArticle,
    TResult Function(_GetMoreJournal value)? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getMoreArticle != null) {
      return getMoreArticle(this);
    }
    return orElse();
  }
}

abstract class _GetMoreJournal implements PurchasedJournalEvent {
  factory _GetMoreJournal() = _$_GetMoreJournal;
}

/// @nodoc
mixin _$PurchasedJournalState {
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  List<PurchasedJournalModel> get journals =>
      throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasedJournalStateCopyWith<PurchasedJournalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedJournalStateCopyWith<$Res> {
  factory $PurchasedJournalStateCopyWith(PurchasedJournalState value,
          $Res Function(PurchasedJournalState) then) =
      _$PurchasedJournalStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<PurchasedJournalModel> journals,
      int count,
      String? next});
}

/// @nodoc
class _$PurchasedJournalStateCopyWithImpl<$Res>
    implements $PurchasedJournalStateCopyWith<$Res> {
  _$PurchasedJournalStateCopyWithImpl(this._value, this._then);

  final PurchasedJournalState _value;
  // ignore: unused_field
  final $Res Function(PurchasedJournalState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? journals = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      journals: journals == freezed
          ? _value.journals
          : journals // ignore: cast_nullable_to_non_nullable
              as List<PurchasedJournalModel>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PurchasedJournalStateCopyWith<$Res>
    implements $PurchasedJournalStateCopyWith<$Res> {
  factory _$$_PurchasedJournalStateCopyWith(_$_PurchasedJournalState value,
          $Res Function(_$_PurchasedJournalState) then) =
      __$$_PurchasedJournalStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<PurchasedJournalModel> journals,
      int count,
      String? next});
}

/// @nodoc
class __$$_PurchasedJournalStateCopyWithImpl<$Res>
    extends _$PurchasedJournalStateCopyWithImpl<$Res>
    implements _$$_PurchasedJournalStateCopyWith<$Res> {
  __$$_PurchasedJournalStateCopyWithImpl(_$_PurchasedJournalState _value,
      $Res Function(_$_PurchasedJournalState) _then)
      : super(_value, (v) => _then(v as _$_PurchasedJournalState));

  @override
  _$_PurchasedJournalState get _value =>
      super._value as _$_PurchasedJournalState;

  @override
  $Res call({
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? journals = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_$_PurchasedJournalState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      journals: journals == freezed
          ? _value._journals
          : journals // ignore: cast_nullable_to_non_nullable
              as List<PurchasedJournalModel>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PurchasedJournalState implements _PurchasedJournalState {
  _$_PurchasedJournalState(
      {this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      final List<PurchasedJournalModel> journals = const [],
      this.count = 0,
      this.next})
      : _journals = journals;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  final List<PurchasedJournalModel> _journals;
  @override
  @JsonKey()
  List<PurchasedJournalModel> get journals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_journals);
  }

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;

  @override
  String toString() {
    return 'PurchasedJournalState(status: $status, paginationStatus: $paginationStatus, journals: $journals, count: $count, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedJournalState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paginationStatus, paginationStatus) &&
            const DeepCollectionEquality().equals(other._journals, _journals) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.next, next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paginationStatus),
      const DeepCollectionEquality().hash(_journals),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(next));

  @JsonKey(ignore: true)
  @override
  _$$_PurchasedJournalStateCopyWith<_$_PurchasedJournalState> get copyWith =>
      __$$_PurchasedJournalStateCopyWithImpl<_$_PurchasedJournalState>(
          this, _$identity);
}

abstract class _PurchasedJournalState implements PurchasedJournalState {
  factory _PurchasedJournalState(
      {final FormzStatus status,
      final FormzStatus paginationStatus,
      final List<PurchasedJournalModel> journals,
      final int count,
      final String? next}) = _$_PurchasedJournalState;

  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  List<PurchasedJournalModel> get journals;
  @override
  int get count;
  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasedJournalStateCopyWith<_$_PurchasedJournalState> get copyWith =>
      throw _privateConstructorUsedError;
}
