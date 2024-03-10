import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/home/page.dart';
import 'package:wisma_boe/pages/login/page.dart';
import 'package:wisma_boe/pages/printer/page.dart';
import 'package:wisma_boe/pages/qr_scanner/page.dart';
import 'package:wisma_boe/pages/read_nfc/page.dart';
import 'package:wisma_boe/pages/register/page.dart';
import 'package:wisma_boe/pages/room/room_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomePage.route: (context) => const HomePage(),
    LoginPage.route: (context) => const LoginPage(),
    RegisterPage.route: (context) => const RegisterPage(),
    PrinterPage.route: (context) => const PrinterPage(),
    QrScannerPage.route: (context) => const QrScannerPage(),
    ReadNfcPage.route: (context) => const ReadNfcPage(),
    RoomPage.route: (context) => const RoomPage(),
  };
}
