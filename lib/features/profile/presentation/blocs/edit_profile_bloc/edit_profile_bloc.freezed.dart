// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res, EditProfileEvent>;
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res, $Val extends EditProfileEvent>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChangeNameCopyWith<$Res> {
  factory _$$_ChangeNameCopyWith(
          _$_ChangeName value, $Res Function(_$_ChangeName) then) =
      __$$_ChangeNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeNameCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangeName>
    implements _$$_ChangeNameCopyWith<$Res> {
  __$$_ChangeNameCopyWithImpl(
      _$_ChangeName _value, $Res Function(_$_ChangeName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangeName(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeName implements _ChangeName {
  _$_ChangeName(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'EditProfileEvent.changeName(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeName &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeNameCopyWith<_$_ChangeName> get copyWith =>
      __$$_ChangeNameCopyWithImpl<_$_ChangeName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changeName(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changeName?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changeName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(this);
    }
    return orElse();
  }
}

abstract class _ChangeName implements EditProfileEvent {
  factory _ChangeName(final String text) = _$_ChangeName;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangeNameCopyWith<_$_ChangeName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeSurnameCopyWith<$Res> {
  factory _$$_ChangeSurnameCopyWith(
          _$_ChangeSurname value, $Res Function(_$_ChangeSurname) then) =
      __$$_ChangeSurnameCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeSurnameCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangeSurname>
    implements _$$_ChangeSurnameCopyWith<$Res> {
  __$$_ChangeSurnameCopyWithImpl(
      _$_ChangeSurname _value, $Res Function(_$_ChangeSurname) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangeSurname(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeSurname implements _ChangeSurname {
  _$_ChangeSurname(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'EditProfileEvent.changeSurname(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeSurname &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeSurnameCopyWith<_$_ChangeSurname> get copyWith =>
      __$$_ChangeSurnameCopyWithImpl<_$_ChangeSurname>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changeSurname(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changeSurname?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changeSurname != null) {
      return changeSurname(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeSurname(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changeSurname?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changeSurname != null) {
      return changeSurname(this);
    }
    return orElse();
  }
}

abstract class _ChangeSurname implements EditProfileEvent {
  factory _ChangeSurname(final String text) = _$_ChangeSurname;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangeSurnameCopyWith<_$_ChangeSurname> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangePhoneNumberCopyWith<$Res> {
  factory _$$_ChangePhoneNumberCopyWith(_$_ChangePhoneNumber value,
          $Res Function(_$_ChangePhoneNumber) then) =
      __$$_ChangePhoneNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangePhoneNumberCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangePhoneNumber>
    implements _$$_ChangePhoneNumberCopyWith<$Res> {
  __$$_ChangePhoneNumberCopyWithImpl(
      _$_ChangePhoneNumber _value, $Res Function(_$_ChangePhoneNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangePhoneNumber(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangePhoneNumber implements _ChangePhoneNumber {
  _$_ChangePhoneNumber(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'EditProfileEvent.changePhoneNumber(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePhoneNumber &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePhoneNumberCopyWith<_$_ChangePhoneNumber> get copyWith =>
      __$$_ChangePhoneNumberCopyWithImpl<_$_ChangePhoneNumber>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changePhoneNumber(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changePhoneNumber?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changePhoneNumber != null) {
      return changePhoneNumber(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changePhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changePhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changePhoneNumber != null) {
      return changePhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _ChangePhoneNumber implements EditProfileEvent {
  factory _ChangePhoneNumber(final String text) = _$_ChangePhoneNumber;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangePhoneNumberCopyWith<_$_ChangePhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeEmailCopyWith<$Res> {
  factory _$$_ChangeEmailCopyWith(
          _$_ChangeEmail value, $Res Function(_$_ChangeEmail) then) =
      __$$_ChangeEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeEmailCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangeEmail>
    implements _$$_ChangeEmailCopyWith<$Res> {
  __$$_ChangeEmailCopyWithImpl(
      _$_ChangeEmail _value, $Res Function(_$_ChangeEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangeEmail(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeEmail implements _ChangeEmail {
  _$_ChangeEmail(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'EditProfileEvent.changeEmail(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeEmail &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeEmailCopyWith<_$_ChangeEmail> get copyWith =>
      __$$_ChangeEmailCopyWithImpl<_$_ChangeEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changeEmail(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changeEmail?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changeEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmail implements EditProfileEvent {
  factory _ChangeEmail(final String text) = _$_ChangeEmail;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangeEmailCopyWith<_$_ChangeEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeDateCopyWith<$Res> {
  factory _$$_ChangeDateCopyWith(
          _$_ChangeDate value, $Res Function(_$_ChangeDate) then) =
      __$$_ChangeDateCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeDateCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangeDate>
    implements _$$_ChangeDateCopyWith<$Res> {
  __$$_ChangeDateCopyWithImpl(
      _$_ChangeDate _value, $Res Function(_$_ChangeDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_ChangeDate(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeDate implements _ChangeDate {
  _$_ChangeDate(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'EditProfileEvent.changeDate(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeDate &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeDateCopyWith<_$_ChangeDate> get copyWith =>
      __$$_ChangeDateCopyWithImpl<_$_ChangeDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changeDate(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changeDate?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeDate implements EditProfileEvent {
  factory _ChangeDate(final String text) = _$_ChangeDate;

  String get text;
  @JsonKey(ignore: true)
  _$$_ChangeDateCopyWith<_$_ChangeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeImageCopyWith<$Res> {
  factory _$$_ChangeImageCopyWith(
          _$_ChangeImage value, $Res Function(_$_ChangeImage) then) =
      __$$_ChangeImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$_ChangeImageCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_ChangeImage>
    implements _$$_ChangeImageCopyWith<$Res> {
  __$$_ChangeImageCopyWithImpl(
      _$_ChangeImage _value, $Res Function(_$_ChangeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_ChangeImage(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeImage implements _ChangeImage {
  _$_ChangeImage(this.image);

  @override
  final String image;

  @override
  String toString() {
    return 'EditProfileEvent.changeImage(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeImage &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      __$$_ChangeImageCopyWithImpl<_$_ChangeImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return changeImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return changeImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements EditProfileEvent {
  factory _ChangeImage(final String image) = _$_ChangeImage;

  String get image;
  @JsonKey(ignore: true)
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditPhoneCopyWith<$Res> {
  factory _$$_EditPhoneCopyWith(
          _$_EditPhone value, $Res Function(_$_EditPhone) then) =
      __$$_EditPhoneCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$_EditPhoneCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_EditPhone>
    implements _$$_EditPhoneCopyWith<$Res> {
  __$$_EditPhoneCopyWithImpl(
      _$_EditPhone _value, $Res Function(_$_EditPhone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$_EditPhone(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditPhone implements _EditPhone {
  _$_EditPhone({required this.phone});

  @override
  final String phone;

  @override
  String toString() {
    return 'EditProfileEvent.editPhone(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPhone &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPhoneCopyWith<_$_EditPhone> get copyWith =>
      __$$_EditPhoneCopyWithImpl<_$_EditPhone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return editPhone(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return editPhone?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (editPhone != null) {
      return editPhone(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return editPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return editPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (editPhone != null) {
      return editPhone(this);
    }
    return orElse();
  }
}

abstract class _EditPhone implements EditProfileEvent {
  factory _EditPhone({required final String phone}) = _$_EditPhone;

  String get phone;
  @JsonKey(ignore: true)
  _$$_EditPhoneCopyWith<_$_EditPhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditEmailCopyWith<$Res> {
  factory _$$_EditEmailCopyWith(
          _$_EditEmail value, $Res Function(_$_EditEmail) then) =
      __$$_EditEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EditEmailCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_EditEmail>
    implements _$$_EditEmailCopyWith<$Res> {
  __$$_EditEmailCopyWithImpl(
      _$_EditEmail _value, $Res Function(_$_EditEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EditEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditEmail implements _EditEmail {
  _$_EditEmail({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'EditProfileEvent.editEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditEmailCopyWith<_$_EditEmail> get copyWith =>
      __$$_EditEmailCopyWithImpl<_$_EditEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return editEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return editEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (editEmail != null) {
      return editEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return editEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return editEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (editEmail != null) {
      return editEmail(this);
    }
    return orElse();
  }
}

abstract class _EditEmail implements EditProfileEvent {
  factory _EditEmail({required final String email}) = _$_EditEmail;

  String get email;
  @JsonKey(ignore: true)
  _$$_EditEmailCopyWith<_$_EditEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SaveDataCopyWith<$Res> {
  factory _$$_SaveDataCopyWith(
          _$_SaveData value, $Res Function(_$_SaveData) then) =
      __$$_SaveDataCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueChanged<String> onError, VoidCallback onSuccess});
}

/// @nodoc
class __$$_SaveDataCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$_SaveData>
    implements _$$_SaveDataCopyWith<$Res> {
  __$$_SaveDataCopyWithImpl(
      _$_SaveData _value, $Res Function(_$_SaveData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onError = null,
    Object? onSuccess = null,
  }) {
    return _then(_$_SaveData(
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ValueChanged<String>,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$_SaveData implements _SaveData {
  _$_SaveData({required this.onError, required this.onSuccess});

  @override
  final ValueChanged<String> onError;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'EditProfileEvent.saveData(onError: $onError, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveData &&
            (identical(other.onError, onError) || other.onError == onError) &&
            const DeepCollectionEquality().equals(other.onSuccess, onSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, onError, const DeepCollectionEquality().hash(onSuccess));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveDataCopyWith<_$_SaveData> get copyWith =>
      __$$_SaveDataCopyWithImpl<_$_SaveData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function(String phone) editPhone,
    required TResult Function(String email) editEmail,
    required TResult Function(
            ValueChanged<String> onError, VoidCallback onSuccess)
        saveData,
  }) {
    return saveData(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? changeName,
    TResult? Function(String text)? changeSurname,
    TResult? Function(String text)? changePhoneNumber,
    TResult? Function(String text)? changeEmail,
    TResult? Function(String text)? changeDate,
    TResult? Function(String image)? changeImage,
    TResult? Function(String phone)? editPhone,
    TResult? Function(String email)? editEmail,
    TResult? Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
  }) {
    return saveData?.call(onError, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function(String phone)? editPhone,
    TResult Function(String email)? editEmail,
    TResult Function(ValueChanged<String> onError, VoidCallback onSuccess)?
        saveData,
    required TResult orElse(),
  }) {
    if (saveData != null) {
      return saveData(onError, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeSurname value) changeSurname,
    required TResult Function(_ChangePhoneNumber value) changePhoneNumber,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_EditPhone value) editPhone,
    required TResult Function(_EditEmail value) editEmail,
    required TResult Function(_SaveData value) saveData,
  }) {
    return saveData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeName value)? changeName,
    TResult? Function(_ChangeSurname value)? changeSurname,
    TResult? Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeDate value)? changeDate,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_EditPhone value)? editPhone,
    TResult? Function(_EditEmail value)? editEmail,
    TResult? Function(_SaveData value)? saveData,
  }) {
    return saveData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_EditPhone value)? editPhone,
    TResult Function(_EditEmail value)? editEmail,
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) {
    if (saveData != null) {
      return saveData(this);
    }
    return orElse();
  }
}

abstract class _SaveData implements EditProfileEvent {
  factory _SaveData(
      {required final ValueChanged<String> onError,
      required final VoidCallback onSuccess}) = _$_SaveData;

  ValueChanged<String> get onError;
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$_SaveDataCopyWith<_$_SaveData> get copyWith =>
      throw _privateConstructorUsedError;
}
