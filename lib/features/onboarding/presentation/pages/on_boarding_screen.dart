import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/onboarding/domain/entities/splash_entity.dart';
import 'package:anatomica/features/onboarding/presentation/pages/splash/intro_slider/intro_slider.dart';
import 'package:anatomica/features/onboarding/presentation/pages/splash/intro_slider/scollbar_behavior_enum.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      isShowDotIndicator: true,
      isShowDoneBtn: true,
      onDonePress: () {},
      renderDoneBtn: Container(
        padding: const EdgeInsets.all(15),
        height: 54,
        width: 100,
        decoration: BoxDecoration(
          color: red.withOpacity(0.59),
          borderRadius: BorderRadius.circular(27),
        ),
        child: SvgPicture.asset(
          AppIcons.chevronLeft,
        ),
      ),
      backgroundColorAllSlides: Colors.black.withOpacity(0.65),
      borderRadiusDoneBtn: 100,
      colorDoneBtn: Colors.white,
      colorDot: red,
      highlightColorDoneBtn: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 6,
      verticalScrollbarBehavior: ScrollbarBehavior.show,
      renderNextBtn: Container(
        padding: const EdgeInsets.all(15),
        height: 54,
        width: 100,
        decoration: BoxDecoration(
          color: red.withOpacity(0.59),
          borderRadius: BorderRadius.circular(27),
        ),
        child: SvgPicture.asset(
          AppIcons.chevronRight,
        ),
      ),
      isShowNextBtn: true,
      product: [
        SlideEntity(
          label: LocaleKeys.onboarding_1.tr(),
          img: AppImages.onbooarding1,
          subLabel: LocaleKeys.onboarding_1_content.tr(),
        ),
        SlideEntity(
          label: LocaleKeys.onboarding_2.tr(),
          img: AppImages.onbooarding2,
          subLabel: LocaleKeys.onboarding_2_content.tr(),
        ),
        SlideEntity(
          label: LocaleKeys.onboarding_3.tr(),
          img: AppImages.onbooarding3,
          subLabel: LocaleKeys.onboarding_3_content.tr(),
        ),
        SlideEntity(
          label: LocaleKeys.onboarding_1.tr(),
          img: AppImages.onbooarding4,
          subLabel: LocaleKeys.onboarding_4_content.tr(),
        ),
      ],
    );
  }
}
