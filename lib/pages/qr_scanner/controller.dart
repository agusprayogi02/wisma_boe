part of 'page.dart';

class QrScannerController {
  final MobileScannerController scannerController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
}
