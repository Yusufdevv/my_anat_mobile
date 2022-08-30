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
    required TResult Function() getComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getComments,
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
}

/// @nodoc

class _$_GetServices implements _GetServices {
  _$_GetServices();

  @override
  String toString() {
    return 'ServicesEvent.getComments()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetServices);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getComments,
  }) {
    return getComments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getComments,
  }) {
    return getComments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getComments,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetServices value) getComments,
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetServices value)? getComments,
  }) {
    return getComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetServices value)? getComments,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(this);
    }
    return orElse();
  }
}

abstract class _GetServices implements ServicesEvent {
  factory _GetServices() = _$_GetServices;
}

/// @nodoc
mixin _$ServicesState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<SingleServiceModel> get services => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

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
      List<SingleServiceModel> services,
      String next,
      int count});
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
    Object? services = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<SingleServiceModel>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
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
      List<SingleServiceModel> services,
      String next,
      int count});
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
    Object? services = freezed,
    Object? next = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_ServicesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      services: services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<SingleServiceModel>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ServicesState implements _ServicesState {
  _$_ServicesState(
      {this.status = FormzStatus.pure,
      final List<SingleServiceModel> services = const [],
      this.next = '',
      this.count = 0})
      : _services = services;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<SingleServiceModel> _services;
  @override
  @JsonKey()
  List<SingleServiceModel> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  @JsonKey()
  final String next;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'ServicesState(status: $status, services: $services, next: $next, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      __$$_ServicesStateCopyWithImpl<_$_ServicesState>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  factory _ServicesState(
      {final FormzStatus status,
      final List<SingleServiceModel> services,
      final String next,
      final int count}) = _$_ServicesState;

  @override
  FormzStatus get status;
  @override
  List<SingleServiceModel> get services;
  @override
  String get next;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
