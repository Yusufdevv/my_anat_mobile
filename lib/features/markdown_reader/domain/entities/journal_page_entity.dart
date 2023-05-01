import 'dart:developer';

import 'package:anatomica/core/utils/my_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class JournalPageEntity extends Equatable {
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

  JournalPageEntity remizeContents({required num fontSize}) {
    final remizedRu = MyFunctions.changePXtoREM(contentRu);
    final remizedUz = MyFunctions.changePXtoREM(contentUz);
    final baseSizedRu = MyFunctions.setBaseSize(fontSize: fontSize, cssCode: remizedRu, selector: 'html');
    final baseSizedUz = MyFunctions.setBaseSize(fontSize: fontSize, cssCode: remizedUz, selector: 'html');
    return JournalPageEntity(
      page: page,
      contentRu: baseSizedRu,
      contentUz: baseSizedUz,
      imgContent: imgContent,
      journal: journal,
      preview: preview,
    );
  }

  JournalPageEntity setSize({required num fontSize}) {
    final baseSizedRu = MyFunctions.setBaseSize(fontSize: fontSize, cssCode: contentRu);
    final baseSizedUz = MyFunctions.setBaseSize(fontSize: fontSize, cssCode: contentUz);
    return JournalPageEntity(
      page: page,
      contentRu: baseSizedRu,
      contentUz: baseSizedUz,
      imgContent: imgContent,
      journal: journal,
      preview: preview,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        preview,
        journal,
        contentRu,
        contentUz,
        imgContent,
      ];
}
