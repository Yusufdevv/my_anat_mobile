import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePicker picker;

  ImageBloc(this.picker) : super(ImageState(image: File(''))) {
    on<GetImageEvent>((event, emit) async {
      XFile? image;
      XFile? photo;

      File? images = state.image;
      if (event.isFromGallery) {
        image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
      } else {
        photo = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      }
      if (event.isFromGallery) {
        images = File(image!.path);
      } else {
        images = File(photo!.path);
      }

      emit(ImageState(image: images));
    });
  }
}
