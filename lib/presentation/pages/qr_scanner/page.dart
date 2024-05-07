import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:next_starter/common/permission/permission.dart';
import 'package:next_starter/injection.dart';

import 'component/scanned_barcode_label.dart';
import 'component/scanner_button_widgets.dart';
import 'component/scanner_error_widget.dart';
import 'component/scanner_overlay.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  static const String path = '/qr-scanner';

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final countDayController = TextEditingController(text: '1');
  final MobileScannerController scannerController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  @override
  void initState() {
    super.initState();
    locator<PermissionInterface>().camera();
    scannerController.start();
  }

  @override
  void dispose() {
    scannerController.dispose();
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
              controller: scannerController,
              scanWindow: scanWindow,
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              overlay: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ScannedBarcodeLabel(barcodes: scannerController.barcodes),
                ),
              ),
              onDetect: (BarcodeCapture barcodes) {
                scannerController.stop();
                if (barcodes.barcodes.isNotEmpty) {
                  Navigator.of(context).pop(barcodes.barcodes.first.displayValue ?? '');
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
            valueListenable: ValueNotifier(scannerController),
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
                  ToggleFlashlightButton(controller: scannerController),
                  SwitchCameraButton(controller: scannerController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
