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
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
    required TResult Function(int serviceId) getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getServices,
    TResult? Function()? getMoreServices,
    TResult? Function(String query)? searchServices,
    TResult? Function(int serviceId)? getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
    required TResult Function(_GetSingleService value) getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServices value)? getServices,
    TResult? Function(_GetMoreServices value)? getMoreServices,
    TResult? Function(_SearchServices value)? searchServices,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
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
abstract class _$$_GetServicesCopyWith<$Res> {
  factory _$$_GetServicesCopyWith(
          _$_GetServices value, $Res Function(_$_GetServices) then) =
      __$$_GetServicesCopyWithImpl<$Res>;
  @useResult
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetServicesCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetServices>
    implements _$$_GetServicesCopyWith<$Res> {
  __$$_GetServicesCopyWithImpl(
      _$_GetServices _value, $Res Function(_$_GetServices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
  }) {
    return _then(_$_GetServices(
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetServices with DiagnosticableTreeMixin implements _GetServices {
  _$_GetServices({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getServices(organizationId: $organizationId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.getServices'))
      ..add(DiagnosticsProperty('organizationId', organizationId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetServices &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetServicesCopyWith<_$_GetServices> get copyWith =>
      __$$_GetServicesCopyWithImpl<_$_GetServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getServices(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getServices,
    TResult? Function()? getMoreServices,
    TResult? Function(String query)? searchServices,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getServices?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServices != null) {
      return getServices(organizationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServices value)? getServices,
    TResult? Function(_GetMoreServices value)? getMoreServices,
    TResult? Function(_SearchServices value)? searchServices,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getServices != null) {
      return getServices(this);
    }
    return orElse();
  }
}

abstract class _GetServices implements ServicesEvent {
  factory _GetServices({required final int organizationId}) = _$_GetServices;

  int get organizationId;
  @JsonKey(ignore: true)
  _$$_GetServicesCopyWith<_$_GetServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreServicesCopyWith<$Res> {
  factory _$$_GetMoreServicesCopyWith(
          _$_GetMoreServices value, $Res Function(_$_GetMoreServices) then) =
      __$$_GetMoreServicesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetMoreServicesCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_GetMoreServices>
    implements _$$_GetMoreServicesCopyWith<$Res> {
  __$$_GetMoreServicesCopyWithImpl(
      _$_GetMoreServices _value, $Res Function(_$_GetMoreServices) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetMoreServices
    with DiagnosticableTreeMixin
    implements _GetMoreServices {
  _$_GetMoreServices();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.getMoreServices()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ServicesEvent.getMoreServices'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetMoreServices);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getMoreServices();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getServices,
    TResult? Function()? getMoreServices,
    TResult? Function(String query)? searchServices,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getMoreServices?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServices != null) {
      return getMoreServices();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getMoreServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServices value)? getServices,
    TResult? Function(_GetMoreServices value)? getMoreServices,
    TResult? Function(_SearchServices value)? searchServices,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getMoreServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (getMoreServices != null) {
      return getMoreServices(this);
    }
    return orElse();
  }
}

abstract class _GetMoreServices implements ServicesEvent {
  factory _GetMoreServices() = _$_GetMoreServices;
}

/// @nodoc
abstract class _$$_SearchServicesCopyWith<$Res> {
  factory _$$_SearchServicesCopyWith(
          _$_SearchServices value, $Res Function(_$_SearchServices) then) =
      __$$_SearchServicesCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchServicesCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$_SearchServices>
    implements _$$_SearchServicesCopyWith<$Res> {
  __$$_SearchServicesCopyWithImpl(
      _$_SearchServices _value, $Res Function(_$_SearchServices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchServices(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchServices
    with DiagnosticableTreeMixin
    implements _SearchServices {
  _$_SearchServices({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicesEvent.searchServices(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesEvent.searchServices'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchServices &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchServicesCopyWith<_$_SearchServices> get copyWith =>
      __$$_SearchServicesCopyWithImpl<_$_SearchServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return searchServices(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getServices,
    TResult? Function()? getMoreServices,
    TResult? Function(String query)? searchServices,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return searchServices?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
    TResult Function(int serviceId)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServices != null) {
      return searchServices(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return searchServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServices value)? getServices,
    TResult? Function(_GetMoreServices value)? getMoreServices,
    TResult? Function(_SearchServices value)? searchServices,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return searchServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
    TResult Function(_GetSingleService value)? getSingleService,
    required TResult orElse(),
  }) {
    if (searchServices != null) {
      return searchServices(this);
    }
    return orElse();
  }
}

abstract class _SearchServices implements ServicesEvent {
  factory _SearchServices({required final String query}) = _$_SearchServices;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchServicesCopyWith<_$_SearchServices> get copyWith =>
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
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
    required TResult Function(int serviceId) getSingleService,
  }) {
    return getSingleService(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int organizationId)? getServices,
    TResult? Function()? getMoreServices,
    TResult? Function(String query)? searchServices,
    TResult? Function(int serviceId)? getSingleService,
  }) {
    return getSingleService?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
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
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
    required TResult Function(_GetSingleService value) getSingleService,
  }) {
    return getSingleService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetServices value)? getServices,
    TResult? Function(_GetMoreServices value)? getMoreServices,
    TResult? Function(_SearchServices value)? searchServices,
    TResult? Function(_GetSingleService value)? getSingleService,
  }) {
    return getSingleService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
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
  List<HospitalServiceEntity> get services =>
      throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  bool get fetchMore => throw _privateConstructorUsedError;
  int get hospitalId => throw _privateConstructorUsedError;
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
      List<HospitalServiceEntity> services,
      String? next,
      bool fetchMore,
      int hospitalId,
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
    Object? services = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? hospitalId = null,
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
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
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
      List<HospitalServiceEntity> services,
      String? next,
      bool fetchMore,
      int hospitalId,
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
    Object? services = null,
    Object? next = freezed,
    Object? fetchMore = null,
    Object? hospitalId = null,
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
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
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
      final List<HospitalServiceEntity> services = const [],
      this.next,
      this.fetchMore = false,
      this.hospitalId = 0,
      this.searchQuery = '',
      this.serviceCount = 0,
      this.getSingleServiceStatus = FormzStatus.pure,
      this.serviceSingle = const HospitalServiceSingleEntity()})
      : _services = services;

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final FormzStatus paginationStatus;
  final List<HospitalServiceEntity> _services;
  @override
  @JsonKey()
  List<HospitalServiceEntity> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
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
    return 'ServicesState(status: $status, paginationStatus: $paginationStatus, services: $services, next: $next, fetchMore: $fetchMore, hospitalId: $hospitalId, searchQuery: $searchQuery, serviceCount: $serviceCount, getSingleServiceStatus: $getSingleServiceStatus, serviceSingle: $serviceSingle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicesState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('paginationStatus', paginationStatus))
      ..add(DiagnosticsProperty('services', services))
      ..add(DiagnosticsProperty('next', next))
      ..add(DiagnosticsProperty('fetchMore', fetchMore))
      ..add(DiagnosticsProperty('hospitalId', hospitalId))
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
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.fetchMore, fetchMore) ||
                other.fetchMore == fetchMore) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
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
      const DeepCollectionEquality().hash(_services),
      next,
      fetchMore,
      hospitalId,
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
      final List<HospitalServiceEntity> services,
      final String? next,
      final bool fetchMore,
      final int hospitalId,
      final String searchQuery,
      final int serviceCount,
      final FormzStatus getSingleServiceStatus,
      final HospitalServiceSingleEntity serviceSingle}) = _$_ServicesState;

  @override
  FormzStatus get status;
  @override
  FormzStatus get paginationStatus;
  @override
  List<HospitalServiceEntity> get services;
  @override
  String? get next;
  @override
  bool get fetchMore;
  @override
  int get hospitalId;
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
