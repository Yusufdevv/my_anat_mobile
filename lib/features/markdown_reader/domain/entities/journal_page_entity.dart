import 'package:freezed_annotation/freezed_annotation.dart';

class JournalPageEntity {
  final int journal;
  @JsonKey(name: 'content_ru')
  final String contentRu;
  @JsonKey(name: 'content_uz')
  final String contentUz;
  final String imgContent;
  final int page;
  final bool preview;
  const JournalPageEntity({
    this.page = 0,
    this.preview = false,
    this.journal = 0,
    this.contentRu = '',
    this.contentUz = '',
    this.imgContent = '',
  });
}
