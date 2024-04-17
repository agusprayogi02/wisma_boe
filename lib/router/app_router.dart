import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/dashboard/page.dart';
import 'package:wisma_boe/pages/guest/page.dart';
import 'package:wisma_boe/pages/home/page.dart';
import 'package:wisma_boe/pages/login/page.dart';
import 'package:wisma_boe/pages/new_printer/page.dart';
import 'package:wisma_boe/pages/printer/page.dart';
import 'package:wisma_boe/pages/qr_scanner/page.dart';
import 'package:wisma_boe/pages/read_nfc/page.dart';
import 'package:wisma_boe/pages/register/page.dart';
import 'package:wisma_boe/pages/splash/page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashPage.route: (context) => const SplashPage(),
    LoginPage.route: (context) => const LoginPage(),
    HomePage.route: (context) => const HomePage(),
    GuestPage.route: (context) => const GuestPage(),
    RegisterPage.route: (context) => const RegisterPage(),
    PrinterPage.route: (context) => const PrinterPage(),
    QrScannerPage.route: (context) => const QrScannerPage(),
    ReadNfcPage.route: (context) => const ReadNfcPage(),
    DashboardPage.route: (context) => const DashboardPage(),
    NewPrinterPage.route: (context) => const NewPrinterPage(),
  };
}
