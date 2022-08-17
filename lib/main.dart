import 'package:anatomica/assets/themes/theme.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/usecases/get_authentication_status_usecase.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/login.dart';
import 'package:anatomica/features/auth/presentation/pages/splash.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
          statusUseCase: GetAuthenticationStatusUseCase(repository: serviceLocator<AuthenticationRepositoryImpl>())),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  navigator.pushAndRemoveUntil(fade(page: const HomeScreen()), (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated:
                  navigator.pushAndRemoveUntil(fade(page: const HomeScreen()), (route) => false);
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => const SplashScreen()),
      ),
    );
  }
}
