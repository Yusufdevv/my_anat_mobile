import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/markdown_reader/data/repositories/journal_pages_repository_impl.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_table_of_contents.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/journal_markdown_page.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/journal_menu.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/journal_table_of_contents.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/reader_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class JournalMarkdownPageReader extends StatefulWidget {
  final String slug;
  final bool isPreview;
  final String title;

  const JournalMarkdownPageReader(
      {required this.slug,
      this.isPreview = false,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<JournalMarkdownPageReader> createState() =>
      _JournalMarkdownPageReaderState();
}

class _JournalMarkdownPageReaderState extends State<JournalMarkdownPageReader>
    with TickerProviderStateMixin {
  bool showController = false;
  bool showContents = false;
  bool showTableOfContents = false;
  bool showSettings = false;
  late PageController _pageController;
  late ItemScrollController _itemScrollController;


  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JournalPagesBloc(
            getJournalPagesUseCase: GetJournalPagesUseCase(
              repository: serviceLocator<JournalPagesRepositoryImpl>(),
            ),
            getJournalContentsUseCase: GetJournalContentsUseCase(
              repository: serviceLocator<JournalPagesRepositoryImpl>(),
            ),
          )
            ..add(GetJournalPages(slug: widget.slug))
            ..add(GetJournalTableOfContents(slug: widget.slug)),
        ),
        BlocProvider(
          create: (context) => ReaderControllerBloc(),
        ),
      ],
      child: BlocBuilder<ReaderControllerBloc, ReaderControllerState>(
        builder: (context, controllerState) {
          return Scaffold(
            backgroundColor: controllerState.selectedColor,
            appBar: AppBar(
              elevation: 4,
              shadowColor: grey.withOpacity(0.08),
              leadingWidth: 56,
              titleSpacing: 0,
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: controllerState.selectedTextColor, fontSize: 15),
              ),
              leading: WScaleAnimation(
                onTap: () {
                  if (showController ||
                      showSettings ||
                      showContents ||
                      showTableOfContents) {
                    setState(() {
                      showContents = false;
                      showTableOfContents = false;
                      showSettings = false;
                      showController = false;
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: SvgPicture.asset(
                    AppIcons.chevronLeft,
                    color: textSecondary,
                  ),
                ),
              ),
              actions: [
                WScaleAnimation(
                  onTap: () {
                    setState(() {
                      showSettings = false;
                      showController = !showController;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 6)
                            .copyWith(right: 20),
                    child: SvgPicture.asset(
                      AppIcons.journalMenu,
                      width: 22,
                      height: 22,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ],
            ),
            body: BlocBuilder<JournalPagesBloc, JournalPagesState>(
              builder: (context, state) {
                if (state.getJournalPagesStatus.isSubmissionInProgress) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state.getJournalPagesStatus.isSubmissionSuccess) {
                  var pages = state.pages;
                  if (widget.isPreview) {
                    pages = state.pages
                        .where((element) => element.preview)
                        .toList();
                  }
                  return Stack(
                    children: [
                      Positioned.fill(
                        bottom: MediaQuery.of(context).padding.bottom,
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 150),
                          crossFadeState: showTableOfContents
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: JournalTableOfContents(
                            onTap: (page) {
                              _pageController.animateToPage(page - 1,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear);
                              setState(() {
                                showTableOfContents = false;
                              });
                            },
                          ),
                          secondChild: AnimatedCrossFade(
                            firstChild: Center(
                              child: SizedBox(
                                height: 220,
                                child: ScrollablePositionedList.separated(
                                  itemScrollController: _itemScrollController,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showContents = !showContents;
                                      });
                                      _pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.linear);
                                    },
                                    child: WImage(
                                      height: 220,
                                      width: 160,
                                      fit: BoxFit.cover,
                                      imageUrl: state.pages
                                          .map((e) => e.imgContent)
                                          .toList()[index],
                                    ),
                                  ),
                                  itemCount: state.pages.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 12),
                                ),
                              ),
                            ),
                            secondChild: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showController = false;
                                });
                              },
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: MediaQuery.of(context)
                                            .size
                                            .height -
                                        (MediaQuery.of(context).padding.bottom +
                                            MediaQuery.of(context).padding.top +
                                            kToolbarHeight)),
                                child: PageView.builder(
                                  controller: _pageController,
                                  onPageChanged: (index) {
                                    context
                                        .read<ReaderControllerBloc>()
                                        .add(SetWebPage(index: index));
                                  },
                                  itemBuilder: (context, index) {
                                    if (index == pages.length) {
                                      context
                                          .read<JournalPagesBloc>()
                                          .add(GetMoreJournalPages());
                                      return const Center(
                                        child: CupertinoActivityIndicator(),
                                      );
                                    }
                                    return BlocBuilder<ReaderControllerBloc,
                                        ReaderControllerState>(

                                      builder: (context, state) {
                                        return JournalMarkdownPage(
                                          onTap: () {
                                            setState(() {
                                              showController = false;
                                            });
                                          },
                                          data: state.isRussian
                                              ? pages[index].contentRu
                                              : pages[index].contentUz,
                                        );
                                      },
                                    );
                                  },
                                  itemCount: state.fetchMore
                                      ? pages.length + 1
                                      : pages.length,
                                ),
                              ),
                            ),
                            duration: const Duration(milliseconds: 150),
                            crossFadeState: showContents
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: AnimatedCrossFade(
                          secondChild: const ReaderController(

                          ),
                          duration: const Duration(milliseconds: 150),
                          crossFadeState: showSettings
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          firstChild: AnimatedCrossFade(
                            firstChild: JournalMenu(
                              onContentTap: () {
                                setState(() {
                                  showTableOfContents = true;
                                  showController = false;
                                });
                              },
                              onPreviewTap: () {
                                setState(() {
                                  showContents = true;
                                  showController = false;
                                });
                              },
                              onSettingsTap: () {
                                setState(() {
                                  showSettings = true;
                                  showController = false;
                                });
                              },
                            ),
                            secondChild: const SizedBox(width: 217),
                            duration: const Duration(milliseconds: 200),
                            crossFadeState: showController
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state.getJournalPagesStatus.isSubmissionFailure) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
