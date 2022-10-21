import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/markdown_reader/data/repositories/journal_pages_repository_impl.dart';
import 'package:anatomica/features/markdown_reader/domain/usecases/get_journal_pages_usecase.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/reader_controller.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/w_app_bar_with_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
    return BlocProvider(
      create: (context) => JournalPagesBloc(
          getJournalPagesUseCase: GetJournalPagesUseCase(repository: serviceLocator<JournalPagesRepositoryImpl>()))
        ..add(GetJournalPages(slug: widget.slug)),
      child: Scaffold(
        appBar: WAppBarWithButtons(
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
                        );
                      },
                      itemCount: state.fetchMore ? pages.length + 1 : pages.length,
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
      ),
    );
  }
}

class JournalMarkdownPage extends StatefulWidget {
  final String data;
  const JournalMarkdownPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<JournalMarkdownPage> createState() => _JournalMarkdownPageState();
}

class _JournalMarkdownPageState extends State<JournalMarkdownPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Markdown(
      styleSheet: MarkdownStyleSheet(),
      padding: EdgeInsets.fromLTRB(16, mediaQueryData.padding.top, 16, mediaQueryData.padding.bottom),
      data: widget.data,
      imageBuilder: (uri, title, alt) => WImage(
        imageUrl: uri.toString(),
      ),
    );
  }
}
