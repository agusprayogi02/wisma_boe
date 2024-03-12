import 'package:flutter/material.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

part 'controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    controller = HomeController();
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
              Navigator.pushNamed(context, '/qr-scanner');
            },
            child: const Text('QR Scanner'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/read-nfc');
            },
            child: const Text('Read NFC'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/printer');
            },
            child: const Text('Printer'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/room');
            },
            child: const Text('Room'),
          ),
        ],
      ),
    );
  }
}
