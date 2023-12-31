import 'package:anatomica/features/home/home_screen.dart';
import 'package:anatomica/features/journal/presentation/pages/journal_screen.dart';
import 'package:anatomica/features/map/presentation/map_page.dart';
import 'package:anatomica/features/profile/presentation/pages/profile.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy.dart';
import 'package:flutter/cupertino.dart';

import 'home.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  const TabNavigator({required this.tabItem, required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> with AutomaticKeepAliveClientMixin {
  Map<String, WidgetBuilder> _routeBuilders({required BuildContext context, required RouteSettings routeSettings}) {
    switch (widget.tabItem) {
      case NavItemEnum.home:
        return {
          TabNavigatorRoutes.root: (context) => const HomePage(),
        };
      case NavItemEnum.map:
        return {
          TabNavigatorRoutes.root: (context) => MapPage(
                mediaQuery: MediaQuery.of(context),
              )
        };
      case NavItemEnum.magazine:
        return {
          TabNavigatorRoutes.root: (context) => const MagazineScreen(),
        };
      case NavItemEnum.vacancies:
        return {
          TabNavigatorRoutes.root: (context) => const VacancyScreen(),
        };
      case NavItemEnum.account:
        return {
          TabNavigatorRoutes.root: (context) => const ProfileScreen(),
        };

      default:
        return {
          TabNavigatorRoutes.root: (context) => Container(),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        final routeBuilders = _routeBuilders(context: context, routeSettings: routeSettings);
        return CupertinoPageRoute(
          builder: (context) =>
              routeBuilders.containsKey(routeSettings.name) ? routeBuilders[routeSettings.name]!(context) : Container(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) => PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: CurvedAnimation(
            curve: const Interval(0, 1, curve: Curves.linear),
            parent: animation,
          ),
          child: child,
        ),
    settings: settings,
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page);
