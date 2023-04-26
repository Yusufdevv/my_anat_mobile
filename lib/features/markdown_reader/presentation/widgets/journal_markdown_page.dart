import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
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
  late WebViewController webViewController;
  late VerticalDragGestureRecognizer verticalRecognizer;
  bool buttonshow = false;

  void scrollToTop() {
    webViewController.runJavascript("window.scrollTo({top: 0, behavior: 'smooth'});");
  }

  @override
  void initState() {
    verticalRecognizer = VerticalDragGestureRecognizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('::::::::::  THE DATA ${widget.data}  ::::::::::');
    return BlocListener<ReaderControllerBloc, ReaderControllerState>(
      listenWhen: (state1, state2) {
        return state1.isRussian != state2.isRussian;
      },
      listener: (context, state) {
        webViewController.loadHtmlString(widget.data);
      },
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.onTap,
            child: WebView(
              initialUrl: widget.data,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                webViewController = controller;
                webViewController.loadHtmlString(widget.data);
              },
              javascriptChannels: {
                JavascriptChannel(
                    name: 'FLUTTER_CHANNEL',
                    onMessageReceived: (message) {
                      final scrollOffset = double.tryParse(message.message);
                      final deviceHeight = MediaQuery.of(context).size.height;
                      if (scrollOffset != null && scrollOffset / deviceHeight > 1) {
                        setState(() {
                          buttonshow = true;
                        });
                      } else {
                        setState(() {
                          buttonshow = false;
                        });
                      }
                    })
              },
              navigationDelegate: (NavigationRequest request) {
                log(':::::::::: Navigation request url:  ${request.url}  ::::::::::');
                if (request.url.contains('about:blank') ||
                    request.url.contains(RegExp(
                        r'''(?:https?:\/\/)?(?:www\.)?youtu\.?be(?:\.com)?\/?.*(?:watch|embed)?(?:.*v=|v\/|\/)([\w\-_]+)\&?'''))) {
                  return NavigationDecision.navigate;
                } else {
                  launchUrlString(request.url, mode: LaunchMode.externalApplication);
                  return NavigationDecision.prevent;
                }
              },
              gestureNavigationEnabled: true,
              debuggingEnabled: true,
              gestureRecognizers: {
                Factory<OneSequenceGestureRecognizer>(() => verticalRecognizer),
              },
            ),
            // child: InAppWebView(
            //   onWebViewCreated: (controller) {
            //     _controller = controller;
            //   },
            //   shouldOverrideUrlLoading: (controller, shouldOverrideUrlLoadingRequest) async {
            //     final url = await controller.getUrl();
            //     return NavigationActionPolicy.ALLOW;
            //   },
            //   initialData: InAppWebViewInitialData(data: widget.data, mimeType: 'text/html'),
            //   gestureRecognizers: {
            //     Factory<OneSequenceGestureRecognizer>(
            //       () => VerticalDragGestureRecognizer(),
            //     ),
            //   },
            //   initialOptions: options,
            // ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedCrossFade(
              secondChild: const SizedBox(
                width: double.maxFinite,
              ),
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
