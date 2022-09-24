// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapOrganizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationEventCopyWith<$Res> {
  factory $MapOrganizationEventCopyWith(MapOrganizationEvent value,
          $Res Function(MapOrganizationEvent) then) =
      _$MapOrganizationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MapOrganizationEventCopyWithImpl<$Res>
    implements $MapOrganizationEventCopyWith<$Res> {
  _$MapOrganizationEventCopyWithImpl(this._value, this._then);

  final MapOrganizationEvent _value;
  // ignore: unused_field
  final $Res Function(MapOrganizationEvent) _then;
}

/// @nodoc
abstract class _$$_GetHospitalsCopyWith<$Res> {
  factory _$$_GetHospitalsCopyWith(
          _$_GetHospitals value, $Res Function(_$_GetHospitals) then) =
      __$$_GetHospitalsCopyWithImpl<$Res>;
  $Res call({MapParameter param});
}

/// @nodoc
class __$$_GetHospitalsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetHospitalsCopyWith<$Res> {
  __$$_GetHospitalsCopyWithImpl(
      _$_GetHospitals _value, $Res Function(_$_GetHospitals) _then)
      : super(_value, (v) => _then(v as _$_GetHospitals));

  @override
  _$_GetHospitals get _value => super._value as _$_GetHospitals;

  @override
  $Res call({
    Object? param = freezed,
  }) {
    return _then(_$_GetHospitals(
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as MapParameter,
    ));
  }
}

/// @nodoc

class _$_GetHospitals implements _GetHospitals {
  _$_GetHospitals({required this.param});

  @override
  final MapParameter param;

  @override
  String toString() {
    return 'MapOrganizationEvent.getHospitals(param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetHospitals &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      __$$_GetHospitalsCopyWithImpl<_$_GetHospitals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) {
    return getHospitals(param);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) {
    return getHospitals?.call(param);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(param);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) {
    return getHospitals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) {
    return getHospitals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(this);
    }
    return orElse();
  }
}

abstract class _GetHospitals implements MapOrganizationEvent {
  factory _GetHospitals({required final MapParameter param}) = _$_GetHospitals;

  MapParameter get param;
  @JsonKey(ignore: true)
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDoctorsCopyWith<$Res> {
  factory _$$_GetDoctorsCopyWith(
          _$_GetDoctors value, $Res Function(_$_GetDoctors) then) =
      __$$_GetDoctorsCopyWithImpl<$Res>;
  $Res call({MapParameter param});
}

/// @nodoc
class __$$_GetDoctorsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetDoctorsCopyWith<$Res> {
  __$$_GetDoctorsCopyWithImpl(
      _$_GetDoctors _value, $Res Function(_$_GetDoctors) _then)
      : super(_value, (v) => _then(v as _$_GetDoctors));

  @override
  _$_GetDoctors get _value => super._value as _$_GetDoctors;

  @override
  $Res call({
    Object? param = freezed,
  }) {
    return _then(_$_GetDoctors(
      param: param == freezed
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as MapParameter,
    ));
  }
}

/// @nodoc

class _$_GetDoctors implements _GetDoctors {
  _$_GetDoctors({required this.param});

  @override
  final MapParameter param;

  @override
  String toString() {
    return 'MapOrganizationEvent.getDoctors(param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctors &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      __$$_GetDoctorsCopyWithImpl<_$_GetDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) {
    return getDoctors(param);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) {
    return getDoctors?.call(param);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(param);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements MapOrganizationEvent {
  factory _GetDoctors({required final MapParameter param}) = _$_GetDoctors;

  MapParameter get param;
  @JsonKey(ignore: true)
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetTypesCopyWith<$Res> {
  factory _$$_GetTypesCopyWith(
          _$_GetTypes value, $Res Function(_$_GetTypes) then) =
      __$$_GetTypesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTypesCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetTypesCopyWith<$Res> {
  __$$_GetTypesCopyWithImpl(
      _$_GetTypes _value, $Res Function(_$_GetTypes) _then)
      : super(_value, (v) => _then(v as _$_GetTypes));

  @override
  _$_GetTypes get _value => super._value as _$_GetTypes;
}

/// @nodoc

class _$_GetTypes implements _GetTypes {
  _$_GetTypes();

  @override
  String toString() {
    return 'MapOrganizationEvent.getTypes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTypes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) {
    return getTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) {
    return getTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getTypes != null) {
      return getTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) {
    return getTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) {
    return getTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getTypes != null) {
      return getTypes(this);
    }
    return orElse();
  }
}

abstract class _GetTypes implements MapOrganizationEvent {
  factory _GetTypes() = _$_GetTypes;
}

/// @nodoc
abstract class _$$_GetMoreTypesCopyWith<$Res> {
  factory _$$_GetMoreTypesCopyWith(
          _$_GetMoreTypes value, $Res Function(_$_GetMoreTypes) then) =
      __$$_GetMoreTypesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreTypesCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_GetMoreTypesCopyWith<$Res> {
  __$$_GetMoreTypesCopyWithImpl(
      _$_GetMoreTypes _value, $Res Function(_$_GetMoreTypes) _then)
      : super(_value, (v) => _then(v as _$_GetMoreTypes));

  @override
  _$_GetMoreTypes get _value => super._value as _$_GetMoreTypes;
}

/// @nodoc

class _$_GetMoreTypes implements _GetMoreTypes {
  _$_GetMoreTypes();

  @override
  String toString() {
    return 'MapOrganizationEvent.getMoreTypes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreTypes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) {
    return getMoreTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) {
    return getMoreTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getMoreTypes != null) {
      return getMoreTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) {
    return getMoreTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) {
    return getMoreTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) {
    if (getMoreTypes != null) {
      return getMoreTypes(this);
    }
    return orElse();
  }
}

abstract class _GetMoreTypes implements MapOrganizationEvent {
  factory _GetMoreTypes() = _$_GetMoreTypes;
}

/// @nodoc
abstract class _$$_ChangeSearchTextCopyWith<$Res> {
  factory _$$_ChangeSearchTextCopyWith(
          _$_ChangeSearchText value, $Res Function(_$_ChangeSearchText) then) =
      __$$_ChangeSearchTextCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeSearchTextCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res>
    implements _$$_ChangeSearchTextCopyWith<$Res> {
  __$$_ChangeSearchTextCopyWithImpl(
      _$_ChangeSearchText _value, $Res Function(_$_ChangeSearchText) _then)
      : super(_value, (v) => _then(v as _$_ChangeSearchText));

  @override
  _$_ChangeSearchText get _value => super._value as _$_ChangeSearchText;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangeSearchText(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeSearchText implements _ChangeSearchText {
  _$_ChangeSearchText(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeSearchText(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSearchText &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_ChangeSearchTextCopyWith<_$_ChangeSearchText> get copyWith =>
      __$$_ChangeSearchTextCopyWithImpl<_$_ChangeSearchText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapParameter param) getHospitals,
    required TResult Function(MapParameter param) getDoctors,
    required TResult Function() getTypes,
    required TResult Function() getMoreTypes,
    required TResult Function(String text) changeSearchText,
  }) {
    return changeSearchText(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
  }) {
    return changeSearchText?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapParameter param)? getHospitals,
    TResult Function(MapParameter param)? getDoctors,
    TResult Function()? getTypes,
    TResult Function()? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    required TResult orElse(),
  }) {
    if (changeSearchText != null) {
      return changeSearchText(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
  }) {
    return changeSearchText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
  }) {
    return changeSearchText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    required TResult orElse(),
  }) {
    if (changeSearchText != null) {
      return changeSearchText(this);
    }
    return orElse();
  }
}

abstract class _ChangeSearchText implements MapOrganizationEvent {
  factory _ChangeSearchText(final String text) = _$_ChangeSearchText;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangeSearchTextCopyWith<_$_ChangeSearchText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapOrganizationState {
  List<MapHospitalModel> get hospitals => throw _privateConstructorUsedError;
  List<MapDoctorModel> get doctors => throw _privateConstructorUsedError;
  List<TypeEntity> get types => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get getTypesStatus => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapOrganizationStateCopyWith<MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationStateCopyWith<$Res> {
  factory $MapOrganizationStateCopyWith(MapOrganizationState value,
          $Res Function(MapOrganizationState) then) =
      _$MapOrganizationStateCopyWithImpl<$Res>;
  $Res call(
      {List<MapHospitalModel> hospitals,
      List<MapDoctorModel> doctors,
      List<TypeEntity> types,
      FormzStatus status,
      FormzStatus getTypesStatus,
      String searchText,
      String? next,
      bool fetchMore});
}

/// @nodoc
class _$MapOrganizationStateCopyWithImpl<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  _$MapOrganizationStateCopyWithImpl(this._value, this._then);

  final MapOrganizationState _value;
  // ignore: unused_field
  final $Res Function(MapOrganizationState) _then;

  @override
  $Res call({
    Object? hospitals = freezed,
    Object? doctors = freezed,
    Object? types = freezed,
    Object? status = freezed,
    Object? getTypesStatus = freezed,
    Object? searchText = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_value.copyWith(
      hospitals: hospitals == freezed
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<MapHospitalModel>,
      doctors: doctors == freezed
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MapDoctorModel>,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getTypesStatus: getTypesStatus == freezed
          ? _value.getTypesStatus
          : getTypesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_MapOrganizationStateCopyWith<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  factory _$$_MapOrganizationStateCopyWith(_$_MapOrganizationState value,
          $Res Function(_$_MapOrganizationState) then) =
      __$$_MapOrganizationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MapHospitalModel> hospitals,
      List<MapDoctorModel> doctors,
      List<TypeEntity> types,
      FormzStatus status,
      FormzStatus getTypesStatus,
      String searchText,
      String? next,
      bool fetchMore});
}

/// @nodoc
class __$$_MapOrganizationStateCopyWithImpl<$Res>
    extends _$MapOrganizationStateCopyWithImpl<$Res>
    implements _$$_MapOrganizationStateCopyWith<$Res> {
  __$$_MapOrganizationStateCopyWithImpl(_$_MapOrganizationState _value,
      $Res Function(_$_MapOrganizationState) _then)
      : super(_value, (v) => _then(v as _$_MapOrganizationState));

  @override
  _$_MapOrganizationState get _value => super._value as _$_MapOrganizationState;

  @override
  $Res call({
    Object? hospitals = freezed,
    Object? doctors = freezed,
    Object? types = freezed,
    Object? status = freezed,
    Object? getTypesStatus = freezed,
    Object? searchText = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
  }) {
    return _then(_$_MapOrganizationState(
      hospitals: hospitals == freezed
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<MapHospitalModel>,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MapDoctorModel>,
      types: types == freezed
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getTypesStatus: getTypesStatus == freezed
          ? _value.getTypesStatus
          : getTypesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_MapOrganizationState implements _MapOrganizationState {
  _$_MapOrganizationState(
      {final List<MapHospitalModel> hospitals = const [],
      final List<MapDoctorModel> doctors = const [],
      final List<TypeEntity> types = const [],
      this.status = FormzStatus.pure,
      this.getTypesStatus = FormzStatus.pure,
      this.searchText = '',
      this.next,
      this.fetchMore = false})
      : _hospitals = hospitals,
        _doctors = doctors,
        _types = types;

  final List<MapHospitalModel> _hospitals;
  @override
  @JsonKey()
  List<MapHospitalModel> get hospitals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  final List<MapDoctorModel> _doctors;
  @override
  @JsonKey()
  List<MapDoctorModel> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  final List<TypeEntity> _types;
  @override
  @JsonKey()
  List<TypeEntity> get types {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus getTypesStatus;
  @override
  @JsonKey()
  final String searchText;
  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;

  @override
  String toString() {
    return 'MapOrganizationState(hospitals: $hospitals, doctors: $doctors, types: $types, status: $status, getTypesStatus: $getTypesStatus, searchText: $searchText, next: $next, fetchMore: $fetchMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapOrganizationState &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.getTypesStatus, getTypesStatus) &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hospitals),
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(getTypesStatus),
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore));

  @JsonKey(ignore: true)
  @override
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      __$$_MapOrganizationStateCopyWithImpl<_$_MapOrganizationState>(
          this, _$identity);
}

abstract class _MapOrganizationState implements MapOrganizationState {
  factory _MapOrganizationState(
      {final List<MapHospitalModel> hospitals,
      final List<MapDoctorModel> doctors,
      final List<TypeEntity> types,
      final FormzStatus status,
      final FormzStatus getTypesStatus,
      final String searchText,
      final String? next,
      final bool fetchMore}) = _$_MapOrganizationState;

  @override
  List<MapHospitalModel> get hospitals;
  @override
  List<MapDoctorModel> get doctors;
  @override
  List<TypeEntity> get types;
  @override
  FormzStatus get status;
  @override
  FormzStatus get getTypesStatus;
  @override
  String get searchText;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  @JsonKey(ignore: true)
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}
