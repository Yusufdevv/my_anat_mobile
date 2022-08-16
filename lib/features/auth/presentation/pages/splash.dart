import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/widgets/four_dot_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          SvgPicture.asset(AppIcons.anatomica),
          const Spacer(),
          const FourDotLoadingIndicator(),
          SizedBox(
            height: 20 + mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }
}
