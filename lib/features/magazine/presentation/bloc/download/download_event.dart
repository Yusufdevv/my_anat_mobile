part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {
  const DownloadEvent();
}

class ChangeProgress extends DownloadEvent {
  final double progress;
  const ChangeProgress(this.progress);
}

class CheckWetherFileExists extends DownloadEvent {
  final String slug;
  final String filename;
  final int id;
  final VoidCallback onNotDownloaded;
  final ValueChanged<String> onDownloaded;
  final String fileType;

  const CheckWetherFileExists({
    required this.slug,
    required this.filename,
    required this.id,
    required this.onNotDownloaded,
    required this.fileType,
    required this.onDownloaded,
  });
}

class DownloadFinished extends DownloadEvent {
  final String filename;
  final String path;
  final int id;

  const DownloadFinished({
    required this.path,
    required this.filename,
    required this.id,
  });
}
