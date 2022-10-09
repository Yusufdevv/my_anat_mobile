import 'dart:async';
import 'dart:typed_data';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:epub_view/src/data/epub_cfi_reader.dart';
import 'package:epub_view/src/data/epub_parser.dart';
import 'package:epub_view/src/data/models/chapter.dart';
import 'package:epub_view/src/data/models/chapter_view_value.dart';
import 'package:epub_view/src/data/models/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

export 'package:epubx/epubx.dart' hide Image;

part '../epub_controller.dart';
part '../helpers/epub_view_builders.dart';

const _minTrailingEdge = 0.55;
const _minLeadingEdge = -0.05;

class MeasureSizeRenderObject extends RenderProxyBox {
  MeasureSizeRenderObject(this.onChange);

  void Function(Size size) onChange;

  Size _prevSize = Size.zero;

  @override
  void performLayout() {
    super.performLayout();
    Size newSize = child?.size ?? Size.zero;
    if (_prevSize == newSize) return;
    _prevSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) => onChange(newSize));
  }
}

class MeasurableWidget extends SingleChildRenderObjectWidget {
  const MeasurableWidget(
      {Key? key, required this.onChange, required Widget child})
      : super(key: key, child: child);
  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      MeasureSizeRenderObject(onChange);
}

typedef ExternalLinkPressed = void Function(String href);

class EpubView extends StatefulWidget {
  const EpubView({
    required this.controller,
    this.onExternalLinkPressed,
    this.onChapterChanged,
    this.onDocumentLoaded,
    this.onDocumentError,
    this.builders = const EpubViewBuilders<DefaultBuilderOptions>(
      options: DefaultBuilderOptions(),
    ),
    Key? key,
  }) : super(key: key);

  final EpubController controller;
  final ExternalLinkPressed? onExternalLinkPressed;

  final void Function(EpubChapterViewValue? value)? onChapterChanged;

  /// Called when a document is loaded
  final void Function(EpubBook document)? onDocumentLoaded;

  /// Called when a document loading error
  final void Function(Exception? error)? onDocumentError;

  /// Builders
  final EpubViewBuilders builders;

  @override
  EpubViewState createState() => EpubViewState();
}

class EpubViewState extends State<EpubView> {
  Exception? _loadingError;
  ItemScrollController? _itemScrollController;
  ItemPositionsListener? _itemPositionListener;
  List<EpubChapter> _chapters = [];
  List<Paragraph> _paragraphs = [];
  EpubCfiReader? _epubCfiReader;
  EpubChapterViewValue? _currentValue;
  final _chapterIndexes = <int>[];
  final Map<int, List<int>> _pageParagraphs = {};
  bool _canBuildNextPage = true;
  bool _isBuilding = false;
  final List<int> _readyPages = [];
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _viewTempKey = GlobalKey();

  EpubController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _itemScrollController = ItemScrollController();
    _itemPositionListener = ItemPositionsListener.create();
    _controller._attach(this);
    _controller.loadingState.addListener(() {
      switch (_controller.loadingState.value) {
        case EpubViewLoadingState.loading:
          break;
        case EpubViewLoadingState.success:
          widget.onDocumentLoaded?.call(_controller._document!);
          break;
        case EpubViewLoadingState.error:
          widget.onDocumentError?.call(_loadingError);
          break;
      }

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _itemPositionListener!.itemPositions.removeListener(_changeListener);
    _controller._detach();
    super.dispose();
  }

  Future<bool> _init() async {
    if (_controller.isBookLoaded.value) {
      return true;
    }
    _chapters = parseChapters(_controller._document!);
    final parseParagraphsResult =
        parseParagraphs(_chapters, _controller._document!.Content);
    _paragraphs = parseParagraphsResult.flatParagraphs;
    for (var paragraph in _paragraphs) {
      print('paragraphs:');
      print(paragraph);
      print('\n');
      print('element');
      print(paragraph.element.outerHtml);
      print('\n');
      print('chapter index');
      print(paragraph.chapterIndex);
      print('----====----');
      print('----====----');
      print('----====----');
    }
    _chapterIndexes.addAll(parseParagraphsResult.chapterIndexes);

    _epubCfiReader = EpubCfiReader.parser(
      cfiInput: _controller.epubCfi,
      chapters: _chapters,
      paragraphs: _paragraphs,
    );
    _itemPositionListener!.itemPositions.addListener(_changeListener);
    _controller.isBookLoaded.value = true;
    _controller.fontSize.addListener(() {
      _rebuildPages();
    });

    return true;
  }

  void _changeListener() {
    if (_paragraphs.isEmpty ||
        _itemPositionListener!.itemPositions.value.isEmpty) {
      return;
    }
    final position = _itemPositionListener!.itemPositions.value.first;
    final chapterIndex = _getChapterIndexBy(
      positionIndex: position.index,
      trailingEdge: position.itemTrailingEdge,
      leadingEdge: position.itemLeadingEdge,
    );
    final paragraphIndex = _getParagraphIndexBy(
      positionIndex: position.index,
      trailingEdge: position.itemTrailingEdge,
      leadingEdge: position.itemLeadingEdge,
    );
    _currentValue = EpubChapterViewValue(
      chapter: chapterIndex >= 0 ? _chapters[chapterIndex] : null,
      chapterNumber: chapterIndex + 1,
      paragraphNumber: paragraphIndex + 1,
      position: position,
    );
    _controller.currentValueListenable.value = _currentValue;
    widget.onChapterChanged?.call(_currentValue);
  }

  void _gotoEpubCfi(
    String? epubCfi, {
    double alignment = 0,
    Duration duration = const Duration(milliseconds: 250),
    Curve curve = Curves.linear,
  }) {
    _epubCfiReader?.epubCfi = epubCfi;
    final index = _epubCfiReader?.paragraphIndexByCfiFragment;

    if (index == null) {
      return;
    }

    _itemScrollController?.scrollTo(
      index: index,
      duration: duration,
      alignment: alignment,
      curve: curve,
    );
  }

  void _onLinkPressed(String href) {
    if (href.contains('://')) {
      widget.onExternalLinkPressed?.call(href);
      return;
    }

    // Chapter01.xhtml#ph1_1 -> [ph1_1, Chapter01.xhtml] || [ph1_1]
    String? hrefIdRef;
    String? hrefFileName;

    if (href.contains('#')) {
      final dividedHref = href.split('#');
      if (dividedHref.length == 1) {
        hrefIdRef = href;
      } else {
        hrefFileName = dividedHref[0];
        hrefIdRef = dividedHref[1];
      }
    } else {
      hrefFileName = href;
    }

    if (hrefIdRef == null) {
      final chapter = _chapterByFileName(hrefFileName);
      if (chapter != null) {
        final cfi = _epubCfiReader?.generateCfiChapter(
          book: _controller._document,
          chapter: chapter,
          additional: ['/4/2'],
        );

        _gotoEpubCfi(cfi);
      }
      return;
    } else {
      final paragraph = _paragraphByIdRef(hrefIdRef);
      final chapter =
          paragraph != null ? _chapters[paragraph.chapterIndex] : null;

      if (chapter != null && paragraph != null) {
        final paragraphIndex =
            _epubCfiReader?.getParagraphIndexByElement(paragraph.element);
        final cfi = _epubCfiReader?.generateCfi(
          book: _controller._document,
          chapter: chapter,
          paragraphIndex: paragraphIndex,
        );

        _gotoEpubCfi(cfi);
      }

      return;
    }
  }

  Paragraph? _paragraphByIdRef(String idRef) =>
      _paragraphs.firstWhereOrNull((paragraph) {
        if (paragraph.element.id == idRef) {
          return true;
        }

        return paragraph.element.children.isNotEmpty &&
            paragraph.element.children[0].id == idRef;
      });

  EpubChapter? _chapterByFileName(String? fileName) =>
      _chapters.firstWhereOrNull((chapter) {
        if (fileName != null) {
          if (chapter.ContentFileName!.contains(fileName)) {
            return true;
          } else {
            return false;
          }
        }
        return false;
      });

  int _getChapterIndexBy({
    required int positionIndex,
    double? trailingEdge,
    double? leadingEdge,
  }) {
    final posIndex = _getAbsParagraphIndexBy(
      positionIndex: positionIndex,
      trailingEdge: trailingEdge,
      leadingEdge: leadingEdge,
    );
    final index = posIndex >= _chapterIndexes.last
        ? _chapterIndexes.length
        : _chapterIndexes.indexWhere((chapterIndex) {
            if (posIndex < chapterIndex) {
              return true;
            }
            return false;
          });

    return index - 1;
  }

  int _getParagraphIndexBy({
    required int positionIndex,
    double? trailingEdge,
    double? leadingEdge,
  }) {
    final posIndex = _getAbsParagraphIndexBy(
      positionIndex: positionIndex,
      trailingEdge: trailingEdge,
      leadingEdge: leadingEdge,
    );

    final index = _getChapterIndexBy(positionIndex: posIndex);

    if (index == -1) {
      return posIndex;
    }

    return posIndex - _chapterIndexes[index];
  }

  int _getAbsParagraphIndexBy({
    required int positionIndex,
    double? trailingEdge,
    double? leadingEdge,
  }) {
    int posIndex = positionIndex;
    if (trailingEdge != null &&
        leadingEdge != null &&
        trailingEdge < _minTrailingEdge &&
        leadingEdge < _minLeadingEdge) {
      posIndex += 1;
    }

    return posIndex;
  }

  Size _getSize(GlobalKey key) {
    RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      return renderBox.size;
    } else {
      return Size.zero;
    }
  }

  Future<void> _buildPage(int pageIndex) async {
    if (_isBuilding) {
      return;
    }

    _isBuilding = true;
    while (true) {
      var done = false;
      await Future.delayed(const Duration(milliseconds: 5), () {
        done = _viewTempKey.currentWidget != null;
      });

      if (done) {
        break;
      }

      await Future.delayed(Duration.zero, () {
        setState(() {});
      });
    }

    _pageParagraphs[pageIndex] =
        await (_viewTempKey.currentState as _EpubViewTempBuilderState)
            .getPageParagraphs(pageIndex, _controller.fontSize.value);

    if (_pageParagraphs[pageIndex]!.isEmpty) {
      _canBuildNextPage = false;
    } else {
      _readyPages.add(pageIndex);
      _canBuildNextPage = true;
    }
    _isBuilding = false;
    await Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  Future<void> _buildPages() async {
    await _buildPage(0);
    _canBuildNextPage = true;

    // print((_viewTempKey.currentWidget as EpubViewTempBuilder).debug);
    // _pageParagraphs.clear();
    //
    // for (var index = 0; index < 3; index++) {
    //   if (_allPagesDrawn()) {
    //     break;
    //   }
    //
    //   _pageParagraphs.add([]);
    //   await _buildPage(index);
    //
    //   if (_pageParagraphs.length > 3) {
    //     _controller.loadingState.value = EpubViewLoadingState.success;
    //   }
    // }
    //
    // if (!_allPagesDrawn()) {
    //   _pageParagraphs.add([]);
    // }
    //
    // print(_pageParagraphs.length);
  }

  void _rebuildPages() {
    _readyPages.clear();
    _pageParagraphs.clear();
    setState(() {});
  }

  static Widget _chapterDividerBuilder(EpubChapter chapter) => Container(
        height: 56,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0x24000000),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          chapter.Title ?? '',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  static Widget _chapterBuilder(
    BuildContext context,
    EpubViewBuilders builders,
    EpubBook document,
    List<EpubChapter> chapters,
    List<Paragraph> paragraphs,
    int index,
    int chapterIndex,
    int paragraphIndex,
    ExternalLinkPressed onExternalLinkPressed,
  ) {
    if (paragraphs.isEmpty) {
      return Container();
    }

    final defaultBuilder = builders as EpubViewBuilders<DefaultBuilderOptions>;
    final options = defaultBuilder.options;
    print('------');
    print('-----');
    print('----');
    print('---');
    print('--');
    print(index);
    print(paragraphs.length);
    print(paragraphs[index].element);
    print(paragraphs[index].element.outerHtml);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (chapterIndex >= 0 && paragraphIndex == 0)
          builders.chapterDividerBuilder(chapters[chapterIndex]),
        Html(
          data: paragraphs[index].element.outerHtml,
          onLinkTap: (href, _, __, ___) => onExternalLinkPressed(href!),
          style: {
            'html': Style(
              padding: options.paragraphPadding as EdgeInsets?,
              fontFamily: 'Letirata',
            ).merge(Style.fromTextStyle(options.textStyle)),
          },
          customRenders: {
            tagMatcher('img'):
                CustomRender.widget(widget: (context, buildChildren) {
              // return SizedBox.shrink();
              String url = context.tree.element!.attributes['src']!
                  .replaceAll('../', '');

              EpubByteContentFile? images = document.Content!.Images![url];

              if (images == null) {
                var charMap = <String, String>{
                  '!': '%21',
                  '#': '%23',
                  '\$': '%24',
                  '&': '%26',
                  '\'': '%27',
                  '(': '%28',
                  ')': '%29',
                  '*': '%2A',
                  '+': '%2B',
                  ',': '%2C',
                  '/': '%2F',
                  ':': '%3A',
                  ';': '%3B',
                  '=': '%3D',
                  '?': '%3F',
                  '@': '%40',
                  '[': '%5B',
                  ']': '%5D',
                };

                for (var char in charMap.keys) {
                  var charReplacement = charMap[char]!;
                  url = url.replaceAll(char, charReplacement);
                }

                images = document.Content!.Images![url];
              }

              if (images == null) {
                return SizedBox.shrink();
              }
              try {
                return Image(
                  image: MemoryImage(
                    Uint8List.fromList(
                      document.Content!.Images![url]!.Content!,
                    ),
                  ),
                );
              } catch (e) {
                return SizedBox.shrink();
              }
            }),
          },
        ),
      ],
    );
  }

  Widget _horizontalChapterBuilder(
    BuildContext context,
    EpubViewBuilders builders,
    EpubBook document,
    List<EpubChapter> chapters,
    List<Paragraph> paragraphs,
    int index,
    int chapterIndex,
    int paragraphIndex,
    ExternalLinkPressed onExternalLinkPressed,
  ) {
    final List<Widget> widgets = [];

    Widget loader = SizedBox(
      width: _getSize(_containerKey).width,
      child: const Center(
        key: Key('epub.page.loading'),
        child: CircularProgressIndicator(),
      ),
    );

    if (_pageParagraphs.containsKey(index)) {
      if (!_readyPages.contains(index)) {
        return loader;
      }

      for (var _chapter in _pageParagraphs[index] ?? []) {
        widgets.add(
          widget.builders.chapterBuilder(
            context,
            builders,
            document,
            chapters,
            paragraphs,
            _chapter,
            _chapter,
            _chapter,
            onExternalLinkPressed,
          ),
        );
      }
    } else {
      _buildPage(index);
      return loader;
    }

    return Column(
      children: widgets,
    );
  }

  Widget _buildLoaded(BuildContext context) {
    if (widget.controller.hideScrollView.value) {
      return Container();
    }

    print('paragraphs length');
    print(_paragraphs.length);
    return ScrollablePositionedList.builder(
      initialScrollIndex: _epubCfiReader!.paragraphIndexByCfiFragment ?? 0,
      itemCount: widget.controller.isVertical.value
          ? _paragraphs.length
          : _pageParagraphs.length + (_canBuildNextPage ? 1 : 0),
      itemScrollController: _itemScrollController,
      itemPositionsListener: _itemPositionListener,
      scrollDirection:
          widget.controller.isVertical.value ? Axis.vertical : Axis.horizontal,
      physics: widget.controller.isVertical.value
          ? const BouncingScrollPhysics()
          : const PageScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // print('papa length');
        // print(_pageParagraphs.length);
        // print('build item');
        // print(index);
        return (widget.controller.isVertical.value
            ? widget.builders.chapterBuilder
            : _horizontalChapterBuilder)(
          context,
          widget.builders,
          widget.controller._document!,
          _chapters,
          _paragraphs,
          index,
          _getChapterIndexBy(positionIndex: index),
          _getParagraphIndexBy(positionIndex: index),
          _onLinkPressed,
        );
      },
    );
  }

  static Widget _builder(
    BuildContext context,
    EpubViewBuilders builders,
    EpubViewLoadingState state,
    WidgetBuilder loadedBuilder,
    Exception? loadingError,
  ) {
    final Widget content = () {
      switch (state) {
        case EpubViewLoadingState.loading:
          return KeyedSubtree(
            key: const Key('epubx.root.loading'),
            child: builders.loaderBuilder?.call(context) ?? const SizedBox(),
          );
        case EpubViewLoadingState.error:
          return KeyedSubtree(
            key: const Key('epubx.root.error'),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: builders.errorBuilder?.call(context, loadingError!) ??
                  Center(child: Text(loadingError.toString())),
            ),
          );
        case EpubViewLoadingState.success:
          return KeyedSubtree(
            key: const Key('epubx.root.success'),
            child: loadedBuilder(context),
          );
      }
    }();

    final defaultBuilder = builders as EpubViewBuilders<DefaultBuilderOptions>;
    final options = defaultBuilder.options;

    return AnimatedSwitcher(
      duration: options.loaderSwitchDuration,
      transitionBuilder: options.transitionBuilder,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      constraints: const BoxConstraints(
        minHeight: double.infinity,
        minWidth: double.infinity,
      ),
      child: Stack(
        children: [
          widget.builders.builder(
            context,
            widget.builders,
            _controller.loadingState.value,
            _buildLoaded,
            _loadingError,
          ),
          if (widget.controller.isBookLoaded.value)
            EpubViewTempBuilder(
              key: _viewTempKey,
              containerKey: _containerKey,
              debug: false,
              builders: widget.builders,
              document: widget.controller._document!,
              chapters: _chapters,
              paragraphs: _paragraphs,
              getChapterIndexBy: _getChapterIndexBy,
              getParagraphIndexBy: _getParagraphIndexBy,
            ),
        ],
      ),
    );
  }
}

class EpubViewTempBuilder extends StatefulWidget {
  const EpubViewTempBuilder({
    Key? key,
    required this.containerKey,
    this.debug = false,
    required this.builders,
    required this.document,
    required this.chapters,
    required this.paragraphs,
    required this.getChapterIndexBy,
    required this.getParagraphIndexBy,
  }) : super(key: key);

  final GlobalKey containerKey;
  final bool debug;
  final EpubViewBuilders builders;
  final EpubBook document;
  final List<EpubChapter> chapters;
  final List<Paragraph> paragraphs;
  final int Function({
    required int positionIndex,
    double? trailingEdge,
    double? leadingEdge,
  }) getChapterIndexBy;
  final int Function({
    required int positionIndex,
    double? trailingEdge,
    double? leadingEdge,
  }) getParagraphIndexBy;

  @override
  State<EpubViewTempBuilder> createState() => _EpubViewTempBuilderState();
}

class _EpubViewTempBuilderState extends State<EpubViewTempBuilder> {
  final GlobalKey _offstageKey = GlobalKey();
  String _offstageWidgetKey = '_offstageWidgetKey';
  Widget _offstageWidget = const SizedBox.shrink();
  Map<int, Map<double, List<int>>> pageFontParagraphs = {};

  Size _getSize(GlobalKey key) {
    RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      return renderBox.size;
    } else {
      return Size.zero;
    }
  }

  Future<List<int>> getPageParagraphs(int pageIndex, double fontSize) async {
    Size containerSize = _getSize(widget.containerKey);
    double height = containerSize.height;
    Map<double, List<int>> pageFont = pageFontParagraphs[pageIndex] ??
        {
          fontSize: [],
        };

    if (pageFontParagraphs[pageIndex] == null) {
      pageFontParagraphs[pageIndex] = pageFont;
    }

    List<int> page = pageFont[fontSize] ?? [];

    if (pageFont[fontSize] == null) {
      pageFont[fontSize] = page;
    }

    int paragraphIndex = 0;

    if (pageIndex != 0) {
      var tempPage = pageIndex - 1;
      while (tempPage >= 0) {
        List<int>? prevPage = pageFontParagraphs[tempPage]?[fontSize];
        if (prevPage == null) {
          tempPage--;
          continue;
        }
        if (prevPage.isEmpty) {
          tempPage--;
          continue;
        }

        paragraphIndex = prevPage[prevPage.length - 1] + 1;
        break;
      }
    }

    while (true) {
      try {
        _offstageWidget = widget.builders.chapterBuilder(
          context,
          widget.builders,
          widget.document,
          widget.chapters,
          widget.paragraphs,
          paragraphIndex,
          widget.getChapterIndexBy(positionIndex: paragraphIndex),
          widget.getParagraphIndexBy(positionIndex: paragraphIndex),
          (_) {},
        );
      } catch (e) {
        await Future.delayed(Duration.zero, () {
          setState(() {});
        });
        return page;
      }
      _offstageWidgetKey = '_offstageWidgetKey$page';

      await Future.delayed(Duration.zero, () {
        setState(() {});
      });
      await Future.delayed(const Duration(milliseconds: 100));

      Size widgetSize = _getSize(_offstageKey);

      if (height - widgetSize.height >= 0) {
        page.add(paragraphIndex);
        height -= widgetSize.height;
        paragraphIndex++;
      } else {
        await Future.delayed(Duration.zero, () {
          setState(() {});
        });
        return page;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.debug ? 0.6 : 0,
      key: _offstageKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade200,
        ),
        key: Key(_offstageWidgetKey),
        child: _offstageWidget,
      ),
    );
  }
}
