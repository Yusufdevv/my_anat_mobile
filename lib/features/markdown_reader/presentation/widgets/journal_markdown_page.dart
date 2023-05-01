import 'dart:async';
import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  WebViewController? webViewController;
  late VerticalDragGestureRecognizer verticalRecognizer;
  bool buttonshow = false;
  late String theData;

  void scrollToTop() {}

  @override
  void initState() {
    super.initState();
    if (widget.data.isEmpty) {
      log(':::::::::: widget data init:  ${widget.data}  ::::::::::');
    }
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(widget.data);
    theData = widget.data;
    verticalRecognizer = VerticalDragGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReaderControllerBloc, ReaderControllerState>(
      listenWhen: (state1, state2) {
        return state1.fontSizeIndex != state2.fontSizeIndex;
      },
      listener: (context, state) async {
        if (webViewController != null) {
          theData = MyFunctions.setBaseSize(cssCode: theData, fontSize: fontSizesInPixels[state.fontSizeIndex]);
          await webViewController!.loadHtmlString(theData);
        }
      },
      child: Stack(
        children: [
          if (widget.data.isEmpty) ...{
            SingleChildScrollView(
              child: EmptyWidget(
                title: LocaleKeys.no_specialists.tr(),
                content: LocaleKeys.no_specialists.tr(),
              ),
            )
          } else ...{
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onTap,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: WebViewWidget(controller: webViewController!),
              ),
            ),
          },
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedCrossFade(
              secondChild: const SizedBox(width: double.maxFinite),
              firstCurve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 300),
              crossFadeState: buttonshow ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: WScaleAnimation(
                onTap: scrollToTop,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                      right: 24,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: textColor.withOpacity(0.16),
                          offset: const Offset(2, 6),
                          blurRadius: 18,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(AppIcons.arrowUp, width: 28, height: 28, color: primary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
