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
  String get text => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) getSuggestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestions value) getSuggestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionEventCopyWith<SuggestionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionEventCopyWith<$Res> {
  factory $SuggestionEventCopyWith(
          SuggestionEvent value, $Res Function(SuggestionEvent) then) =
      _$SuggestionEventCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$SuggestionEventCopyWithImpl<$Res>
    implements $SuggestionEventCopyWith<$Res> {
  _$SuggestionEventCopyWithImpl(this._value, this._then);

  final SuggestionEvent _value;
  // ignore: unused_field
  final $Res Function(SuggestionEvent) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GetSuggestionsCopyWith<$Res>
    implements $SuggestionEventCopyWith<$Res> {
  factory _$$_GetSuggestionsCopyWith(
          _$_GetSuggestions value, $Res Function(_$_GetSuggestions) then) =
      __$$_GetSuggestionsCopyWithImpl<$Res>;
  @override
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
  }) {
    return getSuggestions(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
  }) {
    return getSuggestions?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? getSuggestions,
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
  }) {
    return getSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
  }) {
    return getSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestions value)? getSuggestions,
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

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_GetSuggestionsCopyWith<_$_GetSuggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SuggestionState {
  List<SuggestionModel> get list => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionStateCopyWith<SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionStateCopyWith<$Res> {
  factory $SuggestionStateCopyWith(
          SuggestionState value, $Res Function(SuggestionState) then) =
      _$SuggestionStateCopyWithImpl<$Res>;
  $Res call({List<SuggestionModel> list, FormzStatus status});
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
  $Res call({List<SuggestionModel> list, FormzStatus status});
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
    ));
  }
}

/// @nodoc

class _$_SuggestionState implements _SuggestionState {
  _$_SuggestionState(
      {final List<SuggestionModel> list = const [],
      this.status = FormzStatus.pure})
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
  String toString() {
    return 'SuggestionState(list: $list, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      __$$_SuggestionStateCopyWithImpl<_$_SuggestionState>(this, _$identity);
}

abstract class _SuggestionState implements SuggestionState {
  factory _SuggestionState(
      {final List<SuggestionModel> list,
      final FormzStatus status}) = _$_SuggestionState;

  @override
  List<SuggestionModel> get list;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionStateCopyWith<_$_SuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}
