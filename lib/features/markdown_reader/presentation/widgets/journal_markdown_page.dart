import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  // late InAppWebViewController _controller;
  // late InAppWebViewGroupOptions options;
  late WebViewController webViewController;

  @override
  void initState() {
    // options = InAppWebViewGroupOptions(
    //   crossPlatform: InAppWebViewOptions(
    //     verticalScrollBarEnabled: true,
    //     supportZoom: false,
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReaderControllerBloc, ReaderControllerState>(
      listener: (context, state) {
        webViewController.runJavascript(state.jsFunction);
        // _controller.evaluateJavascript(source: state.jsFunction);
      },
      builder: (context, state) => GestureDetector(
        onTap: widget.onTap,
        child: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            webViewController = controller;
            webViewController.loadHtmlString(widget.data);
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://google.com/')) {
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            } else {
              print('Opening Default Browser');
              launchUrlString(request.url); // to open browser
              return NavigationDecision.prevent;
            }
          },
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
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
    );
  }
}
