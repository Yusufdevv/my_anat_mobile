// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getMoreNews,
    required TResult Function(String slug) getNewSingle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getMoreNews,
    TResult? Function(String slug)? getNewSingle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getMoreNews,
    TResult Function(String slug)? getNewSingle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_GetMoreNews value) getMoreNews,
    required TResult Function(_GetNewSingle value) getNewSingle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_GetMoreNews value)? getMoreNews,
    TResult? Function(_GetNewSingle value)? getNewSingle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_GetMoreNews value)? getMoreNews,
    TResult Function(_GetNewSingle value)? getNewSingle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetNewsCopyWith<$Res> {
  factory _$$_GetNewsCopyWith(
          _$_GetNews value, $Res Function(_$_GetNews) then) =
      __$$_GetNewsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNewsCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$_GetNews>
    implements _$$_GetNewsCopyWith<$Res> {
  __$$_GetNewsCopyWithImpl(_$_GetNews _value, $Res Function(_$_GetNews) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetNews implements _GetNews {
  const _$_GetNews();

  @override
  String toString() {
    return 'NewsEvent.getNews()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getMoreNews,
    required TResult Function(String slug) getNewSingle,
  }) {
    return getNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getMoreNews,
    TResult? Function(String slug)? getNewSingle,
  }) {
    return getNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getMoreNews,
    TResult Function(String slug)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_GetMoreNews value) getMoreNews,
    required TResult Function(_GetNewSingle value) getNewSingle,
  }) {
    return getNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_GetMoreNews value)? getMoreNews,
    TResult? Function(_GetNewSingle value)? getNewSingle,
  }) {
    return getNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_GetMoreNews value)? getMoreNews,
    TResult Function(_GetNewSingle value)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews(this);
    }
    return orElse();
  }
}

abstract class _GetNews implements NewsEvent {
  const factory _GetNews() = _$_GetNews;
}

/// @nodoc
abstract class _$$_GetMoreNewsCopyWith<$Res> {
  factory _$$_GetMoreNewsCopyWith(
          _$_GetMoreNews value, $Res Function(_$_GetMoreNews) then) =
      __$$_GetMoreNewsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreNewsCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$_GetMoreNews>
    implements _$$_GetMoreNewsCopyWith<$Res> {
  __$$_GetMoreNewsCopyWithImpl(
      _$_GetMoreNews _value, $Res Function(_$_GetMoreNews) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreNews implements _GetMoreNews {
  const _$_GetMoreNews();

  @override
  String toString() {
    return 'NewsEvent.getMoreNews()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getMoreNews,
    required TResult Function(String slug) getNewSingle,
  }) {
    return getMoreNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getMoreNews,
    TResult? Function(String slug)? getNewSingle,
  }) {
    return getMoreNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getMoreNews,
    TResult Function(String slug)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getMoreNews != null) {
      return getMoreNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_GetMoreNews value) getMoreNews,
    required TResult Function(_GetNewSingle value) getNewSingle,
  }) {
    return getMoreNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_GetMoreNews value)? getMoreNews,
    TResult? Function(_GetNewSingle value)? getNewSingle,
  }) {
    return getMoreNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_GetMoreNews value)? getMoreNews,
    TResult Function(_GetNewSingle value)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getMoreNews != null) {
      return getMoreNews(this);
    }
    return orElse();
  }
}

abstract class _GetMoreNews implements NewsEvent {
  const factory _GetMoreNews() = _$_GetMoreNews;
}

/// @nodoc
abstract class _$$_GetNewSingleCopyWith<$Res> {
  factory _$$_GetNewSingleCopyWith(
          _$_GetNewSingle value, $Res Function(_$_GetNewSingle) then) =
      __$$_GetNewSingleCopyWithImpl<$Res>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$_GetNewSingleCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$_GetNewSingle>
    implements _$$_GetNewSingleCopyWith<$Res> {
  __$$_GetNewSingleCopyWithImpl(
      _$_GetNewSingle _value, $Res Function(_$_GetNewSingle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$_GetNewSingle(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetNewSingle implements _GetNewSingle {
  const _$_GetNewSingle({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'NewsEvent.getNewSingle(slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetNewSingle &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetNewSingleCopyWith<_$_GetNewSingle> get copyWith =>
      __$$_GetNewSingleCopyWithImpl<_$_GetNewSingle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getMoreNews,
    required TResult Function(String slug) getNewSingle,
  }) {
    return getNewSingle(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getMoreNews,
    TResult? Function(String slug)? getNewSingle,
  }) {
    return getNewSingle?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getMoreNews,
    TResult Function(String slug)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getNewSingle != null) {
      return getNewSingle(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_GetMoreNews value) getMoreNews,
    required TResult Function(_GetNewSingle value) getNewSingle,
  }) {
    return getNewSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_GetMoreNews value)? getMoreNews,
    TResult? Function(_GetNewSingle value)? getNewSingle,
  }) {
    return getNewSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_GetMoreNews value)? getMoreNews,
    TResult Function(_GetNewSingle value)? getNewSingle,
    required TResult orElse(),
  }) {
    if (getNewSingle != null) {
      return getNewSingle(this);
    }
    return orElse();
  }
}

abstract class _GetNewSingle implements NewsEvent {
  const factory _GetNewSingle({required final String slug}) = _$_GetNewSingle;

  String get slug;
  @JsonKey(ignore: true)
  _$$_GetNewSingleCopyWith<_$_GetNewSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
  List<NewsModel> get news => throw _privateConstructorUsedError;
  NewsModel? get newSingle => throw _privateConstructorUsedError;
  FormzStatus get newsStatus => throw _privateConstructorUsedError;
  FormzStatus get newSingleStatus => throw _privateConstructorUsedError;
  String? get newsNext => throw _privateConstructorUsedError;
  bool get newsFetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {List<NewsModel> news,
      NewsModel? newSingle,
      FormzStatus newsStatus,
      FormzStatus newSingleStatus,
      String? newsNext,
      bool newsFetchMore});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? newSingle = freezed,
    Object? newsStatus = null,
    Object? newSingleStatus = null,
    Object? newsNext = freezed,
    Object? newsFetchMore = null,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      newSingle: freezed == newSingle
          ? _value.newSingle
          : newSingle // ignore: cast_nullable_to_non_nullable
              as NewsModel?,
      newsStatus: null == newsStatus
          ? _value.newsStatus
          : newsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      newSingleStatus: null == newSingleStatus
          ? _value.newSingleStatus
          : newSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      newsNext: freezed == newsNext
          ? _value.newsNext
          : newsNext // ignore: cast_nullable_to_non_nullable
              as String?,
      newsFetchMore: null == newsFetchMore
          ? _value.newsFetchMore
          : newsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewsModel> news,
      NewsModel? newSingle,
      FormzStatus newsStatus,
      FormzStatus newSingleStatus,
      String? newsNext,
      bool newsFetchMore});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? newSingle = freezed,
    Object? newsStatus = null,
    Object? newSingleStatus = null,
    Object? newsNext = freezed,
    Object? newsFetchMore = null,
  }) {
    return _then(_$_NewsState(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      newSingle: freezed == newSingle
          ? _value.newSingle
          : newSingle // ignore: cast_nullable_to_non_nullable
              as NewsModel?,
      newsStatus: null == newsStatus
          ? _value.newsStatus
          : newsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      newSingleStatus: null == newSingleStatus
          ? _value.newSingleStatus
          : newSingleStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      newsNext: freezed == newsNext
          ? _value.newsNext
          : newsNext // ignore: cast_nullable_to_non_nullable
              as String?,
      newsFetchMore: null == newsFetchMore
          ? _value.newsFetchMore
          : newsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  _$_NewsState(
      {final List<NewsModel> news = const [],
      this.newSingle,
      this.newsStatus = FormzStatus.pure,
      this.newSingleStatus = FormzStatus.pure,
      this.newsNext,
      this.newsFetchMore = false})
      : _news = news;

  final List<NewsModel> _news;
  @override
  @JsonKey()
  List<NewsModel> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  final NewsModel? newSingle;
  @override
  @JsonKey()
  final FormzStatus newsStatus;
  @override
  @JsonKey()
  final FormzStatus newSingleStatus;
  @override
  final String? newsNext;
  @override
  @JsonKey()
  final bool newsFetchMore;

  @override
  String toString() {
    return 'NewsState(news: $news, newSingle: $newSingle, newsStatus: $newsStatus, newSingleStatus: $newSingleStatus, newsNext: $newsNext, newsFetchMore: $newsFetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.newSingle, newSingle) ||
                other.newSingle == newSingle) &&
            (identical(other.newsStatus, newsStatus) ||
                other.newsStatus == newsStatus) &&
            (identical(other.newSingleStatus, newSingleStatus) ||
                other.newSingleStatus == newSingleStatus) &&
            (identical(other.newsNext, newsNext) ||
                other.newsNext == newsNext) &&
            (identical(other.newsFetchMore, newsFetchMore) ||
                other.newsFetchMore == newsFetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      newSingle,
      newsStatus,
      newSingleStatus,
      newsNext,
      newsFetchMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  factory _NewsState(
      {final List<NewsModel> news,
      final NewsModel? newSingle,
      final FormzStatus newsStatus,
      final FormzStatus newSingleStatus,
      final String? newsNext,
      final bool newsFetchMore}) = _$_NewsState;

  @override
  List<NewsModel> get news;
  @override
  NewsModel? get newSingle;
  @override
  FormzStatus get newsStatus;
  @override
  FormzStatus get newSingleStatus;
  @override
  String? get newsNext;
  @override
  bool get newsFetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
