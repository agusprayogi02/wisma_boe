import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wisma_boe/Model/room_model/room_model.dart';
import 'package:wisma_boe/utils/extension/context_extension.dart';
import 'package:wisma_boe/utils/network_utils.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

import '../new_printer/page.dart';

part 'controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/room';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController c;

  @override
  void initState() {
    c = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruangan'),
        actions: [
          IconButton(
            onPressed: () {
              c.logOut(context);
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: c.getRooms(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text('Error: ${snapshot.error}'),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text('Coba Lagi'))
                    ],
                  ),
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
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) async {
                      final rest = await c.deleteRoom(item.id ?? '');
                      if (rest) {
                        setState(() {});
                      }
                    },
                    confirmDismiss: (direction) async {
                      bool delete = false;
                      final snackbarController =
                          ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Yakin Ingin Hapus kamar ${item.name} ini?'),
                          action: SnackBarAction(
                              label: 'Hapus', onPressed: () => delete = true),
                        ),
                      );
                      await snackbarController.closed;
                      return delete;
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () async {
                          final rest = await c.showForm(context, item: item);
                          if (rest) {
                            setState(() {});
                          }
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.edit_rounded),
                      ),
                      title: Text('${item.name} - ${item.capacity} Orang'),
                      subtitle: Text('Status : ${item.status}'),
                      trailing: IconButton(
                        onPressed: () {
                          c.goPrinter(context, item);
                        },
                        icon: const Icon(Icons.print_rounded),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final rest = await c.showForm(context);
          if (rest) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
