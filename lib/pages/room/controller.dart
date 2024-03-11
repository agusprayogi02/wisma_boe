part of 'page.dart';

class RoomController {
  final _dio = NetworkUtils.dio();
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();
  final _noteController = TextEditingController();

  Future<List<dynamic>> getRooms() async {
    try {
      final response = await _dio.get(
        'room/user',
        queryParameters: {
          'limit': 10,
          'page': 1,
        },
      );
      return response.data['data'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addRoom(BuildContext context) async {
    final rest = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Ruangan'),
        content: IntrinsicHeight(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
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
      await _dio.post(
        'room',
        data: {
          'name': _nameController.text,
          'capacity': int.parse(_capacityController.text),
        },
      );
    }
    return rest != null;
  }
}
