// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'suggestion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) getSuggestions,
    required TResult Function(int page) changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_ChangePage value) changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionEventCopyWith<$Res> {
  factory $SuggestionEventCopyWith(
          SuggestionEvent value, $Res Function(SuggestionEvent) then) =
      _$SuggestionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuggestionEventCopyWithImpl<$Res>
    implements $SuggestionEventCopyWith<$Res> {
  _$SuggestionEventCopyWithImpl(this._value, this._then);

  final SuggestionEvent _value;
  // ignore: unused_field
  final $Res Function(SuggestionEvent) _then;
}

/// @nodoc
abstract class _$$_GetSuggestionsCopyWith<$Res> {
  factory _$$_GetSuggestionsCopyWith(
          _$_GetSuggestions value, $Res Function(_$_GetSuggestions) then) =
      __$$_GetSuggestionsCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_GetSuggestionsCopyWithImpl<$Res>
    extends _$SuggestionEventCopyWithImpl<$Res>
    implements _$$_GetSuggestionsCopyWith<$Res> {
  __$$_GetSuggestionsCopyWithImpl(
      _$_GetSuggestions _value, $Res Function(_$_GetSuggestions) _then)
      : super(_value, (v) => _then(v as _$_GetSuggestions));

  @override
  _$_GetSuggestions get _value => super._value as _$_GetSuggestions;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_GetSuggestions(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetSuggestions implements _GetSuggestions {
  _$_GetSuggestions(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SuggestionEvent.getSuggestions(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSuggestions &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      __$$_GetSuggestionsCopyWithImpl<_$_GetSuggestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) getSuggestions,
    required TResult Function(int page) changePage,
  }) {
    return getSuggestions(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
  }) {
    return getSuggestions?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
    required TResult orElse(),
  }) {
    if (getSuggestions != null) {
      return getSuggestions(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_ChangePage value) changePage,
  }) {
    return getSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
  }) {
    return getSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
    required TResult orElse(),
  }) {
    if (getSuggestions != null) {
      return getSuggestions(this);
    }
    return orElse();
  }
}

abstract class _GetSuggestions implements SuggestionEvent {
  factory _GetSuggestions(final String text) = _$_GetSuggestions;

  String get text;
  @JsonKey(ignore: true)
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangePageCopyWith<$Res> {
  factory _$$_ChangePageCopyWith(
          _$_ChangePage value, $Res Function(_$_ChangePage) then) =
      __$$_ChangePageCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class __$$_ChangePageCopyWithImpl<$Res>
    extends _$SuggestionEventCopyWithImpl<$Res>
    implements _$$_ChangePageCopyWith<$Res> {
  __$$_ChangePageCopyWithImpl(
      _$_ChangePage _value, $Res Function(_$_ChangePage) _then)
      : super(_value, (v) => _then(v as _$_ChangePage));

  @override
  _$_ChangePage get _value => super._value as _$_ChangePage;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$_ChangePage(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangePage implements _ChangePage {
  _$_ChangePage(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'SuggestionEvent.changePage(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePage &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      __$$_ChangePageCopyWithImpl<_$_ChangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) getSuggestions,
    required TResult Function(int page) changePage,
  }) {
    return changePage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
  }) {
    return changePage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    TResult Function(int page)? changePage,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestions value) getSuggestions,
    required TResult Function(_ChangePage value) changePage,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    TResult Function(_ChangePage value)? changePage,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class _ChangePage implements SuggestionEvent {
  factory _ChangePage(final int page) = _$_ChangePage;

  int get page;
  @JsonKey(ignore: true)
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SuggestionState {
  List<SuggestionModel> get list => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionStateCopyWith<SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionStateCopyWith<$Res> {
  factory $SuggestionStateCopyWith(
          SuggestionState value, $Res Function(SuggestionState) then) =
      _$SuggestionStateCopyWithImpl<$Res>;
  $Res call(
      {List<SuggestionModel> list,
      FormzStatus status,
      int currentPage,
      String searchText});
}

/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._value, this._then);

  final SuggestionState _value;
  // ignore: unused_field
  final $Res Function(SuggestionState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? currentPage = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SuggestionModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SuggestionStateCopyWith<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  factory _$$_SuggestionStateCopyWith(
          _$_SuggestionState value, $Res Function(_$_SuggestionState) then) =
      __$$_SuggestionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SuggestionModel> list,
      FormzStatus status,
      int currentPage,
      String searchText});
}

/// @nodoc
class __$$_SuggestionStateCopyWithImpl<$Res>
    extends _$SuggestionStateCopyWithImpl<$Res>
    implements _$$_SuggestionStateCopyWith<$Res> {
  __$$_SuggestionStateCopyWithImpl(
      _$_SuggestionState _value, $Res Function(_$_SuggestionState) _then)
      : super(_value, (v) => _then(v as _$_SuggestionState));

  @override
  _$_SuggestionState get _value => super._value as _$_SuggestionState;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? currentPage = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$_SuggestionState(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SuggestionModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SuggestionState implements _SuggestionState {
  _$_SuggestionState(
      {final List<SuggestionModel> list = const [],
      this.status = FormzStatus.pure,
      this.currentPage = 0,
      this.searchText = ''})
      : _list = list;

  final List<SuggestionModel> _list;
  @override
  @JsonKey()
  List<SuggestionModel> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final String searchText;

  @override
  String toString() {
    return 'SuggestionState(list: $list, status: $status, currentPage: $currentPage, searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(searchText));

  @JsonKey(ignore: true)
  @override
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      __$$_SuggestionStateCopyWithImpl<_$_SuggestionState>(this, _$identity);
}

abstract class _SuggestionState implements SuggestionState {
  factory _SuggestionState(
      {final List<SuggestionModel> list,
      final FormzStatus status,
      final int currentPage,
      final String searchText}) = _$_SuggestionState;

  @override
  List<SuggestionModel> get list;
  @override
  FormzStatus get status;
  @override
  int get currentPage;
  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}
