import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String page;
  final String slug;
  final String? url;
  final String shareValue;
  final bool sendToken;
  const WebViewScreen(
      {required this.page, this.url, this.shareValue = '', this.slug = '', this.sendToken = true, Key? key})
      : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    print(
        'https://anatomica.uz/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString("token")}&' : ''}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}');
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: white),
      child: WillPopScope(
        onWillPop: () async {
          // print(await _controller.canGoBack());
          // if (await _controller.canGoBack()) {
          //   await _controller.goBack();
          //   return false;
          // } else {
          //   Navigator.of(context).pop();
          return true;
          // }
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 0,
            elevation: 1,
            shadowColor: textSecondary,
            title: HospitalSingleAppBarBody(
              shareValue: widget.shareValue,
              // onPop: () async {
              //   // if (await _controller.canGoBack()) {
              //   //   await _controller.goBack();
              //   // } else {
              //     Navigator.of(context).pop();
              //   //}
              // },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
                controller.loadUrl(
                    'https://anatomica.uicgroup.tech/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString("token")}&' : '&'}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}');
              },
              initialUrl: widget.url ??
                  'https://anatomica.uicgroup.tech/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString("token")}&' : '&'}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}',
            ),
          ),
        ),
      ),
    );
  }
}
