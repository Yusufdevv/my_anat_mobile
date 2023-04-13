// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'services_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServicesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesEventCopyWith<$Res> {
  factory $ServicesEventCopyWith(
          ServicesEvent value, $Res Function(ServicesEvent) then) =
      _$ServicesEventCopyWithImpl<$Res, ServicesEvent>;
}

/// @nodoc
class _$ServicesEventCopyWithImpl<$Res, $Val extends ServicesEvent>
    implements $ServicesEventCopyWith<$Res> {
  _$ServicesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetServicesOrgCopyWith<$Res> {
  factory _$$_GetServicesOrgCopyWith(
          _$_GetServicesOrg value, $Res Function(_$_GetServicesOrg) then) =
      __$$_GetServicesOrgCopyWithImpl<$Res>;
  @useResult
  $Res call({int specializationId});
}

/// @nodoc
class __$$_GetServicesOrgCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetServicesOrg>
    implements _$$_GetServicesOrgCopyWith<$Res> {
  __$$_GetServicesOrgCopyWithImpl(
      _$_GetServicesOrg _value, $Res Function(_$_GetServicesOrg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specializationId = null,
  }) {
    return _then(_$_GetServicesOrg(
      specializationId: null == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetServicesOrg
    with DiagnosticableTreeMixin
    implements _GetServicesOrg {
  _$_GetServicesOrg({required this.specializationId});

  @override
  final int specializationId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getServicesOrg(specializationId: $specializationId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.getServicesOrg'))
      ..add(DiagnosticsProperty('specializationId', specializationId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetServicesOrg &&
            (identical(other.specializationId, specializationId) ||
                other.specializationId == specializationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, specializationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetServicesOrgCopyWith<_$_GetServicesOrg> get copyWith =>
      __$$_GetServicesOrgCopyWithImpl<_$_GetServicesOrg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getServicesOrg(specializationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getServicesOrg?.call(specializationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServicesOrg != null) {
      return getServicesOrg(specializationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getServicesOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getServicesOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServicesOrg != null) {
      return getServicesOrg(this);
    }
    return orElse();
  }
}

abstract class _GetServicesOrg implements ServicesEvent {
  factory _GetServicesOrg({required final int specializationId}) =
      _$_GetServicesOrg;

  int get specializationId;
  @JsonKey(ignore: true)
  _$$_GetServicesOrgCopyWith<_$_GetServicesOrg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreServicesOrgCopyWith<$Res> {
  factory _$$_GetMoreServicesOrgCopyWith(_$_GetMoreServicesOrg value,
          $Res Function(_$_GetMoreServicesOrg) then) =
      __$$_GetMoreServicesOrgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreServicesOrgCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetMoreServicesOrg>
    implements _$$_GetMoreServicesOrgCopyWith<$Res> {
  __$$_GetMoreServicesOrgCopyWithImpl(
      _$_GetMoreServicesOrg _value, $Res Function(_$_GetMoreServicesOrg) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreServicesOrg
    with DiagnosticableTreeMixin
    implements _GetMoreServicesOrg {
  _$_GetMoreServicesOrg();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getMoreServicesOrg()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ServicesEvent.getMoreServicesOrg'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreServicesOrg);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getMoreServicesOrg();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getMoreServicesOrg?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServicesOrg != null) {
      return getMoreServicesOrg();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getMoreServicesOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getMoreServicesOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServicesOrg != null) {
      return getMoreServicesOrg(this);
    }
    return orElse();
  }
}

abstract class _GetMoreServicesOrg implements ServicesEvent {
  factory _GetMoreServicesOrg() = _$_GetMoreServicesOrg;
}

/// @nodoc
abstract class _$$_GetServicesSpecialCopyWith<$Res> {
  factory _$$_GetServicesSpecialCopyWith(_$_GetServicesSpecial value,
          $Res Function(_$_GetServicesSpecial) then) =
      __$$_GetServicesSpecialCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetServicesSpecialCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetServicesSpecial>
    implements _$$_GetServicesSpecialCopyWith<$Res> {
  __$$_GetServicesSpecialCopyWithImpl(
      _$_GetServicesSpecial _value, $Res Function(_$_GetServicesSpecial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetServicesSpecial(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetServicesSpecial
    with DiagnosticableTreeMixin
    implements _GetServicesSpecial {
  _$_GetServicesSpecial({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getServicesSpecial(organizationId: $organizationId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.getServicesSpecial'))
      ..add(DiagnosticsProperty('organizationId', organizationId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetServicesSpecial &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetServicesSpecialCopyWith<_$_GetServicesSpecial> get copyWith =>
      __$$_GetServicesSpecialCopyWithImpl<_$_GetServicesSpecial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getServicesSpecial(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getServicesSpecial?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServicesSpecial != null) {
      return getServicesSpecial(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getServicesSpecial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getServicesSpecial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServicesSpecial != null) {
      return getServicesSpecial(this);
    }
    return orElse();
  }
}

abstract class _GetServicesSpecial implements ServicesEvent {
  factory _GetServicesSpecial({required final int organizationId}) =
      _$_GetServicesSpecial;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetServicesSpecialCopyWith<_$_GetServicesSpecial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreServicesSpecialCopyWith<$Res> {
  factory _$$_GetMoreServicesSpecialCopyWith(_$_GetMoreServicesSpecial value,
          $Res Function(_$_GetMoreServicesSpecial) then) =
      __$$_GetMoreServicesSpecialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreServicesSpecialCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetMoreServicesSpecial>
    implements _$$_GetMoreServicesSpecialCopyWith<$Res> {
  __$$_GetMoreServicesSpecialCopyWithImpl(_$_GetMoreServicesSpecial _value,
      $Res Function(_$_GetMoreServicesSpecial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreServicesSpecial
    with DiagnosticableTreeMixin
    implements _GetMoreServicesSpecial {
  _$_GetMoreServicesSpecial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getMoreServicesSpecial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ServicesEvent.getMoreServicesSpecial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoreServicesSpecial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getMoreServicesSpecial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getMoreServicesSpecial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServicesSpecial != null) {
      return getMoreServicesSpecial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getMoreServicesSpecial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getMoreServicesSpecial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServicesSpecial != null) {
      return getMoreServicesSpecial(this);
    }
    return orElse();
  }
}

abstract class _GetMoreServicesSpecial implements ServicesEvent {
  factory _GetMoreServicesSpecial() = _$_GetMoreServicesSpecial;
}

/// @nodoc
abstract class _$$_SearchServicesOrgCopyWith<$Res> {
  factory _$$_SearchServicesOrgCopyWith(_$_SearchServicesOrg value,
          $Res Function(_$_SearchServicesOrg) then) =
      __$$_SearchServicesOrgCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchServicesOrgCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_SearchServicesOrg>
    implements _$$_SearchServicesOrgCopyWith<$Res> {
  __$$_SearchServicesOrgCopyWithImpl(
      _$_SearchServicesOrg _value, $Res Function(_$_SearchServicesOrg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchServicesOrg(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchServicesOrg
    with DiagnosticableTreeMixin
    implements _SearchServicesOrg {
  _$_SearchServicesOrg({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.searchServicesOrg(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.searchServicesOrg'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchServicesOrg &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchServicesOrgCopyWith<_$_SearchServicesOrg> get copyWith =>
      __$$_SearchServicesOrgCopyWithImpl<_$_SearchServicesOrg>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return searchServicesOrg(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return searchServicesOrg?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServicesOrg != null) {
      return searchServicesOrg(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return searchServicesOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return searchServicesOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServicesOrg != null) {
      return searchServicesOrg(this);
    }
    return orElse();
  }
}

abstract class _SearchServicesOrg implements ServicesEvent {
  factory _SearchServicesOrg({required final String query}) =
      _$_SearchServicesOrg;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchServicesOrgCopyWith<_$_SearchServicesOrg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchServicesSpecialCopyWith<$Res> {
  factory _$$_SearchServicesSpecialCopyWith(_$_SearchServicesSpecial value,
          $Res Function(_$_SearchServicesSpecial) then) =
      __$$_SearchServicesSpecialCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchServicesSpecialCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_SearchServicesSpecial>
    implements _$$_SearchServicesSpecialCopyWith<$Res> {
  __$$_SearchServicesSpecialCopyWithImpl(_$_SearchServicesSpecial _value,
      $Res Function(_$_SearchServicesSpecial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchServicesSpecial(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchServicesSpecial
    with DiagnosticableTreeMixin
    implements _SearchServicesSpecial {
  _$_SearchServicesSpecial({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.searchServicesSpecial(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.searchServicesSpecial'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchServicesSpecial &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchServicesSpecialCopyWith<_$_SearchServicesSpecial> get copyWith =>
      __$$_SearchServicesSpecialCopyWithImpl<_$_SearchServicesSpecial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return searchServicesSpecial(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return searchServicesSpecial?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServicesSpecial != null) {
      return searchServicesSpecial(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return searchServicesSpecial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return searchServicesSpecial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServicesSpecial != null) {
      return searchServicesSpecial(this);
    }
    return orElse();
  }
}

abstract class _SearchServicesSpecial implements ServicesEvent {
  factory _SearchServicesSpecial({required final String query}) =
      _$_SearchServicesSpecial;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchServicesSpecialCopyWith<_$_SearchServicesSpecial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSingleServiceCopyWith<$Res> {
  factory _$$_GetSingleServiceCopyWith(
          _$_GetSingleService value, $Res Function(_$_GetSingleService) then) =
      __$$_GetSingleServiceCopyWithImpl<$Res>;
  @useResult
  $Res call({int serviceId});
}

/// @nodoc
class __$$_GetSingleServiceCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetSingleService>
    implements _$$_GetSingleServiceCopyWith<$Res> {
  __$$_GetSingleServiceCopyWithImpl(
      _$_GetSingleService _value, $Res Function(_$_GetSingleService) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
  }) {
    return _then(_$_GetSingleService(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetSingleService
    with DiagnosticableTreeMixin
    implements _GetSingleService {
  _$_GetSingleService({required this.serviceId});

  @override
  final int serviceId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getSingleService(serviceId: $serviceId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.getSingleService'))
      ..add(DiagnosticsProperty('serviceId', serviceId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSingleService &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSingleServiceCopyWith<_$_GetSingleService> get copyWith =>
      __$$_GetSingleServiceCopyWithImpl<_$_GetSingleService>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int specializationId) getServicesOrg,
    required TResult Function() getMoreServicesOrg,
    required TResult Function(int organizationId) getServicesSpecial,
    required TResult Function() getMoreServicesSpecial,
    required TResult Function(String query) searchServicesOrg,
    required TResult Function(String query) searchServicesSpecial,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getSingleService(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int specializationId)? getServicesOrg,
    TResult? Function()? getMoreServicesOrg,
    TResult? Function(int organizationId)? getServicesSpecial,
    TResult? Function()? getMoreServicesSpecial,
    TResult? Function(String query)? searchServicesOrg,
    TResult? Function(String query)? searchServicesSpecial,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getSingleService?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int specializationId)? getServicesOrg,
    TResult Function()? getMoreServicesOrg,
    TResult Function(int organizationId)? getServicesSpecial,
    TResult Function()? getMoreServicesSpecial,
    TResult Function(String query)? searchServicesOrg,
    TResult Function(String query)? searchServicesSpecial,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getSingleService != null) {
      return getSingleService(serviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServicesOrg value) getServicesOrg,
    required TResult Function(_GetMoreServicesOrg value) getMoreServicesOrg,
    required TResult Function(_GetServicesSpecial value) getServicesSpecial,
    required TResult Function(_GetMoreServicesSpecial value)
        getMoreServicesSpecial,
    required TResult Function(_SearchServicesOrg value) searchServicesOrg,
    required TResult Function(_SearchServicesSpecial value)
        searchServicesSpecial,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getSingleService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServicesOrg value)? getServicesOrg,
    TResult? Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult? Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult? Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult? Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult? Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getSingleService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServicesOrg value)? getServicesOrg,
    TResult Function(_GetMoreServicesOrg value)? getMoreServicesOrg,
    TResult Function(_GetServicesSpecial value)? getServicesSpecial,
    TResult Function(_GetMoreServicesSpecial value)? getMoreServicesSpecial,
    TResult Function(_SearchServicesOrg value)? searchServicesOrg,
    TResult Function(_SearchServicesSpecial value)? searchServicesSpecial,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getSingleService != null) {
      return getSingleService(this);
    }
    return orElse();
  }
}

abstract class _GetSingleService implements ServicesEvent {
  factory _GetSingleService({required final int serviceId}) =
      _$_GetSingleService;

  int get serviceId;
  @JsonKey(ignore: true)
  _$$_GetSingleServiceCopyWith<_$_GetSingleService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServicesState {
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get paginationStatus => throw _privateConstructorUsedError;
  List<HospitalServiceEntity> get servicesOrg =>
      throw _privateConstructorUsedError;
  List<HospitalServiceSpecialEntity> get servicesSpecial =>
      throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get hospitalId => throw _privateConstructorUsedError;
  int get specilizationId => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get serviceCount => throw _privateConstructorUsedError;
  FormzStatus get getSingleServiceStatus => throw _privateConstructorUsedError;
  HospitalServiceSingleEntity get serviceSingle =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<HospitalServiceEntity> servicesOrg,
      List<HospitalServiceSpecialEntity> servicesSpecial,
      String? next,
      bool fetchMore,
      int hospitalId,
      int specilizationId,
      String searchQuery,
      int serviceCount,
      FormzStatus getSingleServiceStatus,
      HospitalServiceSingleEntity serviceSingle});
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? servicesOrg = null,
    Object? servicesSpecial = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? hospitalId = null,
    Object? specilizationId = null,
    Object? searchQuery = null,
    Object? serviceCount = null,
    Object? getSingleServiceStatus = null,
    Object? serviceSingle = null,
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
      servicesOrg: null == servicesOrg
          ? _value.servicesOrg
          : servicesOrg // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
      servicesSpecial: null == servicesSpecial
          ? _value.servicesSpecial
          : servicesSpecial // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceSpecialEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as int,
      specilizationId: null == specilizationId
          ? _value.specilizationId
          : specilizationId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCount: null == serviceCount
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int,
      getSingleServiceStatus: null == getSingleServiceStatus
          ? _value.getSingleServiceStatus
          : getSingleServiceStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      serviceSingle: null == serviceSingle
          ? _value.serviceSingle
          : serviceSingle // ignore: cast_nullable_to_non_nullable
              as HospitalServiceSingleEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$_ServicesStateCopyWith(
          _$_ServicesState value, $Res Function(_$_ServicesState) then) =
      __$$_ServicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<HospitalServiceEntity> servicesOrg,
      List<HospitalServiceSpecialEntity> servicesSpecial,
      String? next,
      bool fetchMore,
      int hospitalId,
      int specilizationId,
      String searchQuery,
      int serviceCount,
      FormzStatus getSingleServiceStatus,
      HospitalServiceSingleEntity serviceSingle});
}

/// @nodoc
class __$$_ServicesStateCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$_ServicesState>
    implements _$$_ServicesStateCopyWith<$Res> {
  __$$_ServicesStateCopyWithImpl(
      _$_ServicesState _value, $Res Function(_$_ServicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? servicesOrg = null,
    Object? servicesSpecial = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? hospitalId = null,
    Object? specilizationId = null,
    Object? searchQuery = null,
    Object? serviceCount = null,
    Object? getSingleServiceStatus = null,
    Object? serviceSingle = null,
  }) {
    return _then(_$_ServicesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      servicesOrg: null == servicesOrg
          ? _value._servicesOrg
          : servicesOrg // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
      servicesSpecial: null == servicesSpecial
          ? _value._servicesSpecial
          : servicesSpecial // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceSpecialEntity>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as int,
      specilizationId: null == specilizationId
          ? _value.specilizationId
          : specilizationId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCount: null == serviceCount
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int,
      getSingleServiceStatus: null == getSingleServiceStatus
          ? _value.getSingleServiceStatus
          : getSingleServiceStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      serviceSingle: null == serviceSingle
          ? _value.serviceSingle
          : serviceSingle // ignore: cast_nullable_to_non_nullable
              as HospitalServiceSingleEntity,
    ));
  }
}

/// @nodoc

class _$_ServicesState with DiagnosticableTreeMixin implements _ServicesState {
  _$_ServicesState(
      {this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      final List<HospitalServiceEntity> servicesOrg = const [],
      final List<HospitalServiceSpecialEntity> servicesSpecial = const [],
      this.next,
      this.fetchMore = false,
      this.hospitalId = 0,
      this.specilizationId = 0,
      this.searchQuery = '',
      this.serviceCount = 0,
      this.getSingleServiceStatus = FormzStatus.pure,
      this.serviceSingle = const HospitalServiceSingleEntity()})
      : _servicesOrg = servicesOrg,
        _servicesSpecial = servicesSpecial;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  final List<HospitalServiceEntity> _servicesOrg;
  @override
  @JsonKey()
  List<HospitalServiceEntity> get servicesOrg {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesOrg);
  }

  final List<HospitalServiceSpecialEntity> _servicesSpecial;
  @override
  @JsonKey()
  List<HospitalServiceSpecialEntity> get servicesSpecial {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesSpecial);
  }

  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final int hospitalId;
  @override
  @JsonKey()
  final int specilizationId;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int serviceCount;
  @override
  @JsonKey()
  final FormzStatus getSingleServiceStatus;
  @override
  @JsonKey()
  final HospitalServiceSingleEntity serviceSingle;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesState(status: $status, paginationStatus: $paginationStatus, servicesOrg: $servicesOrg, servicesSpecial: $servicesSpecial, next: $next, fetchMore: $fetchMore, hospitalId: $hospitalId, specilizationId: $specilizationId, searchQuery: $searchQuery, serviceCount: $serviceCount, getSingleServiceStatus: $getSingleServiceStatus, serviceSingle: $serviceSingle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('paginationStatus', paginationStatus))
      ..add(DiagnosticsProperty('servicesOrg', servicesOrg))
      ..add(DiagnosticsProperty('servicesSpecial', servicesSpecial))
      ..add(DiagnosticsProperty('next', next))
      ..add(DiagnosticsProperty('fetchMore', fetchMore))
      ..add(DiagnosticsProperty('hospitalId', hospitalId))
      ..add(DiagnosticsProperty('specilizationId', specilizationId))
      ..add(DiagnosticsProperty('searchQuery', searchQuery))
      ..add(DiagnosticsProperty('serviceCount', serviceCount))
      ..add(
          DiagnosticsProperty('getSingleServiceStatus', getSingleServiceStatus))
      ..add(DiagnosticsProperty('serviceSingle', serviceSingle));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            const DeepCollectionEquality()
                .equals(other._servicesOrg, _servicesOrg) &&
            const DeepCollectionEquality()
                .equals(other._servicesSpecial, _servicesSpecial) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.specilizationId, specilizationId) ||
                other.specilizationId == specilizationId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.serviceCount, serviceCount) ||
                other.serviceCount == serviceCount) &&
            (identical(other.getSingleServiceStatus, getSingleServiceStatus) ||
                other.getSingleServiceStatus == getSingleServiceStatus) &&
            (identical(other.serviceSingle, serviceSingle) ||
                other.serviceSingle == serviceSingle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      paginationStatus,
      const DeepCollectionEquality().hash(_servicesOrg),
      const DeepCollectionEquality().hash(_servicesSpecial),
      next,
      fetchMore,
      hospitalId,
      specilizationId,
      searchQuery,
      serviceCount,
      getSingleServiceStatus,
      serviceSingle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      __$$_ServicesStateCopyWithImpl<_$_ServicesState>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  factory _ServicesState(
      {final FormzStatus status,
      final FormzStatus paginationStatus,
      final List<HospitalServiceEntity> servicesOrg,
      final List<HospitalServiceSpecialEntity> servicesSpecial,
      final String? next,
      final bool fetchMore,
      final int hospitalId,
      final int specilizationId,
      final String searchQuery,
      final int serviceCount,
      final FormzStatus getSingleServiceStatus,
      final HospitalServiceSingleEntity serviceSingle}) = _$_ServicesState;

  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  List<HospitalServiceEntity> get servicesOrg;
  @override
  List<HospitalServiceSpecialEntity> get servicesSpecial;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  int get hospitalId;
  @override
  int get specilizationId;
  @override
  String get searchQuery;
  @override
  int get serviceCount;
  @override
  FormzStatus get getSingleServiceStatus;
  @override
  HospitalServiceSingleEntity get serviceSingle;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
