part of 'page.dart';

class GuestController {
  final countDayController = TextEditingController(text: '1');
  final local = UserSharedUtils.instance;
  final globalKey = GlobalKey<State>();
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
    final context = globalKey.currentContext!;
    final rest = await Navigator.pushNamed(context, QrScannerPage.route);
    if (rest != null) {
      final response = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ingin menginap berapa hari?'),
          content: IntrinsicHeight(
            child: TextFormField(
              decoration: const InputDecoration(
                suffix: Text("Hari"),
              ),
              keyboardType: TextInputType.number,
              controller: countDayController,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      if (response != null && response) {
        await scan(rest as String);
      }
    }
  }

  Future<void> scan(String code) async {
    final context = globalKey.currentContext!;
    int count = int.tryParse(countDayController.text) ?? 1;
    DateTime now = DateTime.now();

    final formatDate = DateFormat('yyyy-MM-dd');
    context.showLoading();
    dio.options.headers['Authorization'] = 'Bearer ${local.getUser()?.token}';
    try {
      final rest = await dio.post("/customer/scan", data: {
        "check_out": formatDate.format(now.add(Duration(days: count))),
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
