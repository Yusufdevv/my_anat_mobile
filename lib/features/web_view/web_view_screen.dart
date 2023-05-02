import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String page;
  final String slug;
  final String? url;
  final String shareValue;
  final bool sendToken;
  final bool showAppBar;

  const WebViewScreen(
      {required this.page,
      this.url,
      this.shareValue = '',
      this.slug = '',
      this.sendToken = true,
      this.showAppBar = true,
      Key? key})
      : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    print('url link => ${widget.url}');
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
          appBar: widget.showAppBar
              ? AppBar(
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
                )
              : null,
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
                top: MediaQuery.of(context).padding.top),
            child: InAppWebView(
              onWebViewCreated: (controller) async {
                _controller = controller;
                // if (await canLaunchUrlString(widget.url ??
                //     'https://anatomica.uz/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString("token")}&' : ''}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}')) {
                //   print('can launch');
                //   controller.loadUrl(
                //       urlRequest: URLRequest(
                //           url: Uri.parse(widget.url ??
                //               'https://anatomica.uz/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString("token")}&' : ''}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}')));
                // } else {
                //   print('cannot launch');
                // }
              },
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.url ??
                    'https://anatomica.uz/mobile-auth/?${widget.sendToken ? 'token=${StorageRepository.getString(StoreKeys.token)}&' : ''}mobile=true&page=${widget.page}${widget.slug.isNotEmpty ? '&slug=${widget.slug}' : ''}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
