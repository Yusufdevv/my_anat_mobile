import 'dart:async';
import 'dart:io';

import 'package:anatomica/assets/themes/theme.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/usecases/check_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/create_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/get_authentication_status_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/login_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/resend_code_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_name_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/splash.dart';
import 'package:anatomica/features/common/domain/repositories/connectivity_repository.dart';
import 'package:anatomica/features/common/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/payment_card/payment_cards_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/deeplinking/deep_link_bloc.dart';
import 'package:anatomica/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_article_single_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_articles_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_single_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/journal/domain/usecases/get_journale_single_articles_usecase.dart';
import 'package:anatomica/features/journal/presentation/bloc/download/download_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/navigation/presentation/home.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart' as fire;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setupLocator();
  await DefaultCacheManager().emptyCache();
  // FlutterError.onError =
  //     fire.FirebaseCrashlytics.instance.recordFlutterFatalError;
  HttpOverrides.global = MyHttpOverrides();
  AndroidYandexMap.useAndroidViewSurface = false;

  runApp(EasyLocalization(
      path: 'lib/assets/translations',
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
      ],
      fallbackLocale: Locale(
          StorageRepository.getString('device_language', defValue: 'uz')),
      startLocale: Locale(
          StorageRepository.getString('device_language', defValue: 'uz')),
      saveLocale: true,
      child: const MyApp()));

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("e1898670-07c9-4ac8-961e-9b061739375e");

  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  final status = await OneSignal.shared.getDeviceState();
  final String? osUserID = status?.userId;
  await StorageRepository.putString('deviceId', osUserID!);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;
  late ConnectivityRepository connectivityRepository;
  late ConnectivityBloc connectivityBloc;

  @override
  void initState() {
    connectivityRepository = ConnectivityRepository();
    connectivityBloc = ConnectivityBloc(connectivityRepository)
      ..add(const ConnectivityEvent.setup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: connectivityRepository)],
      child: MultiBlocProvider(
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
          BlocProvider.value(
            value: connectivityBloc,
          ),
          BlocProvider(
            create: (context) => PaymentCardsBloc(),
          ),
          BlocProvider(
            create: (context) => ShowPopUpBloc(),
          ),
          BlocProvider(
            create: (context) => DownloadBloc(),
          ),
          BlocProvider(create: (context) => DeepLinkBloc()),
          BlocProvider(
            create: (context) => JournalBloc(
              getJournalSingleUseCase: GetJournalSingleUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
              getJournalUseCase: GetJournalUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
              getJournalArticlesUseCase: GetJournalArticlesUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
              getJournalArticleSingleUseCase: GetJournalArticleSingleUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
              getJournalSingleArticlesUseCase: GetJournalSingleArticlesUseCase(
                repository: serviceLocator<JournalRepositoryImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (_) => LoginSignUpBloc(
              loginUseCase: LoginUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              checkUsernameUseCase: CheckUsernameUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              confirmUseCase: ConfirmUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              createNewStateUseCase: CreateNewStateUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitEmailUseCase: SubmitEmailUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitNameUsernameUseCase: SubmitNameUserNameUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitPasswordUseCase: SubmitPasswordUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitPhoneUseCase: SubmitPhoneUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              resendCodeUseCase: ResendCodeUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitChangedEmailUseCase: SubmitChangedEmailUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
              submitChangedPhoneUseCase: SubmitChangedPhoneUseCase(
                repository: serviceLocator<AuthenticationRepositoryImpl>(),
              ),
            ),
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
                if (!StorageRepository.getBool('onboarding', defValue: false)) {
                  navigator.pushAndRemoveUntil(
                      fade(page: const OnBoardingScreen()), (route) => false);
                } else {
                  navigator.pushAndRemoveUntil(
                      fade(page: const HomeScreen()), (route) => false);
                }

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
      ),
    );
  }
}
