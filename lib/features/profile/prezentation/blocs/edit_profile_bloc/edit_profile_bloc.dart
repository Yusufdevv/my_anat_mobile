import 'package:anatomica/features/profile/domain/usecases/edit_profile.dart';
import 'package:anatomica/features/profile/domain/usecases/upload_img.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

part 'edit_profile_bloc.freezed.dart';

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
        )) {
    on<_SaveData>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final map = <String, dynamic>{
        'full_name': '${state.firstName} ${state.lastName}',
        'email': state.email,
        'username': state.userName,
        'phone_number': state.phoneNumber,
        'img': state.imageId
      };

      if (state.imageId == -1) {
      } else {
        map.addAll({"img": state.imageId});
      }

      final result =
          await _editProfileUseCase.call(EditProfileParams(data: map));
      if (result.isRight) {
        state.status;
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_ChangeImage>((event, emit) async {
      var formData = FormData();

      formData.files
          .add(MapEntry('img', await MultipartFile.fromFile(event.image)));

      final result = await _uploadUseCase(formData);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, imageId: result.right.id));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
