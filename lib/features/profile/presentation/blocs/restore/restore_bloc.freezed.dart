// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreEventCopyWith<$Res> {
  factory $RestoreEventCopyWith(
          RestoreEvent value, $Res Function(RestoreEvent) then) =
      _$RestoreEventCopyWithImpl<$Res, RestoreEvent>;
}

/// @nodoc
class _$RestoreEventCopyWithImpl<$Res, $Val extends RestoreEvent>
    implements $RestoreEventCopyWith<$Res> {
  _$RestoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendCodeCopyWith<$Res> {
  factory _$$_SendCodeCopyWith(
          _$_SendCode value, $Res Function(_$_SendCode) then) =
      __$$_SendCodeCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String phone, VoidCallback onSuccess, ValueChanged<String> onError});
}

/// @nodoc
class __$$_SendCodeCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_SendCode>
    implements _$$_SendCodeCopyWith<$Res> {
  __$$_SendCodeCopyWithImpl(
      _$_SendCode _value, $Res Function(_$_SendCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? onSuccess = null,
    Object? onError = null,
  }) {
    return _then(_$_SendCode(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ValueChanged<String>,
    ));
  }
}

/// @nodoc

class _$_SendCode implements _SendCode {
  _$_SendCode(
      {required this.phone, required this.onSuccess, required this.onError});

  @override
  final String phone;
  @override
  final VoidCallback onSuccess;
  @override
  final ValueChanged<String> onError;

  @override
  String toString() {
    return 'RestoreEvent.sendCode(phone: $phone, onSuccess: $onSuccess, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCode &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      __$$_SendCodeCopyWithImpl<_$_SendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return sendCode(phone, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return sendCode?.call(phone, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(phone, onSuccess, onError);
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
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
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
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
      required final VoidCallback onSuccess,
      required final ValueChanged<String> onError}) = _$_SendCode;

  String get phone;
  VoidCallback get onSuccess;
  ValueChanged<String> get onError;
  @JsonKey(ignore: true)
  _$$_SendCodeCopyWith<_$_SendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResendCodeCopyWith<$Res> {
  factory _$$_ResendCodeCopyWith(
          _$_ResendCode value, $Res Function(_$_ResendCode) then) =
      __$$_ResendCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({VoidCallback onSuccess, String? phone});
}

/// @nodoc
class __$$_ResendCodeCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_ResendCode>
    implements _$$_ResendCodeCopyWith<$Res> {
  __$$_ResendCodeCopyWithImpl(
      _$_ResendCode _value, $Res Function(_$_ResendCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSuccess = null,
    Object? phone = freezed,
  }) {
    return _then(_$_ResendCode(
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ResendCode implements _ResendCode {
  _$_ResendCode({required this.onSuccess, this.phone});

  @override
  final VoidCallback onSuccess;
  @override
  final String? phone;

  @override
  String toString() {
    return 'RestoreEvent.resendCode(onSuccess: $onSuccess, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResendCode &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSuccess, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResendCodeCopyWith<_$_ResendCode> get copyWith =>
      __$$_ResendCodeCopyWithImpl<_$_ResendCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return resendCode(onSuccess, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return resendCode?.call(onSuccess, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(onSuccess, phone);
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return resendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
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
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
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
  factory _ResendCode(
      {required final VoidCallback onSuccess,
      final String? phone}) = _$_ResendCode;

  VoidCallback get onSuccess;
  String? get phone;
  @JsonKey(ignore: true)
  _$$_ResendCodeCopyWith<_$_ResendCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyCodeCopyWith<$Res> {
  factory _$$_VerifyCodeCopyWith(
          _$_VerifyCode value, $Res Function(_$_VerifyCode) then) =
      __$$_VerifyCodeCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String code,
      dynamic Function(String) onSuccess,
      dynamic Function(String) onError});
}

/// @nodoc
class __$$_VerifyCodeCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_VerifyCode>
    implements _$$_VerifyCodeCopyWith<$Res> {
  __$$_VerifyCodeCopyWithImpl(
      _$_VerifyCode _value, $Res Function(_$_VerifyCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? onSuccess = null,
    Object? onError = null,
  }) {
    return _then(_$_VerifyCode(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic Function(String),
      onError: null == onError
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
            (identical(other.code, code) || other.code == code) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, onSuccess, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyCodeCopyWith<_$_VerifyCode> get copyWith =>
      __$$_VerifyCodeCopyWithImpl<_$_VerifyCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return verifyCode(code, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return verifyCode?.call(code, onSuccess, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
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
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
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
  @useResult
  $Res call({bool isJournal, VoidCallback onSuccess, String signature});
}

/// @nodoc
class __$$_SendRestoreCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_SendRestore>
    implements _$$_SendRestoreCopyWith<$Res> {
  __$$_SendRestoreCopyWithImpl(
      _$_SendRestore _value, $Res Function(_$_SendRestore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isJournal = null,
    Object? onSuccess = null,
    Object? signature = null,
  }) {
    return _then(_$_SendRestore(
      isJournal: null == isJournal
          ? _value.isJournal
          : isJournal // ignore: cast_nullable_to_non_nullable
              as bool,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      signature: null == signature
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
            (identical(other.isJournal, isJournal) ||
                other.isJournal == isJournal) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isJournal, onSuccess, signature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendRestoreCopyWith<_$_SendRestore> get copyWith =>
      __$$_SendRestoreCopyWithImpl<_$_SendRestore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return sendRestore(isJournal, onSuccess, signature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return sendRestore?.call(isJournal, onSuccess, signature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return sendRestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
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
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
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
abstract class _$$_GetMyPayHistoryCopyWith<$Res> {
  factory _$$_GetMyPayHistoryCopyWith(
          _$_GetMyPayHistory value, $Res Function(_$_GetMyPayHistory) then) =
      __$$_GetMyPayHistoryCopyWithImpl<$Res>;
  @useResult
  $Res call({MyPaymentsParams? params});
}

/// @nodoc
class __$$_GetMyPayHistoryCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_GetMyPayHistory>
    implements _$$_GetMyPayHistoryCopyWith<$Res> {
  __$$_GetMyPayHistoryCopyWithImpl(
      _$_GetMyPayHistory _value, $Res Function(_$_GetMyPayHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$_GetMyPayHistory(
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MyPaymentsParams?,
    ));
  }
}

/// @nodoc

class _$_GetMyPayHistory implements _GetMyPayHistory {
  _$_GetMyPayHistory({this.params});

  @override
  final MyPaymentsParams? params;

  @override
  String toString() {
    return 'RestoreEvent.getMyPayHistory(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMyPayHistory &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMyPayHistoryCopyWith<_$_GetMyPayHistory> get copyWith =>
      __$$_GetMyPayHistoryCopyWithImpl<_$_GetMyPayHistory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return getMyPayHistory(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return getMyPayHistory?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (getMyPayHistory != null) {
      return getMyPayHistory(params);
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return getMyPayHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
  }) {
    return getMyPayHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (getMyPayHistory != null) {
      return getMyPayHistory(this);
    }
    return orElse();
  }
}

abstract class _GetMyPayHistory implements RestoreEvent {
  factory _GetMyPayHistory({final MyPaymentsParams? params}) =
      _$_GetMyPayHistory;

  MyPaymentsParams? get params;
  @JsonKey(ignore: true)
  _$$_GetMyPayHistoryCopyWith<_$_GetMyPayHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMoreMyPayHistoryCopyWith<$Res> {
  factory _$$_GetMoreMyPayHistoryCopyWith(_$_GetMoreMyPayHistory value,
          $Res Function(_$_GetMoreMyPayHistory) then) =
      __$$_GetMoreMyPayHistoryCopyWithImpl<$Res>;
  @useResult
  $Res call({MyPaymentsParams? params});
}

/// @nodoc
class __$$_GetMoreMyPayHistoryCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_GetMoreMyPayHistory>
    implements _$$_GetMoreMyPayHistoryCopyWith<$Res> {
  __$$_GetMoreMyPayHistoryCopyWithImpl(_$_GetMoreMyPayHistory _value,
      $Res Function(_$_GetMoreMyPayHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$_GetMoreMyPayHistory(
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MyPaymentsParams?,
    ));
  }
}

/// @nodoc

class _$_GetMoreMyPayHistory implements _GetMoreMyPayHistory {
  _$_GetMoreMyPayHistory({this.params});

  @override
  final MyPaymentsParams? params;

  @override
  String toString() {
    return 'RestoreEvent.getMoreMyPayHistory(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoreMyPayHistory &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMoreMyPayHistoryCopyWith<_$_GetMoreMyPayHistory> get copyWith =>
      __$$_GetMoreMyPayHistoryCopyWithImpl<_$_GetMoreMyPayHistory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return getMoreMyPayHistory(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return getMoreMyPayHistory?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (getMoreMyPayHistory != null) {
      return getMoreMyPayHistory(params);
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return getMoreMyPayHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
  }) {
    return getMoreMyPayHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_SendRestore value)? sendRestore,
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (getMoreMyPayHistory != null) {
      return getMoreMyPayHistory(this);
    }
    return orElse();
  }
}

abstract class _GetMoreMyPayHistory implements RestoreEvent {
  factory _GetMoreMyPayHistory({final MyPaymentsParams? params}) =
      _$_GetMoreMyPayHistory;

  MyPaymentsParams? get params;
  @JsonKey(ignore: true)
  _$$_GetMoreMyPayHistoryCopyWith<_$_GetMoreMyPayHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCopyWith<$Res> {
  factory _$$_ClearCopyWith(_$_Clear value, $Res Function(_$_Clear) then) =
      __$$_ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCopyWithImpl<$Res>
    extends _$RestoreEventCopyWithImpl<$Res, _$_Clear>
    implements _$$_ClearCopyWith<$Res> {
  __$$_ClearCopyWithImpl(_$_Clear _value, $Res Function(_$_Clear) _then)
      : super(_value, _then);
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
    required TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)
        sendCode,
    required TResult Function(VoidCallback onSuccess, String? phone) resendCode,
    required TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)
        verifyCode,
    required TResult Function(
            bool isJournal, VoidCallback onSuccess, String signature)
        sendRestore,
    required TResult Function(MyPaymentsParams? params) getMyPayHistory,
    required TResult Function(MyPaymentsParams? params) getMoreMyPayHistory,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult? Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult? Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult? Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult? Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult? Function(MyPaymentsParams? params)? getMoreMyPayHistory,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phone, VoidCallback onSuccess, ValueChanged<String> onError)?
        sendCode,
    TResult Function(VoidCallback onSuccess, String? phone)? resendCode,
    TResult Function(String code, dynamic Function(String) onSuccess,
            dynamic Function(String) onError)?
        verifyCode,
    TResult Function(bool isJournal, VoidCallback onSuccess, String signature)?
        sendRestore,
    TResult Function(MyPaymentsParams? params)? getMyPayHistory,
    TResult Function(MyPaymentsParams? params)? getMoreMyPayHistory,
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
    required TResult Function(_GetMyPayHistory value) getMyPayHistory,
    required TResult Function(_GetMoreMyPayHistory value) getMoreMyPayHistory,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_SendRestore value)? sendRestore,
    TResult? Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult? Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
    TResult? Function(_Clear value)? clear,
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
    TResult Function(_GetMyPayHistory value)? getMyPayHistory,
    TResult Function(_GetMoreMyPayHistory value)? getMoreMyPayHistory,
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
  FormzStatus get myPaymentsStatus => throw _privateConstructorUsedError;
  List<PaymentHistoryModel> get myPayments =>
      throw _privateConstructorUsedError;
  bool get myPaymentsFetchMore => throw _privateConstructorUsedError;
  String? get myPaymentsNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestoreStateCopyWith<RestoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreStateCopyWith<$Res> {
  factory $RestoreStateCopyWith(
          RestoreState value, $Res Function(RestoreState) then) =
      _$RestoreStateCopyWithImpl<$Res, RestoreState>;
  @useResult
  $Res call(
      {FormzStatus sendCodeStatus,
      FormzStatus verifyStatus,
      String signature,
      String phone,
      String verifyError,
      bool? showRestore,
      FormzStatus myPaymentsStatus,
      List<PaymentHistoryModel> myPayments,
      bool myPaymentsFetchMore,
      String? myPaymentsNext});
}

/// @nodoc
class _$RestoreStateCopyWithImpl<$Res, $Val extends RestoreState>
    implements $RestoreStateCopyWith<$Res> {
  _$RestoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendCodeStatus = null,
    Object? verifyStatus = null,
    Object? signature = null,
    Object? phone = null,
    Object? verifyError = null,
    Object? showRestore = freezed,
    Object? myPaymentsStatus = null,
    Object? myPayments = null,
    Object? myPaymentsFetchMore = null,
    Object? myPaymentsNext = freezed,
  }) {
    return _then(_value.copyWith(
      sendCodeStatus: null == sendCodeStatus
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyError: null == verifyError
          ? _value.verifyError
          : verifyError // ignore: cast_nullable_to_non_nullable
              as String,
      showRestore: freezed == showRestore
          ? _value.showRestore
          : showRestore // ignore: cast_nullable_to_non_nullable
              as bool?,
      myPaymentsStatus: null == myPaymentsStatus
          ? _value.myPaymentsStatus
          : myPaymentsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      myPayments: null == myPayments
          ? _value.myPayments
          : myPayments // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModel>,
      myPaymentsFetchMore: null == myPaymentsFetchMore
          ? _value.myPaymentsFetchMore
          : myPaymentsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      myPaymentsNext: freezed == myPaymentsNext
          ? _value.myPaymentsNext
          : myPaymentsNext // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestoreStateCopyWith<$Res>
    implements $RestoreStateCopyWith<$Res> {
  factory _$$_RestoreStateCopyWith(
          _$_RestoreState value, $Res Function(_$_RestoreState) then) =
      __$$_RestoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus sendCodeStatus,
      FormzStatus verifyStatus,
      String signature,
      String phone,
      String verifyError,
      bool? showRestore,
      FormzStatus myPaymentsStatus,
      List<PaymentHistoryModel> myPayments,
      bool myPaymentsFetchMore,
      String? myPaymentsNext});
}

/// @nodoc
class __$$_RestoreStateCopyWithImpl<$Res>
    extends _$RestoreStateCopyWithImpl<$Res, _$_RestoreState>
    implements _$$_RestoreStateCopyWith<$Res> {
  __$$_RestoreStateCopyWithImpl(
      _$_RestoreState _value, $Res Function(_$_RestoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendCodeStatus = null,
    Object? verifyStatus = null,
    Object? signature = null,
    Object? phone = null,
    Object? verifyError = null,
    Object? showRestore = freezed,
    Object? myPaymentsStatus = null,
    Object? myPayments = null,
    Object? myPaymentsFetchMore = null,
    Object? myPaymentsNext = freezed,
  }) {
    return _then(_$_RestoreState(
      sendCodeStatus: null == sendCodeStatus
          ? _value.sendCodeStatus
          : sendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verifyError: null == verifyError
          ? _value.verifyError
          : verifyError // ignore: cast_nullable_to_non_nullable
              as String,
      showRestore: freezed == showRestore
          ? _value.showRestore
          : showRestore // ignore: cast_nullable_to_non_nullable
              as bool?,
      myPaymentsStatus: null == myPaymentsStatus
          ? _value.myPaymentsStatus
          : myPaymentsStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      myPayments: null == myPayments
          ? _value._myPayments
          : myPayments // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModel>,
      myPaymentsFetchMore: null == myPaymentsFetchMore
          ? _value.myPaymentsFetchMore
          : myPaymentsFetchMore // ignore: cast_nullable_to_non_nullable
              as bool,
      myPaymentsNext: freezed == myPaymentsNext
          ? _value.myPaymentsNext
          : myPaymentsNext // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.showRestore,
      this.myPaymentsStatus = FormzStatus.pure,
      final List<PaymentHistoryModel> myPayments = const [],
      this.myPaymentsFetchMore = false,
      this.myPaymentsNext})
      : _myPayments = myPayments;

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
  @JsonKey()
  final FormzStatus myPaymentsStatus;
  final List<PaymentHistoryModel> _myPayments;
  @override
  @JsonKey()
  List<PaymentHistoryModel> get myPayments {
    if (_myPayments is EqualUnmodifiableListView) return _myPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPayments);
  }

  @override
  @JsonKey()
  final bool myPaymentsFetchMore;
  @override
  final String? myPaymentsNext;

  @override
  String toString() {
    return 'RestoreState(sendCodeStatus: $sendCodeStatus, verifyStatus: $verifyStatus, signature: $signature, phone: $phone, verifyError: $verifyError, showRestore: $showRestore, myPaymentsStatus: $myPaymentsStatus, myPayments: $myPayments, myPaymentsFetchMore: $myPaymentsFetchMore, myPaymentsNext: $myPaymentsNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoreState &&
            (identical(other.sendCodeStatus, sendCodeStatus) ||
                other.sendCodeStatus == sendCodeStatus) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.verifyError, verifyError) ||
                other.verifyError == verifyError) &&
            (identical(other.showRestore, showRestore) ||
                other.showRestore == showRestore) &&
            (identical(other.myPaymentsStatus, myPaymentsStatus) ||
                other.myPaymentsStatus == myPaymentsStatus) &&
            const DeepCollectionEquality()
                .equals(other._myPayments, _myPayments) &&
            (identical(other.myPaymentsFetchMore, myPaymentsFetchMore) ||
                other.myPaymentsFetchMore == myPaymentsFetchMore) &&
            (identical(other.myPaymentsNext, myPaymentsNext) ||
                other.myPaymentsNext == myPaymentsNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sendCodeStatus,
      verifyStatus,
      signature,
      phone,
      verifyError,
      showRestore,
      myPaymentsStatus,
      const DeepCollectionEquality().hash(_myPayments),
      myPaymentsFetchMore,
      myPaymentsNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final bool? showRestore,
      final FormzStatus myPaymentsStatus,
      final List<PaymentHistoryModel> myPayments,
      final bool myPaymentsFetchMore,
      final String? myPaymentsNext}) = _$_RestoreState;

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
  FormzStatus get myPaymentsStatus;
  @override
  List<PaymentHistoryModel> get myPayments;
  @override
  bool get myPaymentsFetchMore;
  @override
  String? get myPaymentsNext;
  @override
  @JsonKey(ignore: true)
  _$$_RestoreStateCopyWith<_$_RestoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
