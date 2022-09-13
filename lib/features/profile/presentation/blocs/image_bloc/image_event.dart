part of 'image_bloc.dart';


abstract class ImageEvent extends Equatable {
  const ImageEvent();
}

class GetImageEvent extends ImageEvent {
  final bool isFromGallery;

  GetImageEvent({required this.isFromGallery});

  @override
  List<Object?> get props => [];
}

class RemoveImageEvent extends ImageEvent {
  final int index;

  RemoveImageEvent({required this.index});

  @override
  List<Object?> get props => [];
}
