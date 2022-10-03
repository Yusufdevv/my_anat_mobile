part of 'download_bloc.dart';

class DownloadState extends Equatable {
  final double progress;
  final FormzStatus status;
  final String fileUrl;

  const DownloadState({
    required this.progress,
    required this.status,
    required this.fileUrl,
  });

  DownloadState copyWith({
    double? progress,
    FormzStatus? status,
    String? fileUrl,
  }) =>
      DownloadState(
        progress: progress ?? this.progress,
        status: status ?? this.status,
        fileUrl: fileUrl ?? this.fileUrl,
      );

  @override
  List<Object?> get props => [progress, status, fileUrl];
}
