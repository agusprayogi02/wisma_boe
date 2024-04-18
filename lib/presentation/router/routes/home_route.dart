import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';

class HomeRoute {
  static final routes = [
    GoRoute(
      path: HomeGuestPage.path,
      name: HomeGuestPage.path,
      builder: (context, state) => const HomeGuestPage(),
    ),
    GoRoute(
      path: HomeKeeperPage.path,
      name: HomeKeeperPage.path,
      builder: (context, state) => const HomeKeeperPage(),
    ),
    GoRoute(
      path: HomeHeadPage.path,
      name: HomeHeadPage.path,
      builder: (context, state) => const HomeHeadPage(),
    ),
  ];
}
