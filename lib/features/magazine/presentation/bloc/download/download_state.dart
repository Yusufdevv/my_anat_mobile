part of 'download_bloc.dart';

class DownloadState extends Equatable {
  final double progress;
  final FormzStatus status;
  final String fileUrl;
  final bool isFileAlreadyDownloaded;

  const DownloadState({
    required this.progress,
    required this.status,
    required this.fileUrl,
    required this.isFileAlreadyDownloaded,
  });

  DownloadState copyWith({
    double? progress,
    FormzStatus? status,
    String? fileUrl,
    bool? isFileAlreadyDownloaded,
  }) =>
      DownloadState(
        progress: progress ?? this.progress,
        status: status ?? this.status,
        fileUrl: fileUrl ?? this.fileUrl,
        isFileAlreadyDownloaded: isFileAlreadyDownloaded ?? this.isFileAlreadyDownloaded,
      );

  @override
  List<Object?> get props => [
        progress,
        status,
        fileUrl,
        isFileAlreadyDownloaded,
      ];
}
