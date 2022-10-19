// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchased_article_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasedArticleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getArticle,
    required TResult Function() getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getArticle,
    TResult? Function()? getMoreArticle,
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
    required TResult Function(_GetArticle value) getArticle,
    required TResult Function(_GetMoreArticle value) getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticle value)? getArticle,
    TResult? Function(_GetMoreArticle value)? getMoreArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticle value)? getArticle,
    TResult Function(_GetMoreArticle value)? getMoreArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedArticleEventCopyWith<$Res> {
  factory $PurchasedArticleEventCopyWith(PurchasedArticleEvent value,
          $Res Function(PurchasedArticleEvent) then) =
      _$PurchasedArticleEventCopyWithImpl<$Res, PurchasedArticleEvent>;
}

/// @nodoc
class _$PurchasedArticleEventCopyWithImpl<$Res,
        $Val extends PurchasedArticleEvent>
    implements $PurchasedArticleEventCopyWith<$Res> {
  _$PurchasedArticleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetArticleCopyWith<$Res> {
  factory _$$_GetArticleCopyWith(
          _$_GetArticle value, $Res Function(_$_GetArticle) then) =
      __$$_GetArticleCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRefresh});
}

/// @nodoc
class __$$_GetArticleCopyWithImpl<$Res>
    extends _$PurchasedArticleEventCopyWithImpl<$Res, _$_GetArticle>
    implements _$$_GetArticleCopyWith<$Res> {
  __$$_GetArticleCopyWithImpl(
      _$_GetArticle _value, $Res Function(_$_GetArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRefresh = null,
  }) {
    return _then(_$_GetArticle(
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetArticle implements _GetArticle {
  _$_GetArticle({required this.isRefresh});

  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'PurchasedArticleEvent.getArticle(isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetArticle &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetArticleCopyWith<_$_GetArticle> get copyWith =>
      __$$_GetArticleCopyWithImpl<_$_GetArticle>(this, _$identity);

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
    TResult? Function(bool isRefresh)? getArticle,
    TResult? Function()? getMoreArticle,
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
    required TResult Function(_GetArticle value) getArticle,
    required TResult Function(_GetMoreArticle value) getMoreArticle,
  }) {
    return getArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticle value)? getArticle,
    TResult? Function(_GetMoreArticle value)? getMoreArticle,
  }) {
    return getArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticle value)? getArticle,
    TResult Function(_GetMoreArticle value)? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getArticle != null) {
      return getArticle(this);
    }
    return orElse();
  }
}

abstract class _GetArticle implements PurchasedArticleEvent {
  factory _GetArticle({required final bool isRefresh}) = _$_GetArticle;

  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$_GetArticleCopyWith<_$_GetArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreArticleCopyWith<$Res> {
  factory _$$_GetMoreArticleCopyWith(
          _$_GetMoreArticle value, $Res Function(_$_GetMoreArticle) then) =
      __$$_GetMoreArticleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreArticleCopyWithImpl<$Res>
    extends _$PurchasedArticleEventCopyWithImpl<$Res, _$_GetMoreArticle>
    implements _$$_GetMoreArticleCopyWith<$Res> {
  __$$_GetMoreArticleCopyWithImpl(
      _$_GetMoreArticle _value, $Res Function(_$_GetMoreArticle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreArticle implements _GetMoreArticle {
  _$_GetMoreArticle();

  @override
  String toString() {
    return 'PurchasedArticleEvent.getMoreArticle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreArticle);
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
    TResult? Function(bool isRefresh)? getArticle,
    TResult? Function()? getMoreArticle,
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
    required TResult Function(_GetArticle value) getArticle,
    required TResult Function(_GetMoreArticle value) getMoreArticle,
  }) {
    return getMoreArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticle value)? getArticle,
    TResult? Function(_GetMoreArticle value)? getMoreArticle,
  }) {
    return getMoreArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticle value)? getArticle,
    TResult Function(_GetMoreArticle value)? getMoreArticle,
    required TResult orElse(),
  }) {
    if (getMoreArticle != null) {
      return getMoreArticle(this);
    }
    return orElse();
  }
}

abstract class _GetMoreArticle implements PurchasedArticleEvent {
  factory _GetMoreArticle() = _$_GetMoreArticle;
}

/// @nodoc
mixin _$PurchasedArticleState {
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  List<PurchasedArticleModel> get articles =>
      throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasedArticleStateCopyWith<PurchasedArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedArticleStateCopyWith<$Res> {
  factory $PurchasedArticleStateCopyWith(PurchasedArticleState value,
          $Res Function(PurchasedArticleState) then) =
      _$PurchasedArticleStateCopyWithImpl<$Res, PurchasedArticleState>;
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<PurchasedArticleModel> articles,
      int count,
      String? next});
}

/// @nodoc
class _$PurchasedArticleStateCopyWithImpl<$Res,
        $Val extends PurchasedArticleState>
    implements $PurchasedArticleStateCopyWith<$Res> {
  _$PurchasedArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? articles = null,
    Object? count = null,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<PurchasedArticleModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasedArticleStateCopyWith<$Res>
    implements $PurchasedArticleStateCopyWith<$Res> {
  factory _$$_PurchasedArticleStateCopyWith(_$_PurchasedArticleState value,
          $Res Function(_$_PurchasedArticleState) then) =
      __$$_PurchasedArticleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<PurchasedArticleModel> articles,
      int count,
      String? next});
}

/// @nodoc
class __$$_PurchasedArticleStateCopyWithImpl<$Res>
    extends _$PurchasedArticleStateCopyWithImpl<$Res, _$_PurchasedArticleState>
    implements _$$_PurchasedArticleStateCopyWith<$Res> {
  __$$_PurchasedArticleStateCopyWithImpl(_$_PurchasedArticleState _value,
      $Res Function(_$_PurchasedArticleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? articles = null,
    Object? count = null,
    Object? next = freezed,
  }) {
    return _then(_$_PurchasedArticleState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<PurchasedArticleModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PurchasedArticleState implements _PurchasedArticleState {
  _$_PurchasedArticleState(
      {this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      final List<PurchasedArticleModel> articles = const [],
      this.count = 0,
      this.next})
      : _articles = articles;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  final List<PurchasedArticleModel> _articles;
  @override
  @JsonKey()
  List<PurchasedArticleModel> get articles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;

  @override
  String toString() {
    return 'PurchasedArticleState(status: $status, paginationStatus: $paginationStatus, articles: $articles, count: $count, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedArticleState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, paginationStatus,
      const DeepCollectionEquality().hash(_articles), count, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasedArticleStateCopyWith<_$_PurchasedArticleState> get copyWith =>
      __$$_PurchasedArticleStateCopyWithImpl<_$_PurchasedArticleState>(
          this, _$identity);
}

abstract class _PurchasedArticleState implements PurchasedArticleState {
  factory _PurchasedArticleState(
      {final FormzStatus status,
      final FormzStatus paginationStatus,
      final List<PurchasedArticleModel> articles,
      final int count,
      final String? next}) = _$_PurchasedArticleState;

  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  List<PurchasedArticleModel> get articles;
  @override
  int get count;
  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasedArticleStateCopyWith<_$_PurchasedArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}
