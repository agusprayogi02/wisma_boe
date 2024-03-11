import 'package:flutter/material.dart';
import 'package:wisma_boe/utils/network_utils.dart';

part 'controller.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  static const route = '/room';

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final RoomController c;

  @override
  void initState() {
    super.initState();
    c = RoomController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruangan'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: c.getRooms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Data masih kosong!'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return ListTile(
                title: Text(item['name']),
                subtitle: Text(item['wisma']['name']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.addRoom(context).then((value) {
            if (value) {
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
