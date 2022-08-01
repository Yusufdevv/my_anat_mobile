import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: white,
        fontFamily: 'Averta CY',
        backgroundColor: white,
        appBarTheme: const AppBarTheme(color: white),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: const TextTheme(
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          headline5: headline5,
          headline6: headline6,
          bodyText1: bodyText1,
          bodyText2: bodyText2,
          subtitle1: subTitle1,
          subtitle2: subTitle2,
        ),
        colorScheme: const ColorScheme(
          background: white,
          brightness: Brightness.light,
          primary: primary,
          secondary: hoverColor,
          error: red,
          surface: black,
          onPrimary: white,
          onSecondary: hoverColor,
          onBackground: white,
          onError: red,
          onSurface: white,
        ),
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: textColor,
  );
  static const headline2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textSecondary,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primary,
  );
  static const headline5 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
  static const headline6 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: red,
  );
  static const bodyText1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const bodyText2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const subTitle1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const subTitle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );
}
