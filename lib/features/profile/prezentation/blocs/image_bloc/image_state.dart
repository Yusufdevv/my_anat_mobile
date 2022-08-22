part of 'image_bloc.dart';

class ImageState extends Equatable {
  File? image;

  ImageState({required this.image});

  @override
  List<Object?> get props => [image];
}
