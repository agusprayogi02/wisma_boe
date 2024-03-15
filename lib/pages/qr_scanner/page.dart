import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wisma_boe/utils/extension/context_extension.dart';
import 'package:wisma_boe/utils/network_utils.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

import 'component/scanned_barcode_label.dart';
import 'component/scanner_button_widgets.dart';
import 'component/scanner_error_widget.dart';
import 'component/scanner_overlay.dart';

part 'controller.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  static const String route = '/qr-scanner';

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final QrScannerController c;

  @override
  void initState() {
    super.initState();
    c = QrScannerController();
    c.scannerController.start();
  }

  @override
  void dispose() {
    c.scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Scanner'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: MobileScanner(
              fit: BoxFit.contain,
              controller: c.scannerController,
              scanWindow: scanWindow,
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              overlay: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ScannedBarcodeLabel(
                      barcodes: c.scannerController.barcodes),
                ),
              ),
              onDetect: (BarcodeCapture barcodes) {
                c.scannerController.stop();
                if (barcodes.barcodes.isNotEmpty) {
                  Navigator.of(context)
                      .pop(barcodes.barcodes.first.displayValue ?? '');
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => AlertDialog(
                  //     title: const Text('Barcode found!'),
                  //     content: IntrinsicHeight(
                  //       child: TextFormField(
                  //         decoration: const InputDecoration(
                  //           labelText: 'Ingin menginap berapa hari?',
                  //           suffix: Text("Hari"),
                  //         ),
                  //         keyboardType: TextInputType.number,
                  //         controller: c.countDayController,
                  //       ),
                  //     ),
                  //     actions: [
                  //       TextButton(
                  //         onPressed: () {
                  //           c.scan(context, barcodes.barcodes.first.displayValue ?? '');
                  //           // c.scannerController.start();
                  //         },
                  //         child: const Text('OK'),
                  //       ),
                  //     ],
                  //   ),
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No barcode found!'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: ValueNotifier(c.scannerController),
            builder: (context, value, child) {
              if (!value.isStarting) {
                return const SizedBox();
              }

              return CustomPaint(
                painter: ScannerOverlay(scanWindow: scanWindow),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleFlashlightButton(controller: c.scannerController),
                  SwitchCameraButton(controller: c.scannerController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
