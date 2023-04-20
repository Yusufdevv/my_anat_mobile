import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/connectivity_bottom_sheet.dart';
import 'package:anatomica/features/deeplinking/deep_link_bloc.dart';
import 'package:anatomica/features/doctor_single/presentation/doctor_single_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/navigation/domain/entity/nav_bar.dart';
import 'package:anatomica/features/navigation/presentation/widgets/nav_bar_item.dart';
import 'package:anatomica/features/navigation/presentation/widgets/tab_indicator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigator.dart';

enum NavItemEnum { home, map, magazine, vacancies, account }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.account: GlobalKey<NavigatorState>(),
    NavItemEnum.map: GlobalKey<NavigatorState>(),
    NavItemEnum.vacancies: GlobalKey<NavigatorState>(),
    NavItemEnum.magazine: GlobalKey<NavigatorState>(),
  };

  final List<NavBar> lables = const [
    NavBar(
      title: LocaleKeys.home,
      id: 0,
      icon: AppIcons.home,
    ),
    NavBar(
      title: LocaleKeys.map,
      id: 1,
      icon: AppIcons.map,
    ),
    NavBar(
      title: LocaleKeys.magazine,
      id: 2,
      icon: AppIcons.magazine,
    ),
    NavBar(
      title: LocaleKeys.vacancy,
      id: 3,
      icon: AppIcons.vacancies,
    ),
    NavBar(
      title: LocaleKeys.account,
      id: 4,
      icon: AppIcons.profile,
    ),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: lables.length, vsync: this);
    _controller.addListener(onTabChange);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  void onTabChange() => setState(() => _currentIndex = _controller.index);

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) => HomeTabControllerProvider(
        controller: _controller,
        child: BlocListener<ConnectivityBloc, ConnectivityState>(
          listenWhen: (state1, state2) {
            return state1.connected != state2.connected;
          },
          listener: (context, state) {
            if (state.connected == false) {
              showConnectionBottomSheet(context);
            }
          },
          child: BlocListener<DeepLinkBloc, DeepLinkState>(
            listener: (context, state) {
              if (state is DoctorLinkTriggered) {
                if (state.doctorId != null) {
                  Navigator.of(context).push(
                      fade(page: DoctorSingleScreen(id: state.doctorId!)));
                }
              } else if (state is OrganizationLinkTriggered) {
                if (state.organizationSlug != null &&
                    state.organizationId != null) {
                  Navigator.of(context).push(fade(
                      page: HospitalSingleScreen(
                          id: state.organizationId!,
                          slug: state.organizationSlug!)));
                }
              } else if (state is OnlineJournalLinkTriggered) {
                if (mounted) {
                  _controller.animateTo(1);
                }
              }
            },
            child: WillPopScope(
              onWillPop: () async {
                final isFirstRouteInCurrentTab =
                    !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                        .currentState!
                        .maybePop();
                if (isFirstRouteInCurrentTab) {
                  changePage(0);
                  return false;
                }
                return isFirstRouteInCurrentTab;
              },
              child: AnnotatedRegion(
                value: const SystemUiOverlayStyle(
                    systemNavigationBarColor: Colors.transparent,
                    systemNavigationBarContrastEnforced: false,
                    systemNavigationBarIconBrightness: Brightness.dark,
                    systemStatusBarContrastEnforced: false,
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                child: Scaffold(
                  extendBody: true,
                  resizeToAvoidBottomInset: true,
                  bottomNavigationBar: Container(
                    color: Colors.transparent,
                    child: BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
                      builder: (context, state) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          child: state.showMainTab
                              ? Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .padding
                                          .bottom),
                                  height: 64 +
                                      MediaQuery.of(context).padding.bottom,
                                  decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: textFieldColor),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff8898AA)
                                            .withOpacity(0.08),
                                        blurRadius: 30,
                                        offset: const Offset(0, -4),
                                      ),
                                    ],
                                  ),
                                  child: BlocBuilder<AuthenticationBloc,
                                      AuthenticationState>(
                                    builder: (context, state) {
                                      return TabBar(
                                        enableFeedback: true,
                                        onTap: (index) {
                                          // if (index == 3 && state.status == AuthenticationStatus.unauthenticated) {
                                          //   showRegisterBottomSheet(context);
                                          //   _controller.animateTo(_controller.previousIndex);
                                          // }
                                        },
                                        controller: _controller,
                                        indicatorPadding: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        indicator: const CustomTabIndicator(
                                            radius: 3,
                                            color: primary,
                                            horizontalPadding: 35),
                                        labelPadding: EdgeInsets.zero,
                                        tabs: List.generate(
                                          lables.length,
                                          (index) => NavItemWidget(
                                            navBar: lables[index],
                                            currentIndex: _currentIndex,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        );
                      },
                    ),
                  ),
                  body: TabBarView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      NavItemEnum.values.length,
                      (index) => _buildPageNavigator(
                        NavItemEnum.values[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  static HomeTabControllerProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
