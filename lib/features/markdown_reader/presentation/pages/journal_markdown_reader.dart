import 'dart:convert';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                            itemBuilder: (context, index) {
                              if (index == pages.length) {
                                context.read<JournalPagesBloc>().add(GetMoreJournalPages());
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                              return JournalMarkdownPage(
                                data: pages[index].content,
                                path: state.pagePath,
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
  final String path;

  const JournalMarkdownPage({
    required this.data,
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  State<JournalMarkdownPage> createState() => _JournalMarkdownPageState();
}

class _JournalMarkdownPageState extends State<JournalMarkdownPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ReaderControllerBloc, ReaderControllerState>(
      builder: (context, state) {
        //return SingleChildScrollView(child: Text(widget.data));
        //log(widget.data);
        log(Uri.dataFromString(
                widget.data.replaceAll(
                    RegExp(r'''<body[^>]+class\s*=\s*['"]([^'"]+)['"][^>]*>''').firstMatch(widget.data)?.group(1) ?? '',
                    'dsa'),
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8'))
            .toString());
        // log(widget.data.replaceAll(
        //     RegExp(r'''<body[^>]+class\s*=\s*['"]([^'"]+)['"][^>]*>''').firstMatch(widget.data)?.group(1) ?? '',
        //     'yellow'));
        return WebView(
          initialUrl: Uri.dataFromString(
                  widget.data.replaceAll(
                      RegExp(r'''<body[^>]+class\s*=\s*['"]([^'"]+)['"][^>]*>''').firstMatch(widget.data)?.group(1) ??
                          '',
                      'dsa'),
                  mimeType: 'text/html',
                  encoding: Encoding.getByName('utf-8'))
              .toString(),
        );
        // return Markdown(
        //   physics: BouncingScrollPhysics(),
        //   styleSheet: MarkdownStyleSheet(
        //     a: TextStyle(color: state.selectedTextColor, fontFamily: state.selectedFontFamily),
        //     blockquote: TextStyle(
        //         color: state.selectedTextColor,
        //         fontWeight: FontWeight.w400,
        //         fontSize: 15 * state.fontSizePercentage,
        //         fontFamily: state.selectedFontFamily),
        //     checkbox: TextStyle(color: state.selectedTextColor, fontFamily: state.selectedFontFamily),
        //     code: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //     ),
        //     del: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //     ),
        //     em: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 16 * state.fontSizePercentage,
        //     ),
        //     h1: TextStyle(
        //         color: state.selectedTextColor,
        //         fontWeight: FontWeight.w700,
        //         fontSize: 32 * state.fontSizePercentage,
        //         fontFamily: state.selectedFontFamily),
        //     h2: TextStyle(
        //       color: state.selectedTextColor,
        //       fontWeight: FontWeight.w600,
        //       fontSize: 26 * state.fontSizePercentage,
        //       fontFamily: state.selectedFontFamily,
        //     ),
        //     h3: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 22 * state.fontSizePercentage,
        //     ),
        //     h4: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 20 * state.fontSizePercentage,
        //     ),
        //     h5: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 18 * state.fontSizePercentage,
        //     ),
        //     h6: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 16 * state.fontSizePercentage,
        //     ),
        //     img: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 22 * state.fontSizePercentage,
        //     ),
        //     listBullet: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 22 * state.fontSizePercentage,
        //     ),
        //     p: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 16 * state.fontSizePercentage,
        //     ),
        //     strong: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 16 * state.fontSizePercentage,
        //     ),
        //     tableBody: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 18 * state.fontSizePercentage,
        //     ),
        //     tableHead: TextStyle(
        //       color: state.selectedTextColor,
        //       fontFamily: state.selectedFontFamily,
        //       fontSize: 20 * state.fontSizePercentage,
        //     ),
        //   ),
        //   padding: EdgeInsets.fromLTRB(24, mediaQueryData.padding.top + 16, 24, mediaQueryData.padding.bottom),
        //   data: widget.data,
        //   imageBuilder: (uri, title, alt) => WImage(
        //     imageUrl: uri.toString(),
        //   ),
        // );
      },
    );
  }
}
