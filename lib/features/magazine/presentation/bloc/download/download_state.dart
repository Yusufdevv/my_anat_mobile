part of 'download_bloc.dart';

class DownloadState extends Equatable {
  final double progress;
  final FormzStatus status;
  final FormzStatus epubOpeningStatus;
  final bool fileAlreadyDownloaded;
  final String fileUrl;

  const DownloadState({
    required this.progress,
    required this.status,
    required this.fileAlreadyDownloaded,
    required this.fileUrl,
    required this.epubOpeningStatus,
  });

  DownloadState copyWith({
    double? progress,
    FormzStatus? status,
    bool? fileAlreadyDownloaded,
    String? fileUrl,
    FormzStatus? epubOpeningStatus,
  }) =>
      DownloadState(
        progress: progress ?? this.progress,
        status: status ?? this.status,
        fileAlreadyDownloaded: fileAlreadyDownloaded ?? this.fileAlreadyDownloaded,
        fileUrl: fileUrl ?? this.fileUrl,
        epubOpeningStatus: epubOpeningStatus ?? this.epubOpeningStatus,
      );

  @override
  List<Object?> get props => [progress, status, fileUrl, epubOpeningStatus, fileAlreadyDownloaded];
}
