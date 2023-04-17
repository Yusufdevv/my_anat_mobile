// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(String text)? getSuggestions,
    TResult? Function(int page)? changePage,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_ChangePage value)? changePage,
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
      _$SuggestionEventCopyWithImpl<$Res, SuggestionEvent>;
}

/// @nodoc
class _$SuggestionEventCopyWithImpl<$Res, $Val extends SuggestionEvent>
    implements $SuggestionEventCopyWith<$Res> {
  _$SuggestionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetSuggestionsCopyWith<$Res> {
  factory _$$_GetSuggestionsCopyWith(
          _$_GetSuggestions value, $Res Function(_$_GetSuggestions) then) =
      __$$_GetSuggestionsCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_GetSuggestionsCopyWithImpl<$Res>
    extends _$SuggestionEventCopyWithImpl<$Res, _$_GetSuggestions>
    implements _$$_GetSuggestionsCopyWith<$Res> {
  __$$_GetSuggestionsCopyWithImpl(
      _$_GetSuggestions _value, $Res Function(_$_GetSuggestions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_GetSuggestions(
      null == text
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
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(String text)? getSuggestions,
    TResult? Function(int page)? changePage,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_ChangePage value)? changePage,
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
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_ChangePageCopyWithImpl<$Res>
    extends _$SuggestionEventCopyWithImpl<$Res, _$_ChangePage>
    implements _$$_ChangePageCopyWith<$Res> {
  __$$_ChangePageCopyWithImpl(
      _$_ChangePage _value, $Res Function(_$_ChangePage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_ChangePage(
      null == page
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
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(String text)? getSuggestions,
    TResult? Function(int page)? changePage,
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
    TResult? Function(_GetSuggestions value)? getSuggestions,
    TResult? Function(_ChangePage value)? changePage,
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
      _$SuggestionStateCopyWithImpl<$Res, SuggestionState>;
  @useResult
  $Res call(
      {List<SuggestionModel> list,
      FormzStatus status,
      int currentPage,
      String searchText});
}

/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res, $Val extends SuggestionState>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
    Object? currentPage = null,
    Object? searchText = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SuggestionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestionStateCopyWith<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  factory _$$_SuggestionStateCopyWith(
          _$_SuggestionState value, $Res Function(_$_SuggestionState) then) =
      __$$_SuggestionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SuggestionModel> list,
      FormzStatus status,
      int currentPage,
      String searchText});
}

/// @nodoc
class __$$_SuggestionStateCopyWithImpl<$Res>
    extends _$SuggestionStateCopyWithImpl<$Res, _$_SuggestionState>
    implements _$$_SuggestionStateCopyWith<$Res> {
  __$$_SuggestionStateCopyWithImpl(
      _$_SuggestionState _value, $Res Function(_$_SuggestionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
    Object? currentPage = null,
    Object? searchText = null,
  }) {
    return _then(_$_SuggestionState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SuggestionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      searchText: null == searchText
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
    if (_list is EqualUnmodifiableListView) return _list;
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      status,
      currentPage,
      searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
