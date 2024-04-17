import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/login/page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, LoginPage.route),
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
