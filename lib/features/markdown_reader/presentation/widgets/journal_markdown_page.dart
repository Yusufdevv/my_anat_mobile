import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
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
  late WebViewController webViewController;
  late VerticalDragGestureRecognizer verticalRecognizer;
  bool buttonshow = false;

  void scrollToTop() {
    webViewController
        .runJavascript("window.scrollTo({top: 0, behavior: 'smooth'});");
  }

  @override
  void initState() {
    verticalRecognizer = VerticalDragGestureRecognizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<ReaderControllerBloc, ReaderControllerState>(listenWhen: (state1,state2){
      return state1.isRussian==state2.isRussian;
    },
      listener: (context, state) {
        webViewController.runJavascript(state.jsFunction);
      },
      child: BlocListener<ReaderControllerBloc, ReaderControllerState>(
        listenWhen: (state1, state2) {

          return state1.isRussian != state2.isRussian;
        },
        listener: (context, state) {
          print('setting html');

          webViewController.loadHtmlString(widget.data);
        },
        child: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onTap,
              child: WebView(
                initialUrl: '',
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
                        if (scrollOffset != null &&
                            scrollOffset / deviceHeight > 1) {
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
                  if (request.url.contains('about:blank') ||
                      request.url.contains(RegExp(
                          r'''(?:https?:\/\/)?(?:www\.)?youtu\.?be(?:\.com)?\/?.*(?:watch|embed)?(?:.*v=|v\/|\/)([\w\-_]+)\&?'''))) {
                    return NavigationDecision.navigate;
                  } else {
                    launchUrlString(request.url,
                        mode: LaunchMode.externalApplication);
                    return NavigationDecision.prevent;
                  }
                },
                gestureNavigationEnabled: true,
                debuggingEnabled: true,
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                      () => verticalRecognizer),
                },
              ),
              // child: InAppWebView(
              //   onWebViewCreated: (controller) {
              //     _controller = controller;
              //   },
              //   shouldOverrideUrlLoading: (controller, shouldOverrideUrlLoadingRequest) async {
              //     final url = await controller.getUrl();
              //     print('here it is ad url: $url');
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
              bottom: MediaQuery.of(context).padding.bottom + 16,
              right: 24,
              left: 24,
              child: AnimatedCrossFade(
                secondChild: const SizedBox(
                  width: double.maxFinite,
                ),
                duration: const Duration(milliseconds: 150),
                crossFadeState: buttonshow
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: WScaleAnimation(
                  onTap: scrollToTop,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: textColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.back_to_top.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 15),
                        ),
                        SvgPicture.asset(AppIcons.arrowUp)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
