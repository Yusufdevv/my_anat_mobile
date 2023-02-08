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
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
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
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: textColor,
  );
  static const displayMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const displaySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textSecondary,
  );
  static const headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primary,
  );
  static const headlineSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
  static const titleLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: red,
  );
  static const bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const titleMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const titleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static const labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: textColor,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );
}
