import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/home/page.dart';
import 'package:wisma_boe/pages/printer/page.dart';
import 'package:wisma_boe/pages/qr_scanner/page.dart';
import 'package:wisma_boe/pages/read_nfc/page.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

part 'controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const String route = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final DashboardController controller;

  @override
  void initState() {
    controller = DashboardController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisma Boe'),
        actions: [
          IconButton(
            onPressed: () {
              controller.logOut(context);
            },
            icon: const Icon(Icons.logout),
            tooltip: "Keluar",
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, QrScannerPage.route);
            },
            child: const Text('QR Scanner'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ReadNfcPage.route);
            },
            child: const Text('Read NFC'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PrinterPage.route);
            },
            child: const Text('Printer'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePage.route);
            },
            child: const Text('Room'),
          ),
        ],
      ),
    );
  }
}
