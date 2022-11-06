import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/markdown_reader/data/repositories/journal_pages_repository_impl.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/reader_controller.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/w_app_bar_with_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class JournalMarkdownPageReader extends StatefulWidget {
  final String slug;
  final bool isPreview;
  final String title;

  const JournalMarkdownPageReader({required this.slug, this.isPreview = false, required this.title, Key? key})
      : super(key: key);

  @override
  State<JournalMarkdownPageReader> createState() => _JournalMarkdownPageReaderState();
}

class _JournalMarkdownPageReaderState extends State<JournalMarkdownPageReader> {
  bool showController = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JournalPagesBloc(
              getJournalPagesUseCase: GetJournalPagesUseCase(repository: serviceLocator<JournalPagesRepositoryImpl>()))
            ..add(GetJournalPages(slug: widget.slug)),
        ),
        BlocProvider(
          create: (context) => ReaderControllerBloc(),
        ),
      ],
      child: BlocBuilder<ReaderControllerBloc, ReaderControllerState>(
        builder: (context, controllerState) {
          return Scaffold(
            backgroundColor: controllerState.selectedColor,
            appBar: WAppBarWithButtons(
              backgroundColor: !(controllerState.selectedColor.red > 200) ? textColor : white,
              titleColor: controllerState.selectedTextColor,
              title: widget.title,
              onTitleTap: () {
                setState(() {
                  showController = false;
                });
              },
              buttons: Row(
                children: [
                  WScaleAnimation(
                    onTap: () {
                      setState(() {
                        showController = !showController;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        AppIcons.setting,
                        width: 22,
                        height: 22,
                        color: textSecondary,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
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
                    pages = state.pages.where((element) => element.preview).toList();
                  }
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showController = false;
                            });
                          },
                          child: PageView.builder(
                            onPageChanged: (index) {
                              context.read<ReaderControllerBloc>().add(SetWebPage());
                            },
                            itemBuilder: (context, index) {
                              if (index == pages.length) {
                                context.read<JournalPagesBloc>().add(GetMoreJournalPages());
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                              return JournalMarkdownPage(
                                onTap: () {
                                  setState(() {
                                    showController = false;
                                  });
                                },
                                data: pages[index].content,
                              );
                            },
                            itemCount: state.fetchMore ? pages.length + 1 : pages.length,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 20,
                        child: AnimatedCrossFade(
                          firstChild: const ReaderController(),
                          secondChild: const SizedBox(width: 300),
                          duration: const Duration(milliseconds: 200),
                          crossFadeState: showController ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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

class JournalMarkdownPage extends StatefulWidget {
  final String data;
  final VoidCallback onTap;

  const JournalMarkdownPage({
    required this.data,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<JournalMarkdownPage> createState() => _JournalMarkdownPageState();
}

class _JournalMarkdownPageState extends State<JournalMarkdownPage> {
  //late WebViewController _controller;
  late InAppWebViewController _controller;
  late InAppWebViewGroupOptions options;

  @override
  void initState() {
    options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(verticalScrollBarEnabled: true, supportZoom: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data);
    return BlocConsumer<ReaderControllerBloc, ReaderControllerState>(
      listener: (context, state) {
        _controller.evaluateJavascript(source: state.jsFunction);
      },
      builder: (context, state) => GestureDetector(
        onTap: widget.onTap,
        child: InAppWebView(
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          initialData: InAppWebViewInitialData(data: widget.data, mimeType: 'text/html'),
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          },
          initialOptions: options,
        ),
      ),
    );
  }
}
