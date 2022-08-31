// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'h_articles_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HArticlesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HArticlesEventCopyWith<$Res> {
  factory $HArticlesEventCopyWith(
          HArticlesEvent value, $Res Function(HArticlesEvent) then) =
      _$HArticlesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HArticlesEventCopyWithImpl<$Res>
    implements $HArticlesEventCopyWith<$Res> {
  _$HArticlesEventCopyWithImpl(this._value, this._then);

  final HArticlesEvent _value;
  // ignore: unused_field
  final $Res Function(HArticlesEvent) _then;
}

/// @nodoc
abstract class _$$_GetArticlesCopyWith<$Res> {
  factory _$$_GetArticlesCopyWith(
          _$_GetArticles value, $Res Function(_$_GetArticles) then) =
      __$$_GetArticlesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetArticlesCopyWithImpl<$Res>
    extends _$HArticlesEventCopyWithImpl<$Res>
    implements _$$_GetArticlesCopyWith<$Res> {
  __$$_GetArticlesCopyWithImpl(
      _$_GetArticles _value, $Res Function(_$_GetArticles) _then)
      : super(_value, (v) => _then(v as _$_GetArticles));

  @override
  _$_GetArticles get _value => super._value as _$_GetArticles;
}

/// @nodoc

class _$_GetArticles implements _GetArticles {
  _$_GetArticles();

  @override
  String toString() {
    return 'HArticlesEvent.getArticles()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetArticles);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getArticles,
  }) {
    return getArticles();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getArticles,
  }) {
    return getArticles?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getArticles,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
  }) {
    return getArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
  }) {
    return getArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles(this);
    }
    return orElse();
  }
}

abstract class _GetArticles implements HArticlesEvent {
  factory _GetArticles() = _$_GetArticles;
}

/// @nodoc
mixin _$HArticlesState {
  List<JournalArticleEntity> get articles => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HArticlesStateCopyWith<HArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HArticlesStateCopyWith<$Res> {
  factory $HArticlesStateCopyWith(
          HArticlesState value, $Res Function(HArticlesState) then) =
      _$HArticlesStateCopyWithImpl<$Res>;
  $Res call(
      {List<JournalArticleEntity> articles,
      FormzStatus status,
      int count,
      String next});
}

/// @nodoc
class _$HArticlesStateCopyWithImpl<$Res>
    implements $HArticlesStateCopyWith<$Res> {
  _$HArticlesStateCopyWithImpl(this._value, this._then);

  final HArticlesState _value;
  // ignore: unused_field
  final $Res Function(HArticlesState) _then;

  @override
  $Res call({
    Object? articles = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<JournalArticleEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HArticlesStateCopyWith<$Res>
    implements $HArticlesStateCopyWith<$Res> {
  factory _$$_HArticlesStateCopyWith(
          _$_HArticlesState value, $Res Function(_$_HArticlesState) then) =
      __$$_HArticlesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<JournalArticleEntity> articles,
      FormzStatus status,
      int count,
      String next});
}

/// @nodoc
class __$$_HArticlesStateCopyWithImpl<$Res>
    extends _$HArticlesStateCopyWithImpl<$Res>
    implements _$$_HArticlesStateCopyWith<$Res> {
  __$$_HArticlesStateCopyWithImpl(
      _$_HArticlesState _value, $Res Function(_$_HArticlesState) _then)
      : super(_value, (v) => _then(v as _$_HArticlesState));

  @override
  _$_HArticlesState get _value => super._value as _$_HArticlesState;

  @override
  $Res call({
    Object? articles = freezed,
    Object? status = freezed,
    Object? count = freezed,
    Object? next = freezed,
  }) {
    return _then(_$_HArticlesState(
      articles: articles == freezed
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<JournalArticleEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HArticlesState implements _HArticlesState {
  _$_HArticlesState(
      {final List<JournalArticleEntity> articles = const [],
      this.status = FormzStatus.pure,
      this.count = 0,
      this.next = ''})
      : _articles = articles;

  final List<JournalArticleEntity> _articles;
  @override
  @JsonKey()
  List<JournalArticleEntity> get articles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final String next;

  @override
  String toString() {
    return 'HArticlesState(articles: $articles, status: $status, count: $count, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HArticlesState &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.next, next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(next));

  @JsonKey(ignore: true)
  @override
  _$$_HArticlesStateCopyWith<_$_HArticlesState> get copyWith =>
      __$$_HArticlesStateCopyWithImpl<_$_HArticlesState>(this, _$identity);
}

abstract class _HArticlesState implements HArticlesState {
  factory _HArticlesState(
      {final List<JournalArticleEntity> articles,
      final FormzStatus status,
      final int count,
      final String next}) = _$_HArticlesState;

  @override
  List<JournalArticleEntity> get articles;
  @override
  FormzStatus get status;
  @override
  int get count;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$$_HArticlesStateCopyWith<_$_HArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}
