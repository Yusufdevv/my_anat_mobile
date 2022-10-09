part of 'ui/epub_view.dart';

enum ReaderFontFamily {
  openSans,
  serif,
  literata,
  roboto,
}

const Map<ReaderFontFamily, String> readerFontFamilies = {
  ReaderFontFamily.openSans: 'OpenSans',
  ReaderFontFamily.serif: 'Serif',
  ReaderFontFamily.literata: 'Literata',
  ReaderFontFamily.roboto: 'Roboto',
};
// const Map<ReaderFontFamily, String> readerFontFamilies = {
//   ReaderFontFamily.openSans: 'OpenSans',
//   ReaderFontFamily.serif: 'Serif',
//   ReaderFontFamily.literata: 'Literata',
//   ReaderFontFamily.lobster: 'Roboto',
//};

enum ReaderColor {
  white,
  sepia,
  gray,
  black,
}

const Map<ReaderColor, String> readerColors = {
  ReaderColor.white: 'White',
  ReaderColor.sepia: 'Sepia',
  ReaderColor.gray: 'Gray',
  ReaderColor.black: 'Black'
};

const Map<ReaderColor, Color> readerBackgroundColors = {
  ReaderColor.white: Color.fromRGBO(255, 255, 255, 1),
  ReaderColor.sepia: Color.fromRGBO(247, 241, 229, 1),
  ReaderColor.gray: Color.fromRGBO(46, 44, 44, 1),
  ReaderColor.black: Color.fromRGBO(1, 1, 1, 1)
};

const Map<ReaderColor, Color> readerTextColors = {
  ReaderColor.white: Color.fromRGBO(133, 141, 150, 1),
  ReaderColor.sepia: Color.fromRGBO(1, 1, 1, 1),
  ReaderColor.gray: Color.fromRGBO(255, 255, 255, 1),
  ReaderColor.black: Color.fromRGBO(255, 255, 255, 1),
};

class EpubController with ChangeNotifier {
  EpubController({
    required this.document,
    this.epubCfi,
  }) {
    registerListeners();
  }

  Future<EpubBook> document;
  final String? epubCfi;
  final isVertical = ValueNotifier<bool>(true);
  final hideScrollView = ValueNotifier<bool>(false);
  final fontSize = ValueNotifier<double>(14);
  final fontFamily = ValueNotifier<ReaderFontFamily>(ReaderFontFamily.openSans);
  final color = ValueNotifier<ReaderColor>(ReaderColor.white);

  EpubViewState? _epubViewState;
  List<EpubViewChapter>? _cacheTableOfContents;
  EpubBook? _document;

  EpubChapterViewValue? get currentValue => _epubViewState?._currentValue;

  final isBookLoaded = ValueNotifier<bool>(false);
  final ValueNotifier<EpubViewLoadingState> loadingState =
      ValueNotifier(EpubViewLoadingState.loading);

  final currentValueListenable = ValueNotifier<EpubChapterViewValue?>(null);

  final tableOfContentsListenable = ValueNotifier<List<EpubViewChapter>>([]);

  void jumpTo({required int index, double alignment = 0}) =>
      _epubViewState?._itemScrollController?.jumpTo(
        index: index,
        alignment: alignment,
      );

  Future<void>? scrollTo({
    required int index,
    Duration duration = const Duration(milliseconds: 250),
    double alignment = 0,
    Curve curve = Curves.linear,
  }) =>
      _epubViewState?._itemScrollController?.scrollTo(
        index: index,
        duration: duration,
        alignment: alignment,
        curve: curve,
      );

  void gotoEpubCfi(
    String epubCfi, {
    double alignment = 0,
    Duration duration = const Duration(milliseconds: 250),
    Curve curve = Curves.linear,
  }) {
    _epubViewState?._gotoEpubCfi(
      epubCfi,
      alignment: alignment,
      duration: duration,
      curve: curve,
    );
  }

  String? generateEpubCfi() => _epubViewState?._epubCfiReader?.generateCfi(
        book: _document,
        chapter: _epubViewState?._currentValue?.chapter,
        paragraphIndex: _epubViewState?._getAbsParagraphIndexBy(
          positionIndex: _epubViewState?._currentValue?.position.index ?? 0,
          trailingEdge:
              _epubViewState?._currentValue?.position.itemTrailingEdge,
          leadingEdge: _epubViewState?._currentValue?.position.itemLeadingEdge,
        ),
      );

  List<EpubViewChapter> tableOfContents() {
    if (_cacheTableOfContents != null) {
      return _cacheTableOfContents ?? [];
    }

    if (_document == null) {
      return [];
    }

    int index = -1;

    return _cacheTableOfContents =
        _document!.Chapters!.fold<List<EpubViewChapter>>(
      [],
      (acc, next) {
        index += 1;
        acc.add(EpubViewChapter(next.Title, _getChapterStartIndex(index)));
        for (final subChapter in next.SubChapters!) {
          index += 1;
          acc.add(EpubViewSubChapter(
              subChapter.Title, _getChapterStartIndex(index)));
        }
        return acc;
      },
    );
  }

  Future<void> loadDocument(Future<EpubBook> document) {
    this.document = document;
    return _loadDocument(document);
  }

  void registerListeners() {
    [fontSize, fontFamily, color, isVertical].forEach((property) {
      property.addListener(() {
        notifyListeners();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _epubViewState = null;
    isVertical.dispose();
    isBookLoaded.dispose();
    currentValueListenable.dispose();
    tableOfContentsListenable.dispose();
  }

  Future<void> _loadDocument(Future<EpubBook> document) async {
    isBookLoaded.value = false;
    try {
      loadingState.value = EpubViewLoadingState.loading;
      _document = await document;
      await _epubViewState!._init();
      tableOfContentsListenable.value = tableOfContents();
      await _epubViewState!._buildPages();
      loadingState.value = EpubViewLoadingState.success;
    } catch (error) {
      _epubViewState!._loadingError = error is Exception
          ? error
          : Exception('An unexpected error occurred');
      loadingState.value = EpubViewLoadingState.error;
    }
  }

  int _getChapterStartIndex(int index) =>
      index < _epubViewState!._chapterIndexes.length
          ? _epubViewState!._chapterIndexes[index]
          : 0;

  void _attach(EpubViewState epubReaderViewState) {
    _epubViewState = epubReaderViewState;
    _loadDocument(document);
  }

  void _detach() {
    _epubViewState = null;
  }
}
