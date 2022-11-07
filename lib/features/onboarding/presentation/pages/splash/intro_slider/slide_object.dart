import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class Slide {
  Widget? widgetTitle;

  String? title;

  int? maxLineTitle;
  bool? isShowLeft;
  bool? isShowRight;

  TextStyle? styleTitle;

  EdgeInsets? marginTitle;

  String? pathImage;

  double? widthImage;

  double? heightImage;

  BoxFit? foregroundImageFit;

  Function? onCenterItemPress;

  Widget? centerWidget;

  Widget? widgetDescription;

  String? description;

  int? maxLineTextDescription;

  TextStyle? styleDescription;

  EdgeInsets? marginDescription;
  Color? backgroundColor;
  Color? colorBegin;
  Color? colorEnd;
  AlignmentGeometry? directionColorBegin;
  AlignmentGeometry? directionColorEnd;
  String? backgroundImage;
  BoxFit? backgroundImageFit;
  double? backgroundOpacity;
  Color? backgroundOpacityColor;
  BlendMode? backgroundBlendMode;

  Slide({
    this.widgetTitle,
    this.title,
    this.maxLineTitle,
    this.styleTitle,
    this.marginTitle,
    this.pathImage,
    this.widthImage,
    this.heightImage,
    this.foregroundImageFit,
    this.centerWidget,
    this.onCenterItemPress,
    this.widgetDescription,
    this.description,
    this.maxLineTextDescription,
    this.styleDescription,
    this.marginDescription,
    this.isShowLeft,
    this.isShowRight,
    this.backgroundColor,
    this.colorBegin,
    this.colorEnd,
    this.directionColorBegin,
    this.directionColorEnd,
    this.backgroundImage,
    this.backgroundImageFit,
    this.backgroundOpacity,
    this.backgroundOpacityColor,
    this.backgroundBlendMode,
  }) {
    widgetTitle = widgetTitle ?? const SizedBox();
    title = title ?? '';
    maxLineTitle = maxLineTitle ?? 0;
    styleTitle = styleTitle ?? const TextStyle();
    marginTitle = marginTitle ?? EdgeInsets.zero;
    pathImage = pathImage ?? '';
    widthImage = widthImage ?? 0;
    heightImage = heightImage ?? 0;
    foregroundImageFit = foregroundImageFit ?? BoxFit.none;

    centerWidget = centerWidget ?? const SizedBox();
    onCenterItemPress = onCenterItemPress ?? () {};
    widgetDescription = widgetDescription ?? const SizedBox();
    description = description ?? '';
    maxLineTextDescription = maxLineTextDescription ?? 0;
    styleDescription = styleDescription ?? const TextStyle();
    marginDescription = marginDescription ?? EdgeInsets.zero;
    backgroundColor = backgroundColor ?? red;
    colorBegin = colorBegin ?? red;
    colorEnd = colorEnd ?? red;
    directionColorBegin = directionColorBegin ?? Alignment.topLeft;
    directionColorEnd = directionColorEnd ?? Alignment.bottomRight;
    backgroundImage = backgroundImage ?? '';
    backgroundImageFit = backgroundImageFit ?? BoxFit.none;
    backgroundOpacity = backgroundOpacity ?? 1;
    backgroundOpacityColor = backgroundOpacityColor ?? red;
    backgroundBlendMode = backgroundBlendMode ?? BlendMode.color;
    isShowLeft = isShowLeft ?? false;
    isShowRight = isShowRight ?? false;
  }
}
