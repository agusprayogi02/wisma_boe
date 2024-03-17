part of 'page.dart';

class HomeController {
  final _dio = NetworkUtils.instance.dio;
  final local = UserSharedUtils.instance;
  final _nameController = TextEditingController();
  final idController = TextEditingController();
  final _capacityController = TextEditingController();
  final _noteController = TextEditingController();

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  Future<List<RoomModel>> getRooms() async {
    try {
      final token = (local.getUser())?.token;
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

  Future<bool> showForm(BuildContext context, {RoomModel? item}) async {
    idController.text = item?.id ?? '';
    final isAdd = idController.text.isEmpty;
    final rest = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isAdd ? 'Tambah Ruangan' : 'Ubah Ruangan'),
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
                  controller: _nameController..text = item?.name ?? '',
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Kapasitas',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _capacityController..text = "${item?.capacity ?? 0}",
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Catatan',
                  ),
                  controller: _noteController..text = item?.note ?? '',
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
                  Navigator.pop(context, false);
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
    if (rest != null && rest) {
      try {
        context.showLoading();
        final user = (local.getUser());
        _dio.options.headers['Authorization'] = 'Bearer ${user?.token}';
        late final Response response;
        if (isAdd) {
          response = await _dio.post(
            'room',
            data: {
              'name': _nameController.text,
              'capacity': int.parse(_capacityController.text),
              'note': _noteController.text,
              'wisma_id': user?.wisma?.first.id,
            },
          );
        } else {
          response = await _dio.put(
            'room/${idController.text}',
            data: {
              'name': _nameController.text,
              'capacity': int.parse(_capacityController.text),
              'note': _noteController.text,
              'wisma_id': user?.wisma?.first.id,
            },
          );
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data['message']),
            backgroundColor: Colors.green,
          ),
        );
        context.hideLoading();
      } on DioException catch (e) {
        context.hideLoading();
        if (e.response?.statusCode == 422 ||
            e.response?.statusCode == 500 ||
            e.response?.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  e.response != null ? e.response!.data['message'] : e.message ?? e.toString()),
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
    return rest != null;
  }
}
