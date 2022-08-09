import 'package:anatomica/assets/themes/theme.dart';
import 'package:anatomica/features/auth/prezentation/pages/login.dart';
import 'package:anatomica/features/auth/prezentation/pages/register.dart';
import 'package:anatomica/features/auth/prezentation/pages/splash.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const LoginScreen(),
    );
  }
}
