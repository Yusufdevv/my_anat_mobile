// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_single_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleSingleEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getSingleArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String slug)? getSingleArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getSingleArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingleArticle value) getSingleArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSingleArticle value)? getSingleArticle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingleArticle value)? getSingleArticle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleSingleEventCopyWith<ArticleSingleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleSingleEventCopyWith<$Res> {
  factory $ArticleSingleEventCopyWith(
          ArticleSingleEvent value, $Res Function(ArticleSingleEvent) then) =
      _$ArticleSingleEventCopyWithImpl<$Res>;
  $Res call({String slug});
}

/// @nodoc
class _$ArticleSingleEventCopyWithImpl<$Res>
    implements $ArticleSingleEventCopyWith<$Res> {
  _$ArticleSingleEventCopyWithImpl(this._value, this._then);

  final ArticleSingleEvent _value;
  // ignore: unused_field
  final $Res Function(ArticleSingleEvent) _then;

  @override
  $Res call({
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GetSingleArticleCopyWith<$Res>
    implements $ArticleSingleEventCopyWith<$Res> {
  factory _$$_GetSingleArticleCopyWith(
          _$_GetSingleArticle value, $Res Function(_$_GetSingleArticle) then) =
      __$$_GetSingleArticleCopyWithImpl<$Res>;
  @override
  $Res call({String slug});
}

/// @nodoc
class __$$_GetSingleArticleCopyWithImpl<$Res>
    extends _$ArticleSingleEventCopyWithImpl<$Res>
    implements _$$_GetSingleArticleCopyWith<$Res> {
  __$$_GetSingleArticleCopyWithImpl(
      _$_GetSingleArticle _value, $Res Function(_$_GetSingleArticle) _then)
      : super(_value, (v) => _then(v as _$_GetSingleArticle));

  @override
  _$_GetSingleArticle get _value => super._value as _$_GetSingleArticle;

  @override
  $Res call({
    Object? slug = freezed,
  }) {
    return _then(_$_GetSingleArticle(
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetSingleArticle implements _GetSingleArticle {
  _$_GetSingleArticle({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'ArticleSingleEvent.getSingleArticle(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSingleArticle &&
            const DeepCollectionEquality().equals(other.slug, slug));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(slug));

  @JsonKey(ignore: true)
  @override
  _$$_GetSingleArticleCopyWith<_$_GetSingleArticle> get copyWith =>
      __$$_GetSingleArticleCopyWithImpl<_$_GetSingleArticle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) getSingleArticle,
  }) {
    return getSingleArticle(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String slug)? getSingleArticle,
  }) {
    return getSingleArticle?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? getSingleArticle,
    required TResult orElse(),
  }) {
    if (getSingleArticle != null) {
      return getSingleArticle(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSingleArticle value) getSingleArticle,
  }) {
    return getSingleArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSingleArticle value)? getSingleArticle,
  }) {
    return getSingleArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSingleArticle value)? getSingleArticle,
    required TResult orElse(),
  }) {
    if (getSingleArticle != null) {
      return getSingleArticle(this);
    }
    return orElse();
  }
}

abstract class _GetSingleArticle implements ArticleSingleEvent {
  factory _GetSingleArticle({required final String slug}) = _$_GetSingleArticle;

  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$_GetSingleArticleCopyWith<_$_GetSingleArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticleSingleState {
  JournalArticleSingleEntity get articleSingle =>
      throw _privateConstructorUsedError;
  FormzStatus get getSingleStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleSingleStateCopyWith<ArticleSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleSingleStateCopyWith<$Res> {
  factory $ArticleSingleStateCopyWith(
          ArticleSingleState value, $Res Function(ArticleSingleState) then) =
      _$ArticleSingleStateCopyWithImpl<$Res>;
  $Res call(
      {JournalArticleSingleEntity articleSingle, FormzStatus getSingleStatus});
}

/// @nodoc
class _$ArticleSingleStateCopyWithImpl<$Res>
    implements $ArticleSingleStateCopyWith<$Res> {
  _$ArticleSingleStateCopyWithImpl(this._value, this._then);

  final ArticleSingleState _value;
  // ignore: unused_field
  final $Res Function(ArticleSingleState) _then;

  @override
  $Res call({
    Object? articleSingle = freezed,
    Object? getSingleStatus = freezed,
  }) {
    return _then(_value.copyWith(
      articleSingle: articleSingle == freezed
          ? _value.articleSingle
          : articleSingle // ignore: cast_nullable_to_non_nullable
              as JournalArticleSingleEntity,
      getSingleStatus: getSingleStatus == freezed
          ? _value.getSingleStatus
          : getSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_ArticleSingleStateCopyWith<$Res>
    implements $ArticleSingleStateCopyWith<$Res> {
  factory _$$_ArticleSingleStateCopyWith(_$_ArticleSingleState value,
          $Res Function(_$_ArticleSingleState) then) =
      __$$_ArticleSingleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {JournalArticleSingleEntity articleSingle, FormzStatus getSingleStatus});
}

/// @nodoc
class __$$_ArticleSingleStateCopyWithImpl<$Res>
    extends _$ArticleSingleStateCopyWithImpl<$Res>
    implements _$$_ArticleSingleStateCopyWith<$Res> {
  __$$_ArticleSingleStateCopyWithImpl(
      _$_ArticleSingleState _value, $Res Function(_$_ArticleSingleState) _then)
      : super(_value, (v) => _then(v as _$_ArticleSingleState));

  @override
  _$_ArticleSingleState get _value => super._value as _$_ArticleSingleState;

  @override
  $Res call({
    Object? articleSingle = freezed,
    Object? getSingleStatus = freezed,
  }) {
    return _then(_$_ArticleSingleState(
      articleSingle: articleSingle == freezed
          ? _value.articleSingle
          : articleSingle // ignore: cast_nullable_to_non_nullable
              as JournalArticleSingleEntity,
      getSingleStatus: getSingleStatus == freezed
          ? _value.getSingleStatus
          : getSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_ArticleSingleState implements _ArticleSingleState {
  _$_ArticleSingleState(
      {this.articleSingle = const JournalArticleSingleEntity(),
      this.getSingleStatus = FormzStatus.pure});

  @override
  @JsonKey()
  final JournalArticleSingleEntity articleSingle;
  @override
  @JsonKey()
  final FormzStatus getSingleStatus;

  @override
  String toString() {
    return 'ArticleSingleState(articleSingle: $articleSingle, getSingleStatus: $getSingleStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleSingleState &&
            const DeepCollectionEquality()
                .equals(other.articleSingle, articleSingle) &&
            const DeepCollectionEquality()
                .equals(other.getSingleStatus, getSingleStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articleSingle),
      const DeepCollectionEquality().hash(getSingleStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ArticleSingleStateCopyWith<_$_ArticleSingleState> get copyWith =>
      __$$_ArticleSingleStateCopyWithImpl<_$_ArticleSingleState>(
          this, _$identity);
}

abstract class _ArticleSingleState implements ArticleSingleState {
  factory _ArticleSingleState(
      {final JournalArticleSingleEntity articleSingle,
      final FormzStatus getSingleStatus}) = _$_ArticleSingleState;

  @override
  JournalArticleSingleEntity get articleSingle;
  @override
  FormzStatus get getSingleStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleSingleStateCopyWith<_$_ArticleSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}
