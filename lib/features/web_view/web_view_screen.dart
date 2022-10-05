import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    print(StorageRepository.getString('token'));
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: white),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: InAppWebView(
          onWebViewCreated: (controller) {},
          initialUrlRequest: URLRequest(
            url: Uri.parse(
                'https://anatomica.uicgroup.tech/page-test/?token=${StorageRepository.getString("token")}&mobile=true'),
          ),
        ),
        // WebView(
        //   javascriptMode: JavascriptMode.unrestricted,
        //   onWebViewCreated: (controller) {
        //     controller.loadUrl(
        //       'https://anatomica.uicgroup.tech/page-test/',
        //       headers: {
        //         'Authorization': 'Token ${StorageRepository.getString('token')}',
        //         'mobile': 'true',
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
