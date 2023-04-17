// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_map_v2_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrgMapV2Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgMapV2EventCopyWith<$Res> {
  factory $OrgMapV2EventCopyWith(
          OrgMapV2Event value, $Res Function(OrgMapV2Event) then) =
      _$OrgMapV2EventCopyWithImpl<$Res, OrgMapV2Event>;
}

/// @nodoc
class _$OrgMapV2EventCopyWithImpl<$Res, $Val extends OrgMapV2Event>
    implements $OrgMapV2EventCopyWith<$Res> {
  _$OrgMapV2EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SuggestCategoriesCopyWith<$Res> {
  factory _$$_SuggestCategoriesCopyWith(_$_SuggestCategories value,
          $Res Function(_$_SuggestCategories) then) =
      __$$_SuggestCategoriesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class __$$_SuggestCategoriesCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_SuggestCategories>
    implements _$$_SuggestCategoriesCopyWith<$Res> {
  __$$_SuggestCategoriesCopyWithImpl(
      _$_SuggestCategories _value, $Res Function(_$_SuggestCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_SuggestCategories(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SuggestCategories implements _SuggestCategories {
  const _$_SuggestCategories({this.searchText});

  @override
  final String? searchText;

  @override
  String toString() {
    return 'OrgMapV2Event.suggestCategories(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestCategories &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestCategoriesCopyWith<_$_SuggestCategories> get copyWith =>
      __$$_SuggestCategoriesCopyWithImpl<_$_SuggestCategories>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return suggestCategories(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return suggestCategories?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestCategories != null) {
      return suggestCategories(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return suggestCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return suggestCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestCategories != null) {
      return suggestCategories(this);
    }
    return orElse();
  }
}

abstract class _SuggestCategories implements OrgMapV2Event {
  const factory _SuggestCategories({final String? searchText}) =
      _$_SuggestCategories;

  String? get searchText;
  @JsonKey(ignore: true)
  _$$_SuggestCategoriesCopyWith<_$_SuggestCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuggestServicesCopyWith<$Res> {
  factory _$$_SuggestServicesCopyWith(
          _$_SuggestServices value, $Res Function(_$_SuggestServices) then) =
      __$$_SuggestServicesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class __$$_SuggestServicesCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_SuggestServices>
    implements _$$_SuggestServicesCopyWith<$Res> {
  __$$_SuggestServicesCopyWithImpl(
      _$_SuggestServices _value, $Res Function(_$_SuggestServices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_SuggestServices(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SuggestServices implements _SuggestServices {
  const _$_SuggestServices({this.searchText});

  @override
  final String? searchText;

  @override
  String toString() {
    return 'OrgMapV2Event.suggestServices(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestServices &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestServicesCopyWith<_$_SuggestServices> get copyWith =>
      __$$_SuggestServicesCopyWithImpl<_$_SuggestServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return suggestServices(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return suggestServices?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestServices != null) {
      return suggestServices(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return suggestServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return suggestServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestServices != null) {
      return suggestServices(this);
    }
    return orElse();
  }
}

abstract class _SuggestServices implements OrgMapV2Event {
  const factory _SuggestServices({final String? searchText}) =
      _$_SuggestServices;

  String? get searchText;
  @JsonKey(ignore: true)
  _$$_SuggestServicesCopyWith<_$_SuggestServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuggestOrgCopyWith<$Res> {
  factory _$$_SuggestOrgCopyWith(
          _$_SuggestOrg value, $Res Function(_$_SuggestOrg) then) =
      __$$_SuggestOrgCopyWithImpl<$Res>;
  @useResult
  $Res call({MapV2Params params});
}

/// @nodoc
class __$$_SuggestOrgCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_SuggestOrg>
    implements _$$_SuggestOrgCopyWith<$Res> {
  __$$_SuggestOrgCopyWithImpl(
      _$_SuggestOrg _value, $Res Function(_$_SuggestOrg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$_SuggestOrg(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MapV2Params,
    ));
  }
}

/// @nodoc

class _$_SuggestOrg implements _SuggestOrg {
  const _$_SuggestOrg({required this.params});

  @override
  final MapV2Params params;

  @override
  String toString() {
    return 'OrgMapV2Event.suggestOrg(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestOrg &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestOrgCopyWith<_$_SuggestOrg> get copyWith =>
      __$$_SuggestOrgCopyWithImpl<_$_SuggestOrg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return suggestOrg(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return suggestOrg?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestOrg != null) {
      return suggestOrg(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return suggestOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return suggestOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (suggestOrg != null) {
      return suggestOrg(this);
    }
    return orElse();
  }
}

abstract class _SuggestOrg implements OrgMapV2Event {
  const factory _SuggestOrg({required final MapV2Params params}) =
      _$_SuggestOrg;

  MapV2Params get params;
  @JsonKey(ignore: true)
  _$$_SuggestOrgCopyWith<_$_SuggestOrg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAllCategoriesCopyWith<$Res> {
  factory _$$_GetAllCategoriesCopyWith(
          _$_GetAllCategories value, $Res Function(_$_GetAllCategories) then) =
      __$$_GetAllCategoriesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class __$$_GetAllCategoriesCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_GetAllCategories>
    implements _$$_GetAllCategoriesCopyWith<$Res> {
  __$$_GetAllCategoriesCopyWithImpl(
      _$_GetAllCategories _value, $Res Function(_$_GetAllCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_GetAllCategories(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetAllCategories implements _GetAllCategories {
  const _$_GetAllCategories({this.searchText});

  @override
  final String? searchText;

  @override
  String toString() {
    return 'OrgMapV2Event.getAllCategories(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAllCategories &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAllCategoriesCopyWith<_$_GetAllCategories> get copyWith =>
      __$$_GetAllCategoriesCopyWithImpl<_$_GetAllCategories>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return getAllCategories(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return getAllCategories?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (getAllCategories != null) {
      return getAllCategories(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return getAllCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return getAllCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (getAllCategories != null) {
      return getAllCategories(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategories implements OrgMapV2Event {
  const factory _GetAllCategories({final String? searchText}) =
      _$_GetAllCategories;

  String? get searchText;
  @JsonKey(ignore: true)
  _$$_GetAllCategoriesCopyWith<_$_GetAllCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAllServicesCopyWith<$Res> {
  factory _$$_GetAllServicesCopyWith(
          _$_GetAllServices value, $Res Function(_$_GetAllServices) then) =
      __$$_GetAllServicesCopyWithImpl<$Res>;
  @useResult
  $Res call({String? searchText});
}

/// @nodoc
class __$$_GetAllServicesCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_GetAllServices>
    implements _$$_GetAllServicesCopyWith<$Res> {
  __$$_GetAllServicesCopyWithImpl(
      _$_GetAllServices _value, $Res Function(_$_GetAllServices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_GetAllServices(
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetAllServices implements _GetAllServices {
  const _$_GetAllServices({this.searchText});

  @override
  final String? searchText;

  @override
  String toString() {
    return 'OrgMapV2Event.getAllServices(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAllServices &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAllServicesCopyWith<_$_GetAllServices> get copyWith =>
      __$$_GetAllServicesCopyWithImpl<_$_GetAllServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return getAllServices(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return getAllServices?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (getAllServices != null) {
      return getAllServices(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return getAllServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return getAllServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (getAllServices != null) {
      return getAllServices(this);
    }
    return orElse();
  }
}

abstract class _GetAllServices implements OrgMapV2Event {
  const factory _GetAllServices({final String? searchText}) = _$_GetAllServices;

  String? get searchText;
  @JsonKey(ignore: true)
  _$$_GetAllServicesCopyWith<_$_GetAllServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeTabCopyWith<$Res> {
  factory _$$_ChangeTabCopyWith(
          _$_ChangeTab value, $Res Function(_$_ChangeTab) then) =
      __$$_ChangeTabCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeTabCopyWithImpl<$Res>
    extends _$OrgMapV2EventCopyWithImpl<$Res, _$_ChangeTab>
    implements _$$_ChangeTabCopyWith<$Res> {
  __$$_ChangeTabCopyWithImpl(
      _$_ChangeTab _value, $Res Function(_$_ChangeTab) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeTab(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeTab implements _ChangeTab {
  const _$_ChangeTab({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'OrgMapV2Event.changeTab(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTab &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTabCopyWith<_$_ChangeTab> get copyWith =>
      __$$_ChangeTabCopyWithImpl<_$_ChangeTab>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? searchText) suggestCategories,
    required TResult Function(String? searchText) suggestServices,
    required TResult Function(MapV2Params params) suggestOrg,
    required TResult Function(String? searchText) getAllCategories,
    required TResult Function(String? searchText) getAllServices,
    required TResult Function(int index) changeTab,
  }) {
    return changeTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? searchText)? suggestCategories,
    TResult? Function(String? searchText)? suggestServices,
    TResult? Function(MapV2Params params)? suggestOrg,
    TResult? Function(String? searchText)? getAllCategories,
    TResult? Function(String? searchText)? getAllServices,
    TResult? Function(int index)? changeTab,
  }) {
    return changeTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? searchText)? suggestCategories,
    TResult Function(String? searchText)? suggestServices,
    TResult Function(MapV2Params params)? suggestOrg,
    TResult Function(String? searchText)? getAllCategories,
    TResult Function(String? searchText)? getAllServices,
    TResult Function(int index)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuggestCategories value) suggestCategories,
    required TResult Function(_SuggestServices value) suggestServices,
    required TResult Function(_SuggestOrg value) suggestOrg,
    required TResult Function(_GetAllCategories value) getAllCategories,
    required TResult Function(_GetAllServices value) getAllServices,
    required TResult Function(_ChangeTab value) changeTab,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuggestCategories value)? suggestCategories,
    TResult? Function(_SuggestServices value)? suggestServices,
    TResult? Function(_SuggestOrg value)? suggestOrg,
    TResult? Function(_GetAllCategories value)? getAllCategories,
    TResult? Function(_GetAllServices value)? getAllServices,
    TResult? Function(_ChangeTab value)? changeTab,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuggestCategories value)? suggestCategories,
    TResult Function(_SuggestServices value)? suggestServices,
    TResult Function(_SuggestOrg value)? suggestOrg,
    TResult Function(_GetAllCategories value)? getAllCategories,
    TResult Function(_GetAllServices value)? getAllServices,
    TResult Function(_ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeTab implements OrgMapV2Event {
  const factory _ChangeTab({required final int index}) = _$_ChangeTab;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeTabCopyWith<_$_ChangeTab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrgMapV2State {
  List<OrgMapV2Model> get hospitals => throw _privateConstructorUsedError;
  List<TypeModel> get types => throw _privateConstructorUsedError;
  List<ServiceSpecSuggestModel> get services =>
      throw _privateConstructorUsedError;
  dynamic get getAllHospitalsStatus => throw _privateConstructorUsedError;
  dynamic get getSuggestHospitalsStatus => throw _privateConstructorUsedError;
  dynamic get serviceStatus => throw _privateConstructorUsedError;
  dynamic get categoryStatus => throw _privateConstructorUsedError;
  dynamic get hospitalsCount => throw _privateConstructorUsedError;
  dynamic get typesCount => throw _privateConstructorUsedError;
  dynamic get servicesCount => throw _privateConstructorUsedError;
  String? get hospitalsPrevious => throw _privateConstructorUsedError;
  String? get typesPrevious => throw _privateConstructorUsedError;
  String? get servicesPrevious => throw _privateConstructorUsedError;
  String? get hospitalsNext => throw _privateConstructorUsedError;
  String? get typesNext => throw _privateConstructorUsedError;
  String? get servicesNext => throw _privateConstructorUsedError;
  bool get hospitalsFetchMore => throw _privateConstructorUsedError;
  bool get typesFetchMore => throw _privateConstructorUsedError;
  bool get servicesFetchMore => throw _privateConstructorUsedError;
  dynamic get tabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrgMapV2StateCopyWith<OrgMapV2State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgMapV2StateCopyWith<$Res> {
  factory $OrgMapV2StateCopyWith(
          OrgMapV2State value, $Res Function(OrgMapV2State) then) =
      _$OrgMapV2StateCopyWithImpl<$Res, OrgMapV2State>;
  @useResult
  $Res call(
      {List<OrgMapV2Model> hospitals,
      List<TypeModel> types,
      List<ServiceSpecSuggestModel> services,
      dynamic getAllHospitalsStatus,
      dynamic getSuggestHospitalsStatus,
      dynamic serviceStatus,
      dynamic categoryStatus,
      dynamic hospitalsCount,
      dynamic typesCount,
      dynamic servicesCount,
      String? hospitalsPrevious,
      String? typesPrevious,
      String? servicesPrevious,
      String? hospitalsNext,
      String? typesNext,
      String? servicesNext,
      bool hospitalsFetchMore,
      bool typesFetchMore,
      bool servicesFetchMore,
      dynamic tabIndex});
}

/// @nodoc
class _$OrgMapV2StateCopyWithImpl<$Res, $Val extends OrgMapV2State>
    implements $OrgMapV2StateCopyWith<$Res> {
  _$OrgMapV2StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? types = null,
    Object? services = null,
    Object? getAllHospitalsStatus = freezed,
    Object? getSuggestHospitalsStatus = freezed,
    Object? serviceStatus = freezed,
    Object? categoryStatus = freezed,
    Object? hospitalsCount = freezed,
    Object? typesCount = freezed,
    Object? servicesCount = freezed,
    Object? hospitalsPrevious = freezed,
    Object? typesPrevious = freezed,
    Object? servicesPrevious = freezed,
    Object? hospitalsNext = freezed,
    Object? typesNext = freezed,
    Object? servicesNext = freezed,
    Object? hospitalsFetchMore = null,
    Object? typesFetchMore = null,
    Object? servicesFetchMore = null,
    Object? tabIndex = freezed,
  }) {
    return _then(_value.copyWith(
      hospitals: null == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<OrgMapV2Model>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceSpecSuggestModel>,
      getAllHospitalsStatus: freezed == getAllHospitalsStatus
          ? _value.getAllHospitalsStatus
          : getAllHospitalsStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      getSuggestHospitalsStatus: freezed == getSuggestHospitalsStatus
          ? _value.getSuggestHospitalsStatus
          : getSuggestHospitalsStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceStatus: freezed == serviceStatus
          ? _value.serviceStatus
          : serviceStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryStatus: freezed == categoryStatus
          ? _value.categoryStatus
          : categoryStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hospitalsCount: freezed == hospitalsCount
          ? _value.hospitalsCount
          : hospitalsCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typesCount: freezed == typesCount
          ? _value.typesCount
          : typesCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      servicesCount: freezed == servicesCount
          ? _value.servicesCount
          : servicesCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hospitalsPrevious: freezed == hospitalsPrevious
          ? _value.hospitalsPrevious
          : hospitalsPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      typesPrevious: freezed == typesPrevious
          ? _value.typesPrevious
          : typesPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      servicesPrevious: freezed == servicesPrevious
          ? _value.servicesPrevious
          : servicesPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalsNext: freezed == hospitalsNext
          ? _value.hospitalsNext
          : hospitalsNext // ignore: cast_nullable_to_non_nullable
              as String?,
      typesNext: freezed == typesNext
          ? _value.typesNext
          : typesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      servicesNext: freezed == servicesNext
          ? _value.servicesNext
          : servicesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalsFetchMore: null == hospitalsFetchMore
          ? _value.hospitalsFetchMore
          : hospitalsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      typesFetchMore: null == typesFetchMore
          ? _value.typesFetchMore
          : typesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      servicesFetchMore: null == servicesFetchMore
          ? _value.servicesFetchMore
          : servicesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      tabIndex: freezed == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrgMapV2StateCopyWith<$Res>
    implements $OrgMapV2StateCopyWith<$Res> {
  factory _$$_OrgMapV2StateCopyWith(
          _$_OrgMapV2State value, $Res Function(_$_OrgMapV2State) then) =
      __$$_OrgMapV2StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrgMapV2Model> hospitals,
      List<TypeModel> types,
      List<ServiceSpecSuggestModel> services,
      dynamic getAllHospitalsStatus,
      dynamic getSuggestHospitalsStatus,
      dynamic serviceStatus,
      dynamic categoryStatus,
      dynamic hospitalsCount,
      dynamic typesCount,
      dynamic servicesCount,
      String? hospitalsPrevious,
      String? typesPrevious,
      String? servicesPrevious,
      String? hospitalsNext,
      String? typesNext,
      String? servicesNext,
      bool hospitalsFetchMore,
      bool typesFetchMore,
      bool servicesFetchMore,
      dynamic tabIndex});
}

/// @nodoc
class __$$_OrgMapV2StateCopyWithImpl<$Res>
    extends _$OrgMapV2StateCopyWithImpl<$Res, _$_OrgMapV2State>
    implements _$$_OrgMapV2StateCopyWith<$Res> {
  __$$_OrgMapV2StateCopyWithImpl(
      _$_OrgMapV2State _value, $Res Function(_$_OrgMapV2State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? types = null,
    Object? services = null,
    Object? getAllHospitalsStatus = freezed,
    Object? getSuggestHospitalsStatus = freezed,
    Object? serviceStatus = freezed,
    Object? categoryStatus = freezed,
    Object? hospitalsCount = freezed,
    Object? typesCount = freezed,
    Object? servicesCount = freezed,
    Object? hospitalsPrevious = freezed,
    Object? typesPrevious = freezed,
    Object? servicesPrevious = freezed,
    Object? hospitalsNext = freezed,
    Object? typesNext = freezed,
    Object? servicesNext = freezed,
    Object? hospitalsFetchMore = null,
    Object? typesFetchMore = null,
    Object? servicesFetchMore = null,
    Object? tabIndex = freezed,
  }) {
    return _then(_$_OrgMapV2State(
      hospitals: null == hospitals
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<OrgMapV2Model>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceSpecSuggestModel>,
      getAllHospitalsStatus: freezed == getAllHospitalsStatus
          ? _value.getAllHospitalsStatus!
          : getAllHospitalsStatus,
      getSuggestHospitalsStatus: freezed == getSuggestHospitalsStatus
          ? _value.getSuggestHospitalsStatus!
          : getSuggestHospitalsStatus,
      serviceStatus:
          freezed == serviceStatus ? _value.serviceStatus! : serviceStatus,
      categoryStatus:
          freezed == categoryStatus ? _value.categoryStatus! : categoryStatus,
      hospitalsCount:
          freezed == hospitalsCount ? _value.hospitalsCount! : hospitalsCount,
      typesCount: freezed == typesCount ? _value.typesCount! : typesCount,
      servicesCount:
          freezed == servicesCount ? _value.servicesCount! : servicesCount,
      hospitalsPrevious: freezed == hospitalsPrevious
          ? _value.hospitalsPrevious
          : hospitalsPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      typesPrevious: freezed == typesPrevious
          ? _value.typesPrevious
          : typesPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      servicesPrevious: freezed == servicesPrevious
          ? _value.servicesPrevious
          : servicesPrevious // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalsNext: freezed == hospitalsNext
          ? _value.hospitalsNext
          : hospitalsNext // ignore: cast_nullable_to_non_nullable
              as String?,
      typesNext: freezed == typesNext
          ? _value.typesNext
          : typesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      servicesNext: freezed == servicesNext
          ? _value.servicesNext
          : servicesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalsFetchMore: null == hospitalsFetchMore
          ? _value.hospitalsFetchMore
          : hospitalsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      typesFetchMore: null == typesFetchMore
          ? _value.typesFetchMore
          : typesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      servicesFetchMore: null == servicesFetchMore
          ? _value.servicesFetchMore
          : servicesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      tabIndex: freezed == tabIndex ? _value.tabIndex! : tabIndex,
    ));
  }
}

/// @nodoc

class _$_OrgMapV2State implements _OrgMapV2State {
  _$_OrgMapV2State(
      {final List<OrgMapV2Model> hospitals = const [],
      final List<TypeModel> types = const [],
      final List<ServiceSpecSuggestModel> services = const [],
      this.getAllHospitalsStatus = FormzStatus.pure,
      this.getSuggestHospitalsStatus = FormzStatus.pure,
      this.serviceStatus = FormzStatus.pure,
      this.categoryStatus = FormzStatus.pure,
      this.hospitalsCount = 0,
      this.typesCount = 0,
      this.servicesCount = 0,
      this.hospitalsPrevious,
      this.typesPrevious,
      this.servicesPrevious,
      this.hospitalsNext,
      this.typesNext,
      this.servicesNext,
      this.hospitalsFetchMore = false,
      this.typesFetchMore = false,
      this.servicesFetchMore = false,
      this.tabIndex = 0})
      : _hospitals = hospitals,
        _types = types,
        _services = services;

  final List<OrgMapV2Model> _hospitals;
  @override
  @JsonKey()
  List<OrgMapV2Model> get hospitals {
    if (_hospitals is EqualUnmodifiableListView) return _hospitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  final List<TypeModel> _types;
  @override
  @JsonKey()
  List<TypeModel> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<ServiceSpecSuggestModel> _services;
  @override
  @JsonKey()
  List<ServiceSpecSuggestModel> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  @JsonKey()
  final dynamic getAllHospitalsStatus;
  @override
  @JsonKey()
  final dynamic getSuggestHospitalsStatus;
  @override
  @JsonKey()
  final dynamic serviceStatus;
  @override
  @JsonKey()
  final dynamic categoryStatus;
  @override
  @JsonKey()
  final dynamic hospitalsCount;
  @override
  @JsonKey()
  final dynamic typesCount;
  @override
  @JsonKey()
  final dynamic servicesCount;
  @override
  final String? hospitalsPrevious;
  @override
  final String? typesPrevious;
  @override
  final String? servicesPrevious;
  @override
  final String? hospitalsNext;
  @override
  final String? typesNext;
  @override
  final String? servicesNext;
  @override
  @JsonKey()
  final bool hospitalsFetchMore;
  @override
  @JsonKey()
  final bool typesFetchMore;
  @override
  @JsonKey()
  final bool servicesFetchMore;
  @override
  @JsonKey()
  final dynamic tabIndex;

  @override
  String toString() {
    return 'OrgMapV2State(hospitals: $hospitals, types: $types, services: $services, getAllHospitalsStatus: $getAllHospitalsStatus, getSuggestHospitalsStatus: $getSuggestHospitalsStatus, serviceStatus: $serviceStatus, categoryStatus: $categoryStatus, hospitalsCount: $hospitalsCount, typesCount: $typesCount, servicesCount: $servicesCount, hospitalsPrevious: $hospitalsPrevious, typesPrevious: $typesPrevious, servicesPrevious: $servicesPrevious, hospitalsNext: $hospitalsNext, typesNext: $typesNext, servicesNext: $servicesNext, hospitalsFetchMore: $hospitalsFetchMore, typesFetchMore: $typesFetchMore, servicesFetchMore: $servicesFetchMore, tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrgMapV2State &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other.getAllHospitalsStatus, getAllHospitalsStatus) &&
            const DeepCollectionEquality().equals(
                other.getSuggestHospitalsStatus, getSuggestHospitalsStatus) &&
            const DeepCollectionEquality()
                .equals(other.serviceStatus, serviceStatus) &&
            const DeepCollectionEquality()
                .equals(other.categoryStatus, categoryStatus) &&
            const DeepCollectionEquality()
                .equals(other.hospitalsCount, hospitalsCount) &&
            const DeepCollectionEquality()
                .equals(other.typesCount, typesCount) &&
            const DeepCollectionEquality()
                .equals(other.servicesCount, servicesCount) &&
            (identical(other.hospitalsPrevious, hospitalsPrevious) ||
                other.hospitalsPrevious == hospitalsPrevious) &&
            (identical(other.typesPrevious, typesPrevious) ||
                other.typesPrevious == typesPrevious) &&
            (identical(other.servicesPrevious, servicesPrevious) ||
                other.servicesPrevious == servicesPrevious) &&
            (identical(other.hospitalsNext, hospitalsNext) ||
                other.hospitalsNext == hospitalsNext) &&
            (identical(other.typesNext, typesNext) ||
                other.typesNext == typesNext) &&
            (identical(other.servicesNext, servicesNext) ||
                other.servicesNext == servicesNext) &&
            (identical(other.hospitalsFetchMore, hospitalsFetchMore) ||
                other.hospitalsFetchMore == hospitalsFetchMore) &&
            (identical(other.typesFetchMore, typesFetchMore) ||
                other.typesFetchMore == typesFetchMore) &&
            (identical(other.servicesFetchMore, servicesFetchMore) ||
                other.servicesFetchMore == servicesFetchMore) &&
            const DeepCollectionEquality().equals(other.tabIndex, tabIndex));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_hospitals),
        const DeepCollectionEquality().hash(_types),
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(getAllHospitalsStatus),
        const DeepCollectionEquality().hash(getSuggestHospitalsStatus),
        const DeepCollectionEquality().hash(serviceStatus),
        const DeepCollectionEquality().hash(categoryStatus),
        const DeepCollectionEquality().hash(hospitalsCount),
        const DeepCollectionEquality().hash(typesCount),
        const DeepCollectionEquality().hash(servicesCount),
        hospitalsPrevious,
        typesPrevious,
        servicesPrevious,
        hospitalsNext,
        typesNext,
        servicesNext,
        hospitalsFetchMore,
        typesFetchMore,
        servicesFetchMore,
        const DeepCollectionEquality().hash(tabIndex)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrgMapV2StateCopyWith<_$_OrgMapV2State> get copyWith =>
      __$$_OrgMapV2StateCopyWithImpl<_$_OrgMapV2State>(this, _$identity);
}

abstract class _OrgMapV2State implements OrgMapV2State {
  factory _OrgMapV2State(
      {final List<OrgMapV2Model> hospitals,
      final List<TypeModel> types,
      final List<ServiceSpecSuggestModel> services,
      final dynamic getAllHospitalsStatus,
      final dynamic getSuggestHospitalsStatus,
      final dynamic serviceStatus,
      final dynamic categoryStatus,
      final dynamic hospitalsCount,
      final dynamic typesCount,
      final dynamic servicesCount,
      final String? hospitalsPrevious,
      final String? typesPrevious,
      final String? servicesPrevious,
      final String? hospitalsNext,
      final String? typesNext,
      final String? servicesNext,
      final bool hospitalsFetchMore,
      final bool typesFetchMore,
      final bool servicesFetchMore,
      final dynamic tabIndex}) = _$_OrgMapV2State;

  @override
  List<OrgMapV2Model> get hospitals;
  @override
  List<TypeModel> get types;
  @override
  List<ServiceSpecSuggestModel> get services;
  @override
  dynamic get getAllHospitalsStatus;
  @override
  dynamic get getSuggestHospitalsStatus;
  @override
  dynamic get serviceStatus;
  @override
  dynamic get categoryStatus;
  @override
  dynamic get hospitalsCount;
  @override
  dynamic get typesCount;
  @override
  dynamic get servicesCount;
  @override
  String? get hospitalsPrevious;
  @override
  String? get typesPrevious;
  @override
  String? get servicesPrevious;
  @override
  String? get hospitalsNext;
  @override
  String? get typesNext;
  @override
  String? get servicesNext;
  @override
  bool get hospitalsFetchMore;
  @override
  bool get typesFetchMore;
  @override
  bool get servicesFetchMore;
  @override
  dynamic get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$_OrgMapV2StateCopyWith<_$_OrgMapV2State> get copyWith =>
      throw _privateConstructorUsedError;
}
