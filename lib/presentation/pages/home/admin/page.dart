import 'package:flutter/material.dart';
import 'package:next_starter/presentation/components/app_bar_wisma.dart';
import 'package:next_starter/presentation/components/base/base_scaffold.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  static const path = "/home/admin";

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: AppBarWisma(
        isHome: true,
      ),
      body: Column(
        children: [
          SearchBar(),
          ListTile(
            title: Text("M Hamzah Romadhon"),
            subtitle: Column(
              children: [
                Text("Pria, 15-Apr-1989"),
                Text("SMKS Darma Siswa 1 Sidoarjo"),
                Text("Pelatihan Guru Mapel Informatika - D"),
              ],
            ),
            trailing: Text("Gedung Ken Umang\nKU-207 Twin Room - capacity: 2"),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
