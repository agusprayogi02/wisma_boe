import 'package:go_router/go_router.dart';
import 'package:next_starter/presentation/pages/home/admin/page.dart';
import 'package:next_starter/presentation/pages/home/admin/participant/detail_page.dart';

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
    GoRoute(
      path: HomeAdminPage.path,
      name: HomeAdminPage.path,
      builder: (context, state) => const HomeAdminPage(),
    ),
    GoRoute(
      path: ParticipantDetailPage.path,
      name: ParticipantDetailPage.path,
      builder: (context, state) => const ParticipantDetailPage(),
    ),
  ];
}
