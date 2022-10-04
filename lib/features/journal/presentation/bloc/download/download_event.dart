part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {
  const DownloadEvent();
}

class ChangeProgress extends DownloadEvent {
  final double progress;
  const ChangeProgress(this.progress);
}

class CheckWhetherFileExists extends DownloadEvent {
  final String slug;
  final String filename;
  final int id;
  final VoidCallback onNotDownloaded;
  final ValueChanged<File> onDownloaded;
  final String fileType;

  const CheckWhetherFileExists({
    required this.slug,
    required this.filename,
    required this.id,
    required this.onNotDownloaded,
    required this.fileType,
    required this.onDownloaded,
  });
}

class CheckWhetherFragmentFileExists extends DownloadEvent {
  final int id;
  final VoidCallback onNotDownloaded;
  final ValueChanged<File> onDownloaded;
  final String fileType;
  final String fileUrl;
  final String fileName;

  const CheckWhetherFragmentFileExists({
    required this.id,
    required this.onNotDownloaded,
    required this.fileType,
    required this.onDownloaded,
    required this.fileUrl,
    required this.fileName,
  });
}

class DownloadFinished extends DownloadEvent {
  final String filename;
  final String path;
  final int id;
  final bool isFragment;

  const DownloadFinished({
    required this.path,
    required this.filename,
    required this.id,
    this.isFragment = false,
  });
}

class CheckWhetherFileAlreadyDownloaded extends DownloadEvent {
  final int id;
  const CheckWhetherFileAlreadyDownloaded({required this.id});
}
