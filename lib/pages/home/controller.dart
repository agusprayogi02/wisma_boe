part of 'page.dart';

class HomeController {
  final _dio = NetworkUtils.instance.dio;
  final local = UserSharedUtils.instance;
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();
  final _noteController = TextEditingController();

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  Future<List<RoomModel>> getRooms() async {
    try {
      final token = (await local.getUser())?.token;
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(
        'room/user-raw',
        queryParameters: {
          'limit': 10,
          'page': 1,
        },
      );
      final data = response.data['data'] as List? ?? [];
      final rooms = data.map((e) => RoomModel.fromJson(e)).toList();
      return rooms;
    } catch (e) {
      rethrow;
    }
  }

  void goPrinter(BuildContext context, RoomModel item) {
    Navigator.pushNamed(context, PrinterPage.route, arguments: item);
  }

  Future<bool> addRoom(BuildContext context) async {
    final rest = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Ruangan'),
        content: IntrinsicHeight(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Ruangan',
                  ),
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Kapasitas',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _capacityController,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Catatan',
                  ),
                  controller: _noteController,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Simpan"),
              ),
            ],
          )
        ],
      ),
    );
    if (rest is bool && rest) {
      showDialog(
          context: context, builder: (context) => const Center(child: CircularProgressIndicator()));
      final user = (await local.getUser());
      _dio.options.headers['Authorization'] = 'Bearer ${user?.token}';
      _dio.post(
        'room',
        data: {
          'name': _nameController.text,
          'capacity': int.parse(_capacityController.text),
          'note': _noteController.text,
          'wisma_id': user?.wisma?.first.id,
        },
      ).then((value) {
        _nameController.text = '';
        _capacityController.text = '';
        _noteController.text = '';
        context.hideLoading();
      }).catchError((e) {
        context.hideLoading();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
    return rest != null;
  }
}
