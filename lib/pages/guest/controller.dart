part of 'page.dart';

class GuestController {
  final countDayController = TextEditingController(text: '1');
  final local = UserSharedUtils.instance;
  final context = NetworkUtils.instance.navigatorKey.currentContext!;
  final dio = NetworkUtils.instance.dio;

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  Future<CustomerModel> getCustomer() async {
    try {
      dio.options.headers['Authorization'] = 'Bearer ${local.getUser()?.token}';
      final rest = await dio.get("/customer/user");

      final item = CustomerModel.fromMap(rest.data['data']);
      return item;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> goScan() async {
    final rest = await Navigator.pushNamed(context, QrScannerPage.route);
    if (rest != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Barcode found!'),
          content: IntrinsicHeight(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ingin menginap berapa hari?',
                suffix: Text("Hari"),
              ),
              keyboardType: TextInputType.number,
              controller: countDayController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.hideLoading();
                scan(rest as String);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> scan(String code) async {
    int count = int.tryParse(countDayController.text) ?? 1;
    DateTime now = DateTime.now();
    context.showLoading();
    dio.options.headers['Authorization'] = 'Bearer ${local.getUser()?.token}';
    try {
      final rest = await dio.post("/customer/scan", data: {
        "check_out": now.add(Duration(days: count)).toIso8601String(),
        "room_id": code,
      });
      if (rest.data['status'] == 'success') {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(rest.data['message']),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        context.hideLoading();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(rest.data['message']),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on DioException catch (e) {
      context.hideLoading();
      if (e.response?.statusCode == 422 ||
          e.response?.statusCode == 500 ||
          e.response?.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(e.response != null ? e.response!.data['message'] : e.message ?? e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
