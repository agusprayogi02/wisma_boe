import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/guest/page.dart';
import 'pages/home/page.dart';
import 'pages/login/pages.dart';
import 'pages/printer/page.dart';
import 'pages/register/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade300,
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300)
            .copyWith(background: Colors.grey[100]),
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/printer": (context) => const PrinterPage(),
        "/": (context) => const GuestPage(guestName: 'John Doe'),
      },
    );
  }
}
