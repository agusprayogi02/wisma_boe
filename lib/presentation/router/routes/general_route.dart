import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';

class GeneralRoute {
  static final routes = [
    GoRoute(
      path: FormPage.path,
      name: FormPage.path,
      builder: (context, state) => const FormPage(),
    ),
    GoRoute(
      path: PostPage.path,
      name: PostPage.path,
      builder: (context, state) => const PostPage(),
    ),
    GoRoute(
      path: QrScannerPage.path,
      name: QrScannerPage.path,
      builder: (context, state) => const PostPage(),
    ),
    GoRoute(
        path: ScanPage.path, name: ScanPage.path, builder: (context, state) => const ScanPage()),
  ];
}
