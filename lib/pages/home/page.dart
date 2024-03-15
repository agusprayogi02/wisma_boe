import 'package:flutter/material.dart';
import 'package:wisma_boe/Model/room_model/room_model.dart';
import 'package:wisma_boe/pages/printer/page.dart';
import 'package:wisma_boe/utils/extension/context_extension.dart';
import 'package:wisma_boe/utils/network_utils.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

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
                    leading: IconButton(
                      onPressed: () {},
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
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.addRoom(context).then((value) {
            if (value) {
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
