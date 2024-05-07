import 'package:flutter/material.dart';
import 'package:next_starter/common/enums/role_enum.dart';
import 'package:next_starter/presentation/pages/pages.dart';

import '../../common/extensions/extensions.dart';
import '../../data/datasources/session/session_source.dart';
import '../../injection.dart';
import '../components/components.dart';
import '../theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const path = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await 3.delayedSeconds;
    final has = await locator<SessionSource>().hasSession;
    final user = await locator<SessionSource>().user;
    if (has) {
      if (user != null) {
        if (user.roles?.first == RoleEnum.keeper.name) {
          context.go(HomeKeeperPage.path);
          return;
        } else if (user.roles?.first == RoleEnum.guest.name) {
          context.go(HomeGuestPage.path);
          return;
        } else if (user.roles?.first == RoleEnum.head.name) {
          context.go(HomeHeadPage.path);
          return;
        }
      }
    }
    context.go(LoginPage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorTheme.primary,
        ),
        child: const BaseLogo(),
      ),
    );
  }
}
