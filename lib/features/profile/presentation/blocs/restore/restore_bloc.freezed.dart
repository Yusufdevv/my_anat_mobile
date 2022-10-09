// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restore_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreEventCopyWith<$Res> {
  factory $RestoreEventCopyWith(
          RestoreEvent value, $Res Function(RestoreEvent) then) =
      _$RestoreEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RestoreEventCopyWithImpl<$Res> implements $RestoreEventCopyWith<$Res> {
  _$RestoreEventCopyWithImpl(this._value, this._then);

  final RestoreEvent _value;
  // ignore: unused_field
  final $Res Function(RestoreEvent) _then;
}

/// @nodoc
abstract class _$$_SendCodeCopyWith<$Res> {
  factory _$$_SendCodeCopyWith(
          _$_SendCode value, $Res Function(_$_SendCode) then) =
      __$$_SendCodeCopyWithImpl<$Res>;
  $Res call({String phone, VoidCallback onSuccess});
}

/// @nodoc
class __$$_SendCodeCopyWithImpl<$Res> extends _$RestoreEventCopyWithImpl<$Res>
    implements _$$_SendCodeCopyWith<$Res> {
  __$$_SendCodeCopyWithImpl(
      _$_SendCode _value, $Res Function(_$_SendCode) _then)
      : super(_value, (v) => _then(v as _$_SendCode));

  @override
  _$_SendCode get _value => super._value as _$_SendCode;

  @override
  $Res call({
    Object? phone = freezed,
    Object? onSuccess = freezed,
  }) {
    return _then(_$_SendCode(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: onSuccess == freezed
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_SendCode implements _SendCode {
  _$_SendCode({required this.phone, required this.onSuccess});

  @override
  final String phone;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'RestoreEvent.sendCode(phone: $phone, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCode &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phone), onSuccess);

  @JsonKey(ignore: true)
  @override
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      __$$_SendCodeCopyWithImpl<_$_SendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) {
    return sendCode(phone, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) {
    return sendCode?.call(phone, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(phone, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements RestoreEvent {
  factory _SendCode(
      {required final String phone,
      required final VoidCallback onSuccess}) = _$_SendCode;

  String get phone;
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResendCodeCopyWith<$Res> {
  factory _$$_ResendCodeCopyWith(
          _$_ResendCode value, $Res Function(_$_ResendCode) then) =
      __$$_ResendCodeCopyWithImpl<$Res>;
  $Res call({VoidCallback onSuccess});
}

/// @nodoc
class __$$_ResendCodeCopyWithImpl<$Res> extends _$RestoreEventCopyWithImpl<$Res>
    implements _$$_ResendCodeCopyWith<$Res> {
  __$$_ResendCodeCopyWithImpl(
      _$_ResendCode _value, $Res Function(_$_ResendCode) _then)
      : super(_value, (v) => _then(v as _$_ResendCode));

  @override
  _$_ResendCode get _value => super._value as _$_ResendCode;

  @override
  $Res call({
    Object? onSuccess = freezed,
  }) {
    return _then(_$_ResendCode(
      onSuccess: onSuccess == freezed
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_ResendCode implements _ResendCode {
  _$_ResendCode({required this.onSuccess});

  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'RestoreEvent.resendCode(onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResendCode &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSuccess);

  @JsonKey(ignore: true)
  @override
  _$$_ResendCodeCopyWith<_$_ResendCode> get copyWith =>
      __$$_ResendCodeCopyWithImpl<_$_ResendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) {
    return resendCode(onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) {
    return resendCode?.call(onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) {
    return resendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) {
    return resendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(this);
    }
    return orElse();
  }
}

abstract class _ResendCode implements RestoreEvent {
  factory _ResendCode({required final VoidCallback onSuccess}) = _$_ResendCode;

  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_ResendCodeCopyWith<_$_ResendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyCodeCopyWith<$Res> {
  factory _$$_VerifyCodeCopyWith(
          _$_VerifyCode value, $Res Function(_$_VerifyCode) then) =
      __$$_VerifyCodeCopyWithImpl<$Res>;
  $Res call(
      {String code,
      dynamic Function(String) onSuccess,
      dynamic Function(String) onError});
}

/// @nodoc
class __$$_VerifyCodeCopyWithImpl<$Res> extends _$RestoreEventCopyWithImpl<$Res>
    implements _$$_VerifyCodeCopyWith<$Res> {
  __$$_VerifyCodeCopyWithImpl(
      _$_VerifyCode _value, $Res Function(_$_VerifyCode) _then)
      : super(_value, (v) => _then(v as _$_VerifyCode));

  @override
  _$_VerifyCode get _value => super._value as _$_VerifyCode;

  @override
  $Res call({
    Object? code = freezed,
    Object? onSuccess = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$_VerifyCode(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: onSuccess == freezed
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
      onError: onError == freezed
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
    ));
  }
}

/// @nodoc

class _$_VerifyCode implements _VerifyCode {
  _$_VerifyCode(
      {required this.code, required this.onSuccess, required this.onError});

  @override
  final String code;
  @override
  final dynamic Function(String) onSuccess;
  @override
  final dynamic Function(String) onError;

  @override
  String toString() {
    return 'RestoreEvent.verifyCode(code: $code, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyCode &&
            const DeepCollectionEquality().equals(other.code, code) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(code), onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      __$$_VerifyCodeCopyWithImpl<_$_VerifyCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) {
    return verifyCode(code, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) {
    return verifyCode?.call(code, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(code, onSuccess, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VerifyCode implements RestoreEvent {
  factory _VerifyCode(
      {required final String code,
      required final dynamic Function(String) onSuccess,
      required final dynamic Function(String) onError}) = _$_VerifyCode;

  String get code;
  dynamic Function(String) get onSuccess;
  dynamic Function(String) get onError;
  @JsonKey(ignore: true)
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendRestoreCopyWith<$Res> {
  factory _$$_SendRestoreCopyWith(
          _$_SendRestore value, $Res Function(_$_SendRestore) then) =
      __$$_SendRestoreCopyWithImpl<$Res>;
  $Res call({bool isJournal, VoidCallback onSuccess, String signature});
}

/// @nodoc
class __$$_SendRestoreCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res>
    implements _$$_SendRestoreCopyWith<$Res> {
  __$$_SendRestoreCopyWithImpl(
      _$_SendRestore _value, $Res Function(_$_SendRestore) _then)
      : super(_value, (v) => _then(v as _$_SendRestore));

  @override
  _$_SendRestore get _value => super._value as _$_SendRestore;

  @override
  $Res call({
    Object? isJournal = freezed,
    Object? onSuccess = freezed,
    Object? signature = freezed,
  }) {
    return _then(_$_SendRestore(
      isJournal: isJournal == freezed
          ? _value.isJournal
          : isJournal // ignore: cast_nullable_to_non_nullable
              as bool,
      onSuccess: onSuccess == freezed
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendRestore implements _SendRestore {
  _$_SendRestore(
      {required this.isJournal,
      required this.onSuccess,
      required this.signature});

  @override
  final bool isJournal;
  @override
  final VoidCallback onSuccess;
  @override
  final String signature;

  @override
  String toString() {
    return 'RestoreEvent.sendRestore(isJournal: $isJournal, onSuccess: $onSuccess, signature: $signature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendRestore &&
            const DeepCollectionEquality().equals(other.isJournal, isJournal) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            const DeepCollectionEquality().equals(other.signature, signature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isJournal),
      onSuccess,
      const DeepCollectionEquality().hash(signature));

  @JsonKey(ignore: true)
  @override
  _$$_SendRestoreCopyWith<_$_SendRestore> get copyWith =>
      __$$_SendRestoreCopyWithImpl<_$_SendRestore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) {
    return sendRestore(isJournal, onSuccess, signature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) {
    return sendRestore?.call(isJournal, onSuccess, signature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (sendRestore != null) {
      return sendRestore(isJournal, onSuccess, signature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) {
    return sendRestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) {
    return sendRestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (sendRestore != null) {
      return sendRestore(this);
    }
    return orElse();
  }
}

abstract class _SendRestore implements RestoreEvent {
  factory _SendRestore(
      {required final bool isJournal,
      required final VoidCallback onSuccess,
      required final String signature}) = _$_SendRestore;

  bool get isJournal;
  VoidCallback get onSuccess;
  String get signature;
  @JsonKey(ignore: true)
  _$$_SendRestoreCopyWith<_$_SendRestore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCopyWith<$Res> {
  factory _$$_ClearCopyWith(_$_Clear value, $Res Function(_$_Clear) then) =
      __$$_ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCopyWithImpl<$Res> extends _$RestoreEventCopyWithImpl<$Res>
    implements _$$_ClearCopyWith<$Res> {
  __$$_ClearCopyWithImpl(_$_Clear _value, $Res Function(_$_Clear) _then)
      : super(_value, (v) => _then(v as _$_Clear));

  @override
  _$_Clear get _value => super._value as _$_Clear;
}

/// @nodoc

class _$_Clear implements _Clear {
  _$_Clear();

  @override
  String toString() {
    return 'RestoreEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, VoidCallback onSuccess) sendCode,
    required TResult Function(VoidCallback onSuccess) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, VoidCallback onSuccess)? sendCode,
    TResult Function(VoidCallback onSuccess)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_SendRestore value) sendRestore,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements RestoreEvent {
  factory _Clear() = _$_Clear;
}

/// @nodoc
mixin _$RestoreState {
  FormzStatus get sendCodeStatus => throw _privateConstructorUsedError;
  FormzStatus get verifyStatus => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get verifyError => throw _privateConstructorUsedError;
  bool? get showRestore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestoreStateCopyWith<RestoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreStateCopyWith<$Res> {
  factory $RestoreStateCopyWith(
          RestoreState value, $Res Function(RestoreState) then) =
      _$RestoreStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus sendCodeStatus,
      FormzStatus verifyStatus,
      String signature,
      String phone,
      String verifyError,
      bool? showRestore});
}

/// @nodoc
class _$RestoreStateCopyWithImpl<$Res> implements $RestoreStateCopyWith<$Res> {
  _$RestoreStateCopyWithImpl(this._value, this._then);

  final RestoreState _value;
  // ignore: unused_field
  final $Res Function(RestoreState) _then;

  @override
  $Res call({
    Object? sendCodeStatus = freezed,
    Object? verifyStatus = freezed,
    Object? signature = freezed,
    Object? phone = freezed,
    Object? verifyError = freezed,
    Object? showRestore = freezed,
  }) {
    return _then(_value.copyWith(
      sendCodeStatus: sendCodeStatus == freezed
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: verifyStatus == freezed
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyError: verifyError == freezed
          ? _value.verifyError
          : verifyError // ignore: cast_nullable_to_non_nullable
              as String,
      showRestore: showRestore == freezed
          ? _value.showRestore
          : showRestore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_RestoreStateCopyWith<$Res>
    implements $RestoreStateCopyWith<$Res> {
  factory _$$_RestoreStateCopyWith(
          _$_RestoreState value, $Res Function(_$_RestoreState) then) =
      __$$_RestoreStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus sendCodeStatus,
      FormzStatus verifyStatus,
      String signature,
      String phone,
      String verifyError,
      bool? showRestore});
}

/// @nodoc
class __$$_RestoreStateCopyWithImpl<$Res>
    extends _$RestoreStateCopyWithImpl<$Res>
    implements _$$_RestoreStateCopyWith<$Res> {
  __$$_RestoreStateCopyWithImpl(
      _$_RestoreState _value, $Res Function(_$_RestoreState) _then)
      : super(_value, (v) => _then(v as _$_RestoreState));

  @override
  _$_RestoreState get _value => super._value as _$_RestoreState;

  @override
  $Res call({
    Object? sendCodeStatus = freezed,
    Object? verifyStatus = freezed,
    Object? signature = freezed,
    Object? phone = freezed,
    Object? verifyError = freezed,
    Object? showRestore = freezed,
  }) {
    return _then(_$_RestoreState(
      sendCodeStatus: sendCodeStatus == freezed
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: verifyStatus == freezed
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyError: verifyError == freezed
          ? _value.verifyError
          : verifyError // ignore: cast_nullable_to_non_nullable
              as String,
      showRestore: showRestore == freezed
          ? _value.showRestore
          : showRestore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_RestoreState implements _RestoreState {
  _$_RestoreState(
      {this.sendCodeStatus = FormzStatus.pure,
      this.verifyStatus = FormzStatus.pure,
      this.signature = '',
      this.phone = '',
      this.verifyError = '',
      this.showRestore});

  @override
  @JsonKey()
  final FormzStatus sendCodeStatus;
  @override
  @JsonKey()
  final FormzStatus verifyStatus;
  @override
  @JsonKey()
  final String signature;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String verifyError;
  @override
  final bool? showRestore;

  @override
  String toString() {
    return 'RestoreState(sendCodeStatus: $sendCodeStatus, verifyStatus: $verifyStatus, signature: $signature, phone: $phone, verifyError: $verifyError, showRestore: $showRestore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoreState &&
            const DeepCollectionEquality()
                .equals(other.sendCodeStatus, sendCodeStatus) &&
            const DeepCollectionEquality()
                .equals(other.verifyStatus, verifyStatus) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.verifyError, verifyError) &&
            const DeepCollectionEquality()
                .equals(other.showRestore, showRestore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sendCodeStatus),
      const DeepCollectionEquality().hash(verifyStatus),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(verifyError),
      const DeepCollectionEquality().hash(showRestore));

  @JsonKey(ignore: true)
  @override
  _$$_RestoreStateCopyWith<_$_RestoreState> get copyWith =>
      __$$_RestoreStateCopyWithImpl<_$_RestoreState>(this, _$identity);
}

abstract class _RestoreState implements RestoreState {
  factory _RestoreState(
      {final FormzStatus sendCodeStatus,
      final FormzStatus verifyStatus,
      final String signature,
      final String phone,
      final String verifyError,
      final bool? showRestore}) = _$_RestoreState;

  @override
  FormzStatus get sendCodeStatus;
  @override
  FormzStatus get verifyStatus;
  @override
  String get signature;
  @override
  String get phone;
  @override
  String get verifyError;
  @override
  bool? get showRestore;
  @override
  @JsonKey(ignore: true)
  _$$_RestoreStateCopyWith<_$_RestoreState> get copyWith =>
      throw _privateConstructorUsedError;
}