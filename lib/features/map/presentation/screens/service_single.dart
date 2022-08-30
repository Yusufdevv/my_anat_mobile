import 'dart:io';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceSingleScreen extends StatefulWidget {
  final String url;

  const ServiceSingleScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<ServiceSingleScreen> createState() => _ServiceSingleScreenState();
}

class _ServiceSingleScreenState extends State<ServiceSingleScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HospitalSingleAppBarBody(),
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 1,
        shadowColor: textFieldColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          Positioned.fill(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
            child: WButton(
              onTap: () {},
              text: LocaleKeys.order_service.tr(),
            ),
          )
        ],
      ),
    );
  }
}
