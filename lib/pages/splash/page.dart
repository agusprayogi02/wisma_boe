import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/home/page.dart';
import 'package:wisma_boe/pages/login/page.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final local = UserSharedUtils.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () =>
          Navigator.pushReplacementNamed(context, local.check() ? HomePage.route : LoginPage.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/img/logo.png",
          height: 150,
        ),
      ),
    );
  }
}
