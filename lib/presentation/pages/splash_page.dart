import 'package:flutter/material.dart';
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
    final user = await locator<SessionSource>().hasSession;
    if (user) {
      context.route.replace(HomeGuestPage.path);
      return;
    }
    context.route.replace(LoginPage.path);
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
