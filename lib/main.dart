import 'package:anatomica/assets/themes/theme.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/usecases/get_authentication_status_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/splash.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setupLocator();
  runApp(
    EasyLocalization(
        path: 'lib/assets/translations',
        supportedLocales: const [
          Locale('ru'),
          Locale('uz'),
          Locale('fr'),
        ],
        fallbackLocale: Locale(StorageRepository.getString('device_language', defValue: 'ru')),
        startLocale: Locale(StorageRepository.getString('device_language', defValue: 'ru')),
        saveLocale: true,
        child: const MyApp()),
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            statusUseCase: GetAuthenticationStatusUseCase(
              repository: serviceLocator<AuthenticationRepositoryImpl>(),
            ),
            getUserDataUseCase: GetUserDataUseCase(
              repository: serviceLocator<AuthenticationRepositoryImpl>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ShowPopUpBloc(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              navigator.pushAndRemoveUntil(fade(page: const HomeScreen()), (route) => false);
              // switch (state.status) {
              //   case AuthenticationStatus.unauthenticated:
              //     navigator.pushAndRemoveUntil(fade(page: const LoginScreen()), (route) => false);
              //     break;
              //   case AuthenticationStatus.authenticated:
              //     navigator.pushAndRemoveUntil(fade(page: const HomeScreen()), (route) => false);
              //     break;
              // }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        ),
      ),
    );
  }
}
