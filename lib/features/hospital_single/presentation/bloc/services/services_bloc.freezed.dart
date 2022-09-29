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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getServices,
    required TResult Function(_GetMoreServices value) getMoreServices,
    required TResult Function(_SearchServices value) searchServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesEventCopyWith<$Res> {
  factory $ServicesEventCopyWith(
          ServicesEvent value, $Res Function(ServicesEvent) then) =
      _$ServicesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServicesEventCopyWithImpl<$Res>
    implements $ServicesEventCopyWith<$Res> {
  _$ServicesEventCopyWithImpl(this._value, this._then);

  final ServicesEvent _value;
  // ignore: unused_field
  final $Res Function(ServicesEvent) _then;
}

/// @nodoc
abstract class _$$_GetServicesCopyWith<$Res> {
  factory _$$_GetServicesCopyWith(
          _$_GetServices value, $Res Function(_$_GetServices) then) =
      __$$_GetServicesCopyWithImpl<$Res>;
  $Res call({int organizationId});
}

/// @nodoc
class __$$_GetServicesCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res>
    implements _$$_GetServicesCopyWith<$Res> {
  __$$_GetServicesCopyWithImpl(
      _$_GetServices _value, $Res Function(_$_GetServices) _then)
      : super(_value, (v) => _then(v as _$_GetServices));

  @override
  _$_GetServices get _value => super._value as _$_GetServices;

  @override
  $Res call({
    Object? organizationId = freezed,
  }) {
    return _then(_$_GetServices(
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetServices implements _GetServices {
  _$_GetServices({required this.organizationId});

  @override
  final int organizationId;

  @override
  String toString() {
    return 'ServicesEvent.getServices(organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetServices &&
            const DeepCollectionEquality()
                .equals(other.organizationId, organizationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(organizationId));

  @JsonKey(ignore: true)
  @override
  _$$_GetServicesCopyWith<_$_GetServices> get copyWith =>
      __$$_GetServicesCopyWithImpl<_$_GetServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
  }) {
    return getServices(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
  }) {
    return getServices?.call(organizationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
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
  }) {
    return getServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
  }) {
    return getServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
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
    extends _$ServicesEventCopyWithImpl<$Res>
    implements _$$_GetMoreServicesCopyWith<$Res> {
  __$$_GetMoreServicesCopyWithImpl(
      _$_GetMoreServices _value, $Res Function(_$_GetMoreServices) _then)
      : super(_value, (v) => _then(v as _$_GetMoreServices));

  @override
  _$_GetMoreServices get _value => super._value as _$_GetMoreServices;
}

/// @nodoc

class _$_GetMoreServices implements _GetMoreServices {
  _$_GetMoreServices();

  @override
  String toString() {
    return 'ServicesEvent.getMoreServices()';
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
  }) {
    return getMoreServices();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
  }) {
    return getMoreServices?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
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
  }) {
    return getMoreServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
  }) {
    return getMoreServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
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
  $Res call({String query});
}

/// @nodoc
class __$$_SearchServicesCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res>
    implements _$$_SearchServicesCopyWith<$Res> {
  __$$_SearchServicesCopyWithImpl(
      _$_SearchServices _value, $Res Function(_$_SearchServices) _then)
      : super(_value, (v) => _then(v as _$_SearchServices));

  @override
  _$_SearchServices get _value => super._value as _$_SearchServices;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$_SearchServices(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchServices implements _SearchServices {
  _$_SearchServices({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ServicesEvent.searchServices(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchServices &&
            const DeepCollectionEquality().equals(other.query, query));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(query));

  @JsonKey(ignore: true)
  @override
  _$$_SearchServicesCopyWith<_$_SearchServices> get copyWith =>
      __$$_SearchServicesCopyWithImpl<_$_SearchServices>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int organizationId) getServices,
    required TResult Function() getMoreServices,
    required TResult Function(String query) searchServices,
  }) {
    return searchServices(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
  }) {
    return searchServices?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int organizationId)? getServices,
    TResult Function()? getMoreServices,
    TResult Function(String query)? searchServices,
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
  }) {
    return searchServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
  }) {
    return searchServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getServices,
    TResult Function(_GetMoreServices value)? getMoreServices,
    TResult Function(_SearchServices value)? searchServices,
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

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<HospitalServiceEntity> services,
      String? next,
      bool fetchMore,
      int hospitalId,
      String searchQuery,
      int serviceCount});
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  final ServicesState _value;
  // ignore: unused_field
  final $Res Function(ServicesState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? services = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? hospitalId = freezed,
    Object? searchQuery = freezed,
    Object? serviceCount = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: searchQuery == freezed
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCount: serviceCount == freezed
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$_ServicesStateCopyWith(
          _$_ServicesState value, $Res Function(_$_ServicesState) then) =
      __$$_ServicesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      FormzStatus paginationStatus,
      List<HospitalServiceEntity> services,
      String? next,
      bool fetchMore,
      int hospitalId,
      String searchQuery,
      int serviceCount});
}

/// @nodoc
class __$$_ServicesStateCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res>
    implements _$$_ServicesStateCopyWith<$Res> {
  __$$_ServicesStateCopyWithImpl(
      _$_ServicesState _value, $Res Function(_$_ServicesState) _then)
      : super(_value, (v) => _then(v as _$_ServicesState));

  @override
  _$_ServicesState get _value => super._value as _$_ServicesState;

  @override
  $Res call({
    Object? status = freezed,
    Object? paginationStatus = freezed,
    Object? services = freezed,
    Object? next = freezed,
    Object? fetchMore = freezed,
    Object? hospitalId = freezed,
    Object? searchQuery = freezed,
    Object? serviceCount = freezed,
  }) {
    return _then(_$_ServicesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      paginationStatus: paginationStatus == freezed
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      services: services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<HospitalServiceEntity>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchMore: fetchMore == freezed
          ? _value.fetchMore
          : fetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: searchQuery == freezed
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCount: serviceCount == freezed
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ServicesState implements _ServicesState {
  _$_ServicesState(
      {this.status = FormzStatus.pure,
      this.paginationStatus = FormzStatus.pure,
      final List<HospitalServiceEntity> services = const [],
      this.next,
      this.fetchMore = false,
      this.hospitalId = 0,
      this.searchQuery = '',
      this.serviceCount = 0})
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
  String toString() {
    return 'ServicesState(status: $status, paginationStatus: $paginationStatus, services: $services, next: $next, fetchMore: $fetchMore, hospitalId: $hospitalId, searchQuery: $searchQuery, serviceCount: $serviceCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paginationStatus, paginationStatus) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.fetchMore, fetchMore) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality()
                .equals(other.searchQuery, searchQuery) &&
            const DeepCollectionEquality()
                .equals(other.serviceCount, serviceCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paginationStatus),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(fetchMore),
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(searchQuery),
      const DeepCollectionEquality().hash(serviceCount));

  @JsonKey(ignore: true)
  @override
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
      final int serviceCount}) = _$_ServicesState;

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
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
