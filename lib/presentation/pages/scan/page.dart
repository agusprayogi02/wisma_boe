import 'package:flutter/material.dart';

import '../../components/app_bar_wisma.dart';

part 'controller.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  static const String path = '/scan';
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
        center: MediaQuery.sizeOf(context).center(Offset.zero), width: 200, height: 200);
    return const Scaffold(
      appBar: AppBarWisma(
        namePage: "Pindai Kode QR",
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [Center()],
      ),
    );
  }
}
