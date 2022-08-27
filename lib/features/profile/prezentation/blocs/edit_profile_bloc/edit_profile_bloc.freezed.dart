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
    required TResult Function() saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
    TResult Function(_SaveData value)? saveData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  final EditProfileEvent _value;
  // ignore: unused_field
  final $Res Function(EditProfileEvent) _then;
}

/// @nodoc
abstract class _$$_ChangeNameCopyWith<$Res> {
  factory _$$_ChangeNameCopyWith(
          _$_ChangeName value, $Res Function(_$_ChangeName) then) =
      __$$_ChangeNameCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeNameCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangeNameCopyWith<$Res> {
  __$$_ChangeNameCopyWithImpl(
      _$_ChangeName _value, $Res Function(_$_ChangeName) _then)
      : super(_value, (v) => _then(v as _$_ChangeName));

  @override
  _$_ChangeName get _value => super._value as _$_ChangeName;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangeName(
      text == freezed
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
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changeName(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeSurnameCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangeSurnameCopyWith<$Res> {
  __$$_ChangeSurnameCopyWithImpl(
      _$_ChangeSurname _value, $Res Function(_$_ChangeSurname) _then)
      : super(_value, (v) => _then(v as _$_ChangeSurname));

  @override
  _$_ChangeSurname get _value => super._value as _$_ChangeSurname;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangeSurname(
      text == freezed
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
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changeSurname(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeSurname(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  $Res call({String text});
}

/// @nodoc
class __$$_ChangePhoneNumberCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangePhoneNumberCopyWith<$Res> {
  __$$_ChangePhoneNumberCopyWithImpl(
      _$_ChangePhoneNumber _value, $Res Function(_$_ChangePhoneNumber) _then)
      : super(_value, (v) => _then(v as _$_ChangePhoneNumber));

  @override
  _$_ChangePhoneNumber get _value => super._value as _$_ChangePhoneNumber;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangePhoneNumber(
      text == freezed
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
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changePhoneNumber(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changePhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeEmailCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangeEmailCopyWith<$Res> {
  __$$_ChangeEmailCopyWithImpl(
      _$_ChangeEmail _value, $Res Function(_$_ChangeEmail) _then)
      : super(_value, (v) => _then(v as _$_ChangeEmail));

  @override
  _$_ChangeEmail get _value => super._value as _$_ChangeEmail;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangeEmail(
      text == freezed
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
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changeEmail(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  $Res call({String text});
}

/// @nodoc
class __$$_ChangeDateCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangeDateCopyWith<$Res> {
  __$$_ChangeDateCopyWithImpl(
      _$_ChangeDate _value, $Res Function(_$_ChangeDate) _then)
      : super(_value, (v) => _then(v as _$_ChangeDate));

  @override
  _$_ChangeDate get _value => super._value as _$_ChangeDate;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ChangeDate(
      text == freezed
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
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changeDate(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  $Res call({String image});
}

/// @nodoc
class __$$_ChangeImageCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_ChangeImageCopyWith<$Res> {
  __$$_ChangeImageCopyWithImpl(
      _$_ChangeImage _value, $Res Function(_$_ChangeImage) _then)
      : super(_value, (v) => _then(v as _$_ChangeImage));

  @override
  _$_ChangeImage get _value => super._value as _$_ChangeImage;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$_ChangeImage(
      image == freezed
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
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
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
    required TResult Function() saveData,
  }) {
    return changeImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
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
    TResult Function()? saveData,
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
abstract class _$$_SaveDataCopyWith<$Res> {
  factory _$$_SaveDataCopyWith(
          _$_SaveData value, $Res Function(_$_SaveData) then) =
      __$$_SaveDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveDataCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements _$$_SaveDataCopyWith<$Res> {
  __$$_SaveDataCopyWithImpl(
      _$_SaveData _value, $Res Function(_$_SaveData) _then)
      : super(_value, (v) => _then(v as _$_SaveData));

  @override
  _$_SaveData get _value => super._value as _$_SaveData;
}

/// @nodoc

class _$_SaveData implements _SaveData {
  _$_SaveData();

  @override
  String toString() {
    return 'EditProfileEvent.saveData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SaveData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) changeName,
    required TResult Function(String text) changeSurname,
    required TResult Function(String text) changePhoneNumber,
    required TResult Function(String text) changeEmail,
    required TResult Function(String text) changeDate,
    required TResult Function(String image) changeImage,
    required TResult Function() saveData,
  }) {
    return saveData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? changeName,
    TResult Function(String text)? changeSurname,
    TResult Function(String text)? changePhoneNumber,
    TResult Function(String text)? changeEmail,
    TResult Function(String text)? changeDate,
    TResult Function(String image)? changeImage,
    TResult Function()? saveData,
  }) {
    return saveData?.call();
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
    TResult Function()? saveData,
    required TResult orElse(),
  }) {
    if (saveData != null) {
      return saveData();
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
    required TResult Function(_SaveData value) saveData,
  }) {
    return saveData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeSurname value)? changeSurname,
    TResult Function(_ChangePhoneNumber value)? changePhoneNumber,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_SaveData value)? saveData,
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
  factory _SaveData() = _$_SaveData;
}
