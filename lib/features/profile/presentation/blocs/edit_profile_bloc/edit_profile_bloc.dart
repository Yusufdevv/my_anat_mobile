import 'package:anatomica/features/profile/domain/usecases/edit_profile.dart';
import 'package:anatomica/features/profile/domain/usecases/upload_img.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final UploadImageUseCase _uploadUseCase;

  EditProfileBloc(
    this._editProfileUseCase,
    this._uploadUseCase,
  ) : super(const EditProfileState(
          status: FormzStatus.pure,
          firstName: '',
          email: '',
          lastName: '',
          imageId: -1,
          phoneNumber: '',
          userName: '',
          imageUrl: '',
          birthDate: '',
        )) {
    on<_SaveData>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      if (state.phoneNumber.isNotEmpty && state.phoneNumber.length < 13) {
        event.onError("Telefon nomer formati noto'g'ri");
      } else {
        final map = <String, dynamic>{};
        if (state.firstName.isNotEmpty) {
          map.putIfAbsent('full_name', () => state.firstName);
        }
        if (state.email.isNotEmpty) {
          map.putIfAbsent('email', () => state.email);
        }
        if (state.phoneNumber.isNotEmpty) {
          map.putIfAbsent('phone_number', () => state.phoneNumber);
        }
        if (state.imageId > 0) {
          map.putIfAbsent('img', () => state.imageId);
        }
        print('map: $map');
        final result = await _editProfileUseCase.call(EditProfileParams(data: map));
        if (result.isRight) {
          print('come to success');
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          event.onSuccess();
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          event.onError(result.left.toString());
        }
      }
    });
    on<_ChangeImage>((event, emit) async {
      var formData = FormData();

      formData.files.add(MapEntry('img', await MultipartFile.fromFile(event.image)));

      final result = await _uploadUseCase(formData);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, imageId: result.right.id, imageUrl: result.right.img));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_ChangeDate>((event, emit) {
      emit(state.copyWith(birthDate: event.text));
    });
    on<_ChangeEmail>((event, emit) {
      emit(state.copyWith(email: event.text));
    });
    on<_ChangePhoneNumber>((event, emit) {
      emit(state.copyWith(phoneNumber: '+998${event.text.replaceAll(' ', '')}'));
    });
    on<_ChangeName>((event, emit) {
      emit(state.copyWith(firstName: event.text));
    });
  }
}