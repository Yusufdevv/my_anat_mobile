// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationEventCopyWith<$Res> {
  factory $MapOrganizationEventCopyWith(MapOrganizationEvent value,
          $Res Function(MapOrganizationEvent) then) =
      _$MapOrganizationEventCopyWithImpl<$Res, MapOrganizationEvent>;
}

/// @nodoc
class _$MapOrganizationEventCopyWithImpl<$Res,
        $Val extends MapOrganizationEvent>
    implements $MapOrganizationEventCopyWith<$Res> {
  _$MapOrganizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChangeTabCopyWith<$Res> {
  factory _$$_ChangeTabCopyWith(
          _$_ChangeTab value, $Res Function(_$_ChangeTab) then) =
      __$$_ChangeTabCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int tab, BuildContext context, double acuracy, bool haveToLoading});
}

/// @nodoc
class __$$_ChangeTabCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeTab>
    implements _$$_ChangeTabCopyWith<$Res> {
  __$$_ChangeTabCopyWithImpl(
      _$_ChangeTab _value, $Res Function(_$_ChangeTab) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? context = null,
    Object? acuracy = null,
    Object? haveToLoading = null,
  }) {
    return _then(_$_ChangeTab(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as int,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      acuracy: null == acuracy
          ? _value.acuracy
          : acuracy // ignore: cast_nullable_to_non_nullable
              as double,
      haveToLoading: null == haveToLoading
          ? _value.haveToLoading
          : haveToLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChangeTab implements _ChangeTab {
  _$_ChangeTab(
      {required this.tab,
      required this.context,
      required this.acuracy,
      required this.haveToLoading});

  @override
  final int tab;
  @override
  final BuildContext context;
  @override
  final double acuracy;
  @override
  final bool haveToLoading;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeTab(tab: $tab, context: $context, acuracy: $acuracy, haveToLoading: $haveToLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTab &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.acuracy, acuracy) || other.acuracy == acuracy) &&
            (identical(other.haveToLoading, haveToLoading) ||
                other.haveToLoading == haveToLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tab, context, acuracy, haveToLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTabCopyWith<_$_ChangeTab> get copyWith =>
      __$$_ChangeTabCopyWithImpl<_$_ChangeTab>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeTab(tab, context, acuracy, haveToLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeTab?.call(tab, context, acuracy, haveToLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(tab, context, acuracy, haveToLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeTab implements MapOrganizationEvent {
  factory _ChangeTab(
      {required final int tab,
      required final BuildContext context,
      required final double acuracy,
      required final bool haveToLoading}) = _$_ChangeTab;

  int get tab;
  BuildContext get context;
  double get acuracy;
  bool get haveToLoading;
  @JsonKey(ignore: true)
  _$$_ChangeTabCopyWith<_$_ChangeTab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetHospitalsCopyWith<$Res> {
  factory _$$_GetHospitalsCopyWith(
          _$_GetHospitals value, $Res Function(_$_GetHospitals) then) =
      __$$_GetHospitalsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      double? latitude,
      double? longitude,
      double? radius});
}

/// @nodoc
class __$$_GetHospitalsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetHospitals>
    implements _$$_GetHospitalsCopyWith<$Res> {
  __$$_GetHospitalsCopyWithImpl(
      _$_GetHospitals _value, $Res Function(_$_GetHospitals) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$_GetHospitals(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_GetHospitals implements _GetHospitals {
  _$_GetHospitals(
      {required this.context, this.latitude, this.longitude, this.radius});

  @override
  final BuildContext context;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.getHospitals(context: $context, latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetHospitals &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, latitude, longitude, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      __$$_GetHospitalsCopyWithImpl<_$_GetHospitals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getHospitals(context, latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getHospitals?.call(context, latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(context, latitude, longitude, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getHospitals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getHospitals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getHospitals != null) {
      return getHospitals(this);
    }
    return orElse();
  }
}

abstract class _GetHospitals implements MapOrganizationEvent {
  factory _GetHospitals(
      {required final BuildContext context,
      final double? latitude,
      final double? longitude,
      final double? radius}) = _$_GetHospitals;

  BuildContext get context;
  double? get latitude;
  double? get longitude;
  double? get radius;
  @JsonKey(ignore: true)
  _$$_GetHospitalsCopyWith<_$_GetHospitals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDoctorsCopyWith<$Res> {
  factory _$$_GetDoctorsCopyWith(
          _$_GetDoctors value, $Res Function(_$_GetDoctors) then) =
      __$$_GetDoctorsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? radius,
      BuildContext context});
}

/// @nodoc
class __$$_GetDoctorsCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetDoctors>
    implements _$$_GetDoctorsCopyWith<$Res> {
  __$$_GetDoctorsCopyWithImpl(
      _$_GetDoctors _value, $Res Function(_$_GetDoctors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? context = null,
  }) {
    return _then(_$_GetDoctors(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_GetDoctors implements _GetDoctors {
  _$_GetDoctors(
      {this.latitude, this.longitude, this.radius, required this.context});

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radius;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'MapOrganizationEvent.getDoctors(latitude: $latitude, longitude: $longitude, radius: $radius, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDoctors &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, radius, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      __$$_GetDoctorsCopyWithImpl<_$_GetDoctors>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getDoctors(latitude, longitude, radius, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getDoctors?.call(latitude, longitude, radius, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(latitude, longitude, radius, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements MapOrganizationEvent {
  factory _GetDoctors(
      {final double? latitude,
      final double? longitude,
      final double? radius,
      required final BuildContext context}) = _$_GetDoctors;

  double? get latitude;
  double? get longitude;
  double? get radius;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$_GetDoctorsCopyWith<_$_GetDoctors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetTypesCopyWith<$Res> {
  factory _$$_GetTypesCopyWith(
          _$_GetTypes value, $Res Function(_$_GetTypes) then) =
      __$$_GetTypesCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$_GetTypesCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetTypes>
    implements _$$_GetTypesCopyWith<$Res> {
  __$$_GetTypesCopyWithImpl(
      _$_GetTypes _value, $Res Function(_$_GetTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_GetTypes(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetTypes implements _GetTypes {
  _$_GetTypes({required this.searchText});

  @override
  final String searchText;

  @override
  String toString() {
    return 'MapOrganizationEvent.getTypes(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTypes &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetTypesCopyWith<_$_GetTypes> get copyWith =>
      __$$_GetTypesCopyWithImpl<_$_GetTypes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getTypes(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getTypes?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getTypes != null) {
      return getTypes(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getTypes != null) {
      return getTypes(this);
    }
    return orElse();
  }
}

abstract class _GetTypes implements MapOrganizationEvent {
  factory _GetTypes({required final String searchText}) = _$_GetTypes;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_GetTypesCopyWith<_$_GetTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreTypesCopyWith<$Res> {
  factory _$$_GetMoreTypesCopyWith(
          _$_GetMoreTypes value, $Res Function(_$_GetMoreTypes) then) =
      __$$_GetMoreTypesCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$_GetMoreTypesCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetMoreTypes>
    implements _$$_GetMoreTypesCopyWith<$Res> {
  __$$_GetMoreTypesCopyWithImpl(
      _$_GetMoreTypes _value, $Res Function(_$_GetMoreTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_GetMoreTypes(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetMoreTypes implements _GetMoreTypes {
  _$_GetMoreTypes({required this.searchText});

  @override
  final String searchText;

  @override
  String toString() {
    return 'MapOrganizationEvent.getMoreTypes(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoreTypes &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMoreTypesCopyWith<_$_GetMoreTypes> get copyWith =>
      __$$_GetMoreTypesCopyWithImpl<_$_GetMoreTypes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getMoreTypes(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getMoreTypes?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getMoreTypes != null) {
      return getMoreTypes(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getMoreTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getMoreTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getMoreTypes != null) {
      return getMoreTypes(this);
    }
    return orElse();
  }
}

abstract class _GetMoreTypes implements MapOrganizationEvent {
  factory _GetMoreTypes({required final String searchText}) = _$_GetMoreTypes;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_GetMoreTypesCopyWith<_$_GetMoreTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeSearchTextCopyWith<$Res> {
  factory _$$_ChangeSearchTextCopyWith(
          _$_ChangeSearchText value, $Res Function(_$_ChangeSearchText) then) =
      __$$_ChangeSearchTextCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeSearchTextCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeSearchText>
    implements _$$_ChangeSearchTextCopyWith<$Res> {
  __$$_ChangeSearchTextCopyWithImpl(
      _$_ChangeSearchText _value, $Res Function(_$_ChangeSearchText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangeSearchText(
      null == text
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
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSearchTextCopyWith<_$_ChangeSearchText> get copyWith =>
      __$$_ChangeSearchTextCopyWithImpl<_$_ChangeSearchText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeSearchText(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeSearchText?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
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
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeSearchText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeSearchText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
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
abstract class _$$_OnMapCreatedCopyWith<$Res> {
  factory _$$_OnMapCreatedCopyWith(
          _$_OnMapCreated value, $Res Function(_$_OnMapCreated) then) =
      __$$_OnMapCreatedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {YandexMapController controller,
      int orgMapV2TabIndex,
      BuildContext context});
}

/// @nodoc
class __$$_OnMapCreatedCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_OnMapCreated>
    implements _$$_OnMapCreatedCopyWith<$Res> {
  __$$_OnMapCreatedCopyWithImpl(
      _$_OnMapCreated _value, $Res Function(_$_OnMapCreated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? orgMapV2TabIndex = null,
    Object? context = null,
  }) {
    return _then(_$_OnMapCreated(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as YandexMapController,
      orgMapV2TabIndex: null == orgMapV2TabIndex
          ? _value.orgMapV2TabIndex
          : orgMapV2TabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_OnMapCreated implements _OnMapCreated {
  _$_OnMapCreated(
      {required this.controller,
      required this.orgMapV2TabIndex,
      required this.context});

  @override
  final YandexMapController controller;
  @override
  final int orgMapV2TabIndex;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'MapOrganizationEvent.onMapCreated(controller: $controller, orgMapV2TabIndex: $orgMapV2TabIndex, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnMapCreated &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.orgMapV2TabIndex, orgMapV2TabIndex) ||
                other.orgMapV2TabIndex == orgMapV2TabIndex) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, controller, orgMapV2TabIndex, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnMapCreatedCopyWith<_$_OnMapCreated> get copyWith =>
      __$$_OnMapCreatedCopyWithImpl<_$_OnMapCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return onMapCreated(controller, orgMapV2TabIndex, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return onMapCreated?.call(controller, orgMapV2TabIndex, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(controller, orgMapV2TabIndex, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return onMapCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return onMapCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(this);
    }
    return orElse();
  }
}

abstract class _OnMapCreated implements MapOrganizationEvent {
  factory _OnMapCreated(
      {required final YandexMapController controller,
      required final int orgMapV2TabIndex,
      required final BuildContext context}) = _$_OnMapCreated;

  YandexMapController get controller;
  int get orgMapV2TabIndex;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$_OnMapCreatedCopyWith<_$_OnMapCreated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeRadiusCopyWith<$Res> {
  factory _$$_ChangeRadiusCopyWith(
          _$_ChangeRadius value, $Res Function(_$_ChangeRadius) then) =
      __$$_ChangeRadiusCopyWithImpl<$Res>;
  @useResult
  $Res call({int radius});
}

/// @nodoc
class __$$_ChangeRadiusCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeRadius>
    implements _$$_ChangeRadiusCopyWith<$Res> {
  __$$_ChangeRadiusCopyWithImpl(
      _$_ChangeRadius _value, $Res Function(_$_ChangeRadius) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
  }) {
    return _then(_$_ChangeRadius(
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeRadius implements _ChangeRadius {
  _$_ChangeRadius({required this.radius});

  @override
  final int radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeRadius(radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeRadius &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeRadiusCopyWith<_$_ChangeRadius> get copyWith =>
      __$$_ChangeRadiusCopyWithImpl<_$_ChangeRadius>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeRadius(radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeRadius?.call(radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeRadius != null) {
      return changeRadius(radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeRadius != null) {
      return changeRadius(this);
    }
    return orElse();
  }
}

abstract class _ChangeRadius implements MapOrganizationEvent {
  factory _ChangeRadius({required final int radius}) = _$_ChangeRadius;

  int get radius;
  @JsonKey(ignore: true)
  _$$_ChangeRadiusCopyWith<_$_ChangeRadius> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ZoomInCopyWith<$Res> {
  factory _$$_ZoomInCopyWith(_$_ZoomIn value, $Res Function(_$_ZoomIn) then) =
      __$$_ZoomInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ZoomInCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ZoomIn>
    implements _$$_ZoomInCopyWith<$Res> {
  __$$_ZoomInCopyWithImpl(_$_ZoomIn _value, $Res Function(_$_ZoomIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ZoomIn implements _ZoomIn {
  _$_ZoomIn();

  @override
  String toString() {
    return 'MapOrganizationEvent.zoomIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ZoomIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return zoomIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return zoomIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return zoomIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return zoomIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn(this);
    }
    return orElse();
  }
}

abstract class _ZoomIn implements MapOrganizationEvent {
  factory _ZoomIn() = _$_ZoomIn;
}

/// @nodoc
abstract class _$$_ZoomOutCopyWith<$Res> {
  factory _$$_ZoomOutCopyWith(
          _$_ZoomOut value, $Res Function(_$_ZoomOut) then) =
      __$$_ZoomOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ZoomOutCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ZoomOut>
    implements _$$_ZoomOutCopyWith<$Res> {
  __$$_ZoomOutCopyWithImpl(_$_ZoomOut _value, $Res Function(_$_ZoomOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ZoomOut implements _ZoomOut {
  _$_ZoomOut();

  @override
  String toString() {
    return 'MapOrganizationEvent.zoomOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ZoomOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return zoomOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return zoomOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return zoomOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return zoomOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut(this);
    }
    return orElse();
  }
}

abstract class _ZoomOut implements MapOrganizationEvent {
  factory _ZoomOut() = _$_ZoomOut;
}

/// @nodoc
abstract class _$$_GetCurrentLocationCopyWith<$Res> {
  factory _$$_GetCurrentLocationCopyWith(_$_GetCurrentLocation value,
          $Res Function(_$_GetCurrentLocation) then) =
      __$$_GetCurrentLocationCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueChanged<String> onError, BuildContext context});
}

/// @nodoc
class __$$_GetCurrentLocationCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_GetCurrentLocation>
    implements _$$_GetCurrentLocationCopyWith<$Res> {
  __$$_GetCurrentLocationCopyWithImpl(
      _$_GetCurrentLocation _value, $Res Function(_$_GetCurrentLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onError = null,
    Object? context = null,
  }) {
    return _then(_$_GetCurrentLocation(
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ValueChanged<String>,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_GetCurrentLocation implements _GetCurrentLocation {
  _$_GetCurrentLocation({required this.onError, required this.context});

  @override
  final ValueChanged<String> onError;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'MapOrganizationEvent.getCurrentLocation(onError: $onError, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCurrentLocation &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onError, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCurrentLocationCopyWith<_$_GetCurrentLocation> get copyWith =>
      __$$_GetCurrentLocationCopyWithImpl<_$_GetCurrentLocation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return getCurrentLocation(onError, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return getCurrentLocation?.call(onError, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(onError, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class _GetCurrentLocation implements MapOrganizationEvent {
  factory _GetCurrentLocation(
      {required final ValueChanged<String> onError,
      required final BuildContext context}) = _$_GetCurrentLocation;

  ValueChanged<String> get onError;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$_GetCurrentLocationCopyWith<_$_GetCurrentLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeLatLongCopyWith<$Res> {
  factory _$$_ChangeLatLongCopyWith(
          _$_ChangeLatLong value, $Res Function(_$_ChangeLatLong) then) =
      __$$_ChangeLatLongCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double long, int? radius});
}

/// @nodoc
class __$$_ChangeLatLongCopyWithImpl<$Res>
    extends _$MapOrganizationEventCopyWithImpl<$Res, _$_ChangeLatLong>
    implements _$$_ChangeLatLongCopyWith<$Res> {
  __$$_ChangeLatLongCopyWithImpl(
      _$_ChangeLatLong _value, $Res Function(_$_ChangeLatLong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
    Object? radius = freezed,
  }) {
    return _then(_$_ChangeLatLong(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ChangeLatLong implements _ChangeLatLong {
  _$_ChangeLatLong({required this.lat, required this.long, this.radius});

  @override
  final double lat;
  @override
  final double long;
  @override
  final int? radius;

  @override
  String toString() {
    return 'MapOrganizationEvent.changeLatLong(lat: $lat, long: $long, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeLatLong &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeLatLongCopyWith<_$_ChangeLatLong> get copyWith =>
      __$$_ChangeLatLongCopyWithImpl<_$_ChangeLatLong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)
        changeTab,
    required TResult Function(BuildContext context, double? latitude,
            double? longitude, double? radius)
        getHospitals,
    required TResult Function(double? latitude, double? longitude,
            double? radius, BuildContext context)
        getDoctors,
    required TResult Function(String searchText) getTypes,
    required TResult Function(String searchText) getMoreTypes,
    required TResult Function(String text) changeSearchText,
    required TResult Function(YandexMapController controller,
            int orgMapV2TabIndex, BuildContext context)
        onMapCreated,
    required TResult Function(int radius) changeRadius,
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
    required TResult Function(
            ValueChanged<String> onError, BuildContext context)
        getCurrentLocation,
    required TResult Function(double lat, double long, int? radius)
        changeLatLong,
  }) {
    return changeLatLong(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult? Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult? Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult? Function(String searchText)? getTypes,
    TResult? Function(String searchText)? getMoreTypes,
    TResult? Function(String text)? changeSearchText,
    TResult? Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult? Function(int radius)? changeRadius,
    TResult? Function()? zoomIn,
    TResult? Function()? zoomOut,
    TResult? Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult? Function(double lat, double long, int? radius)? changeLatLong,
  }) {
    return changeLatLong?.call(lat, long, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int tab, BuildContext context, double acuracy, bool haveToLoading)?
        changeTab,
    TResult Function(BuildContext context, double? latitude, double? longitude,
            double? radius)?
        getHospitals,
    TResult Function(double? latitude, double? longitude, double? radius,
            BuildContext context)?
        getDoctors,
    TResult Function(String searchText)? getTypes,
    TResult Function(String searchText)? getMoreTypes,
    TResult Function(String text)? changeSearchText,
    TResult Function(YandexMapController controller, int orgMapV2TabIndex,
            BuildContext context)?
        onMapCreated,
    TResult Function(int radius)? changeRadius,
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    TResult Function(ValueChanged<String> onError, BuildContext context)?
        getCurrentLocation,
    TResult Function(double lat, double long, int? radius)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeLatLong != null) {
      return changeLatLong(lat, long, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_GetHospitals value) getHospitals,
    required TResult Function(_GetDoctors value) getDoctors,
    required TResult Function(_GetTypes value) getTypes,
    required TResult Function(_GetMoreTypes value) getMoreTypes,
    required TResult Function(_ChangeSearchText value) changeSearchText,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_ChangeRadius value) changeRadius,
    required TResult Function(_ZoomIn value) zoomIn,
    required TResult Function(_ZoomOut value) zoomOut,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_ChangeLatLong value) changeLatLong,
  }) {
    return changeLatLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_GetHospitals value)? getHospitals,
    TResult? Function(_GetDoctors value)? getDoctors,
    TResult? Function(_GetTypes value)? getTypes,
    TResult? Function(_GetMoreTypes value)? getMoreTypes,
    TResult? Function(_ChangeSearchText value)? changeSearchText,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_ChangeRadius value)? changeRadius,
    TResult? Function(_ZoomIn value)? zoomIn,
    TResult? Function(_ZoomOut value)? zoomOut,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_ChangeLatLong value)? changeLatLong,
  }) {
    return changeLatLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_GetHospitals value)? getHospitals,
    TResult Function(_GetDoctors value)? getDoctors,
    TResult Function(_GetTypes value)? getTypes,
    TResult Function(_GetMoreTypes value)? getMoreTypes,
    TResult Function(_ChangeSearchText value)? changeSearchText,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_ChangeRadius value)? changeRadius,
    TResult Function(_ZoomIn value)? zoomIn,
    TResult Function(_ZoomOut value)? zoomOut,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_ChangeLatLong value)? changeLatLong,
    required TResult orElse(),
  }) {
    if (changeLatLong != null) {
      return changeLatLong(this);
    }
    return orElse();
  }
}

abstract class _ChangeLatLong implements MapOrganizationEvent {
  factory _ChangeLatLong(
      {required final double lat,
      required final double long,
      final int? radius}) = _$_ChangeLatLong;

  double get lat;
  double get long;
  int? get radius;
  @JsonKey(ignore: true)
  _$$_ChangeLatLongCopyWith<_$_ChangeLatLong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapOrganizationState {
  List<OrgMapV2Model> get hospitals => throw _privateConstructorUsedError;
  List<DoctorMapEntity> get doctors => throw _privateConstructorUsedError;
  List<TypeEntity> get types => throw _privateConstructorUsedError;
  int get typesCount => throw _privateConstructorUsedError;
  String? get typesNext => throw _privateConstructorUsedError;
  List<MapObject<dynamic>> get mapObjects => throw _privateConstructorUsedError;
  FormzStatus get typesStatus => throw _privateConstructorUsedError;
  FormzStatus get tabChangingStatus => throw _privateConstructorUsedError;
  bool get typesFetchMore => throw _privateConstructorUsedError;
  int get radius => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  FormzStatus get getTypesStatus => throw _privateConstructorUsedError;
  FormzStatus get getCurrentLocationStatus =>
      throw _privateConstructorUsedError;
  double get maxZoomLevel => throw _privateConstructorUsedError;
  double get minZoomLevel => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  double get currentLat => throw _privateConstructorUsedError;
  double get currentLong => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  double get zoomLevel => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  YandexMapController? get mapController => throw _privateConstructorUsedError;
  TabController? get tabController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapOrganizationStateCopyWith<MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapOrganizationStateCopyWith<$Res> {
  factory $MapOrganizationStateCopyWith(MapOrganizationState value,
          $Res Function(MapOrganizationState) then) =
      _$MapOrganizationStateCopyWithImpl<$Res, MapOrganizationState>;
  @useResult
  $Res call(
      {List<OrgMapV2Model> hospitals,
      List<DoctorMapEntity> doctors,
      List<TypeEntity> types,
      int typesCount,
      String? typesNext,
      List<MapObject<dynamic>> mapObjects,
      FormzStatus typesStatus,
      FormzStatus tabChangingStatus,
      bool typesFetchMore,
      int radius,
      FormzStatus status,
      FormzStatus getTypesStatus,
      FormzStatus getCurrentLocationStatus,
      double maxZoomLevel,
      double minZoomLevel,
      double lat,
      double long,
      double currentLat,
      double currentLong,
      double accuracy,
      double zoomLevel,
      String searchText,
      String? next,
      bool fetchMore,
      YandexMapController? mapController,
      TabController? tabController});
}

/// @nodoc
class _$MapOrganizationStateCopyWithImpl<$Res,
        $Val extends MapOrganizationState>
    implements $MapOrganizationStateCopyWith<$Res> {
  _$MapOrganizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? doctors = null,
    Object? types = null,
    Object? typesCount = null,
    Object? typesNext = freezed,
    Object? mapObjects = null,
    Object? typesStatus = null,
    Object? tabChangingStatus = null,
    Object? typesFetchMore = null,
    Object? radius = null,
    Object? status = null,
    Object? getTypesStatus = null,
    Object? getCurrentLocationStatus = null,
    Object? maxZoomLevel = null,
    Object? minZoomLevel = null,
    Object? lat = null,
    Object? long = null,
    Object? currentLat = null,
    Object? currentLong = null,
    Object? accuracy = null,
    Object? zoomLevel = null,
    Object? searchText = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? mapController = freezed,
    Object? tabController = freezed,
  }) {
    return _then(_value.copyWith(
      hospitals: null == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<OrgMapV2Model>,
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorMapEntity>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntity>,
      typesCount: null == typesCount
          ? _value.typesCount
          : typesCount // ignore: cast_nullable_to_non_nullable
              as int,
      typesNext: freezed == typesNext
          ? _value.typesNext
          : typesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      mapObjects: null == mapObjects
          ? _value.mapObjects
          : mapObjects // ignore: cast_nullable_to_non_nullable
              as List<MapObject<dynamic>>,
      typesStatus: null == typesStatus
          ? _value.typesStatus
          : typesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      tabChangingStatus: null == tabChangingStatus
          ? _value.tabChangingStatus
          : tabChangingStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      typesFetchMore: null == typesFetchMore
          ? _value.typesFetchMore
          : typesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getTypesStatus: null == getTypesStatus
          ? _value.getTypesStatus
          : getTypesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getCurrentLocationStatus: null == getCurrentLocationStatus
          ? _value.getCurrentLocationStatus
          : getCurrentLocationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      maxZoomLevel: null == maxZoomLevel
          ? _value.maxZoomLevel
          : maxZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      minZoomLevel: null == minZoomLevel
          ? _value.minZoomLevel
          : minZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      currentLat: null == currentLat
          ? _value.currentLat
          : currentLat // ignore: cast_nullable_to_non_nullable
              as double,
      currentLong: null == currentLong
          ? _value.currentLong
          : currentLong // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      zoomLevel: null == zoomLevel
          ? _value.zoomLevel
          : zoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as YandexMapController?,
      tabController: freezed == tabController
          ? _value.tabController
          : tabController // ignore: cast_nullable_to_non_nullable
              as TabController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapOrganizationStateCopyWith<$Res>
    implements $MapOrganizationStateCopyWith<$Res> {
  factory _$$_MapOrganizationStateCopyWith(_$_MapOrganizationState value,
          $Res Function(_$_MapOrganizationState) then) =
      __$$_MapOrganizationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrgMapV2Model> hospitals,
      List<DoctorMapEntity> doctors,
      List<TypeEntity> types,
      int typesCount,
      String? typesNext,
      List<MapObject<dynamic>> mapObjects,
      FormzStatus typesStatus,
      FormzStatus tabChangingStatus,
      bool typesFetchMore,
      int radius,
      FormzStatus status,
      FormzStatus getTypesStatus,
      FormzStatus getCurrentLocationStatus,
      double maxZoomLevel,
      double minZoomLevel,
      double lat,
      double long,
      double currentLat,
      double currentLong,
      double accuracy,
      double zoomLevel,
      String searchText,
      String? next,
      bool fetchMore,
      YandexMapController? mapController,
      TabController? tabController});
}

/// @nodoc
class __$$_MapOrganizationStateCopyWithImpl<$Res>
    extends _$MapOrganizationStateCopyWithImpl<$Res, _$_MapOrganizationState>
    implements _$$_MapOrganizationStateCopyWith<$Res> {
  __$$_MapOrganizationStateCopyWithImpl(_$_MapOrganizationState _value,
      $Res Function(_$_MapOrganizationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? doctors = null,
    Object? types = null,
    Object? typesCount = null,
    Object? typesNext = freezed,
    Object? mapObjects = null,
    Object? typesStatus = null,
    Object? tabChangingStatus = null,
    Object? typesFetchMore = null,
    Object? radius = null,
    Object? status = null,
    Object? getTypesStatus = null,
    Object? getCurrentLocationStatus = null,
    Object? maxZoomLevel = null,
    Object? minZoomLevel = null,
    Object? lat = null,
    Object? long = null,
    Object? currentLat = null,
    Object? currentLong = null,
    Object? accuracy = null,
    Object? zoomLevel = null,
    Object? searchText = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? mapController = freezed,
    Object? tabController = freezed,
  }) {
    return _then(_$_MapOrganizationState(
      hospitals: null == hospitals
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<OrgMapV2Model>,
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorMapEntity>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeEntity>,
      typesCount: null == typesCount
          ? _value.typesCount
          : typesCount // ignore: cast_nullable_to_non_nullable
              as int,
      typesNext: freezed == typesNext
          ? _value.typesNext
          : typesNext // ignore: cast_nullable_to_non_nullable
              as String?,
      mapObjects: null == mapObjects
          ? _value._mapObjects
          : mapObjects // ignore: cast_nullable_to_non_nullable
              as List<MapObject<dynamic>>,
      typesStatus: null == typesStatus
          ? _value.typesStatus
          : typesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      tabChangingStatus: null == tabChangingStatus
          ? _value.tabChangingStatus
          : tabChangingStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      typesFetchMore: null == typesFetchMore
          ? _value.typesFetchMore
          : typesFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getTypesStatus: null == getTypesStatus
          ? _value.getTypesStatus
          : getTypesStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      getCurrentLocationStatus: null == getCurrentLocationStatus
          ? _value.getCurrentLocationStatus
          : getCurrentLocationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      maxZoomLevel: null == maxZoomLevel
          ? _value.maxZoomLevel
          : maxZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      minZoomLevel: null == minZoomLevel
          ? _value.minZoomLevel
          : minZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      currentLat: null == currentLat
          ? _value.currentLat
          : currentLat // ignore: cast_nullable_to_non_nullable
              as double,
      currentLong: null == currentLong
          ? _value.currentLong
          : currentLong // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      zoomLevel: null == zoomLevel
          ? _value.zoomLevel
          : zoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: null == fetchMore
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as YandexMapController?,
      tabController: freezed == tabController
          ? _value.tabController
          : tabController // ignore: cast_nullable_to_non_nullable
              as TabController?,
    ));
  }
}

/// @nodoc

class _$_MapOrganizationState implements _MapOrganizationState {
  _$_MapOrganizationState(
      {final List<OrgMapV2Model> hospitals = const [],
      final List<DoctorMapEntity> doctors = const [],
      final List<TypeEntity> types = const [],
      this.typesCount = 0,
      this.typesNext,
      final List<MapObject<dynamic>> mapObjects = const [],
      this.typesStatus = FormzStatus.pure,
      this.tabChangingStatus = FormzStatus.pure,
      this.typesFetchMore = false,
      this.radius = 0,
      this.status = FormzStatus.pure,
      this.getTypesStatus = FormzStatus.pure,
      this.getCurrentLocationStatus = FormzStatus.pure,
      this.maxZoomLevel = 0,
      this.minZoomLevel = 0,
      this.lat = 0,
      this.long = 0,
      this.currentLat = 0,
      this.currentLong = 0,
      this.accuracy = 0,
      this.zoomLevel = 0,
      this.searchText = '',
      this.next,
      this.fetchMore = false,
      this.mapController = null,
      this.tabController = null})
      : _hospitals = hospitals,
        _doctors = doctors,
        _types = types,
        _mapObjects = mapObjects;

  final List<OrgMapV2Model> _hospitals;
  @override
  @JsonKey()
  List<OrgMapV2Model> get hospitals {
    if (_hospitals is EqualUnmodifiableListView) return _hospitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  final List<DoctorMapEntity> _doctors;
  @override
  @JsonKey()
  List<DoctorMapEntity> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  final List<TypeEntity> _types;
  @override
  @JsonKey()
  List<TypeEntity> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  @JsonKey()
  final int typesCount;
  @override
  final String? typesNext;
  final List<MapObject<dynamic>> _mapObjects;
  @override
  @JsonKey()
  List<MapObject<dynamic>> get mapObjects {
    if (_mapObjects is EqualUnmodifiableListView) return _mapObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapObjects);
  }

  @override
  @JsonKey()
  final FormzStatus typesStatus;
  @override
  @JsonKey()
  final FormzStatus tabChangingStatus;
  @override
  @JsonKey()
  final bool typesFetchMore;
  @override
  @JsonKey()
  final int radius;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus getTypesStatus;
  @override
  @JsonKey()
  final FormzStatus getCurrentLocationStatus;
  @override
  @JsonKey()
  final double maxZoomLevel;
  @override
  @JsonKey()
  final double minZoomLevel;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double long;
  @override
  @JsonKey()
  final double currentLat;
  @override
  @JsonKey()
  final double currentLong;
  @override
  @JsonKey()
  final double accuracy;
  @override
  @JsonKey()
  final double zoomLevel;
  @override
  @JsonKey()
  final String searchText;
  @override
  final String? next;
  @override
  @JsonKey()
  final bool fetchMore;
  @override
  @JsonKey()
  final YandexMapController? mapController;
  @override
  @JsonKey()
  final TabController? tabController;

  @override
  String toString() {
    return 'MapOrganizationState(hospitals: $hospitals, doctors: $doctors, types: $types, typesCount: $typesCount, typesNext: $typesNext, mapObjects: $mapObjects, typesStatus: $typesStatus, tabChangingStatus: $tabChangingStatus, typesFetchMore: $typesFetchMore, radius: $radius, status: $status, getTypesStatus: $getTypesStatus, getCurrentLocationStatus: $getCurrentLocationStatus, maxZoomLevel: $maxZoomLevel, minZoomLevel: $minZoomLevel, lat: $lat, long: $long, currentLat: $currentLat, currentLong: $currentLong, accuracy: $accuracy, zoomLevel: $zoomLevel, searchText: $searchText, next: $next, fetchMore: $fetchMore, mapController: $mapController, tabController: $tabController)';
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
            (identical(other.typesCount, typesCount) ||
                other.typesCount == typesCount) &&
            (identical(other.typesNext, typesNext) ||
                other.typesNext == typesNext) &&
            const DeepCollectionEquality()
                .equals(other._mapObjects, _mapObjects) &&
            (identical(other.typesStatus, typesStatus) ||
                other.typesStatus == typesStatus) &&
            (identical(other.tabChangingStatus, tabChangingStatus) ||
                other.tabChangingStatus == tabChangingStatus) &&
            (identical(other.typesFetchMore, typesFetchMore) ||
                other.typesFetchMore == typesFetchMore) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.getTypesStatus, getTypesStatus) ||
                other.getTypesStatus == getTypesStatus) &&
            (identical(
                    other.getCurrentLocationStatus, getCurrentLocationStatus) ||
                other.getCurrentLocationStatus == getCurrentLocationStatus) &&
            (identical(other.maxZoomLevel, maxZoomLevel) ||
                other.maxZoomLevel == maxZoomLevel) &&
            (identical(other.minZoomLevel, minZoomLevel) ||
                other.minZoomLevel == minZoomLevel) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.currentLat, currentLat) ||
                other.currentLat == currentLat) &&
            (identical(other.currentLong, currentLong) ||
                other.currentLong == currentLong) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.zoomLevel, zoomLevel) ||
                other.zoomLevel == zoomLevel) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.tabController, tabController) ||
                other.tabController == tabController));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_hospitals),
        const DeepCollectionEquality().hash(_doctors),
        const DeepCollectionEquality().hash(_types),
        typesCount,
        typesNext,
        const DeepCollectionEquality().hash(_mapObjects),
        typesStatus,
        tabChangingStatus,
        typesFetchMore,
        radius,
        status,
        getTypesStatus,
        getCurrentLocationStatus,
        maxZoomLevel,
        minZoomLevel,
        lat,
        long,
        currentLat,
        currentLong,
        accuracy,
        zoomLevel,
        searchText,
        next,
        fetchMore,
        mapController,
        tabController
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      __$$_MapOrganizationStateCopyWithImpl<_$_MapOrganizationState>(
          this, _$identity);
}

abstract class _MapOrganizationState implements MapOrganizationState {
  factory _MapOrganizationState(
      {final List<OrgMapV2Model> hospitals,
      final List<DoctorMapEntity> doctors,
      final List<TypeEntity> types,
      final int typesCount,
      final String? typesNext,
      final List<MapObject<dynamic>> mapObjects,
      final FormzStatus typesStatus,
      final FormzStatus tabChangingStatus,
      final bool typesFetchMore,
      final int radius,
      final FormzStatus status,
      final FormzStatus getTypesStatus,
      final FormzStatus getCurrentLocationStatus,
      final double maxZoomLevel,
      final double minZoomLevel,
      final double lat,
      final double long,
      final double currentLat,
      final double currentLong,
      final double accuracy,
      final double zoomLevel,
      final String searchText,
      final String? next,
      final bool fetchMore,
      final YandexMapController? mapController,
      final TabController? tabController}) = _$_MapOrganizationState;

  @override
  List<OrgMapV2Model> get hospitals;
  @override
  List<DoctorMapEntity> get doctors;
  @override
  List<TypeEntity> get types;
  @override
  int get typesCount;
  @override
  String? get typesNext;
  @override
  List<MapObject<dynamic>> get mapObjects;
  @override
  FormzStatus get typesStatus;
  @override
  FormzStatus get tabChangingStatus;
  @override
  bool get typesFetchMore;
  @override
  int get radius;
  @override
  FormzStatus get status;
  @override
  FormzStatus get getTypesStatus;
  @override
  FormzStatus get getCurrentLocationStatus;
  @override
  double get maxZoomLevel;
  @override
  double get minZoomLevel;
  @override
  double get lat;
  @override
  double get long;
  @override
  double get currentLat;
  @override
  double get currentLong;
  @override
  double get accuracy;
  @override
  double get zoomLevel;
  @override
  String get searchText;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  YandexMapController? get mapController;
  @override
  TabController? get tabController;
  @override
  @JsonKey(ignore: true)
  _$$_MapOrganizationStateCopyWith<_$_MapOrganizationState> get copyWith =>
      throw _privateConstructorUsedError;
}
