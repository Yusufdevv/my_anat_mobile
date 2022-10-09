import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String page;
  const WebViewScreen({required this.page, Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: white),
      child: WillPopScope(
        onWillPop: () async {
          print(await _controller.canGoBack());
          if (await _controller.canGoBack()) {
            await _controller.goBack();
            return false;
          } else {
            Navigator.of(context).pop();
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 0,
            elevation: 1,
            shadowColor: textSecondary,
            title: const HospitalSingleAppBarBody(
                // onPop: () async {
                //   // if (await _controller.canGoBack()) {
                //   //   await _controller.goBack();
                //   // } else {
                //     Navigator.of(context).pop();
                //   //}
                // },
                ),
          ),
          body: WebView(
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            initialUrl:
                'https://anatomica.uicgroup.tech/mobile-auth/?token=${StorageRepository.getString("token")}&mobile=true&page=${widget.page}',
          ),
        ),
      ),
    );
  }
}
