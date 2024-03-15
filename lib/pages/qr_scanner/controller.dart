part of 'page.dart';

class QrScannerController {
  final countDayController = TextEditingController(text: '1');
  final MobileScannerController scannerController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  final dio = NetworkUtils.instance.dio;
  final local = UserSharedUtils.instance;

  Future<void> scan(BuildContext context, String code) async {
    int count = int.tryParse(countDayController.text) ?? 1;
    DateTime now = DateTime.now();
    context.hideLoading();
    context.showLoading();
    dio.options.headers['Authorization'] = 'Bearer ${local.getUser()?.token}';
    dio.post("/customer/scan", data: {
      "check_out": now.add(Duration(days: count)).toIso8601String(),
      "room_id": code,
    }).then((value) {
      context.hideLoading();
      if (value.data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.data['message']),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.data['message']),
            backgroundColor: Colors.red,
          ),
        );
      }
    }).catchError((e) {
      context.hideLoading();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
