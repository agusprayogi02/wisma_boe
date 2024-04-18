import 'package:flutter/material.dart';

import '../../components/head_bottom_bar.dart';
import '../../components/keeper_table_widget.dart';
import '../../components/app_bar_wisma.dart';

class KeeperPage extends StatelessWidget {
  const KeeperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWisma(
        namePage: "Daftar Petugas",
      ),
      bottomNavigationBar: const ButtomBarHead(),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: const [
            KeeperTable(keeperList: [
              (name: "Budi Agung Prasetyo", point: 100),
              (name: "Ana", point: 10),
              (name: "Eka", point: 110),
            ]),
          ]),
    );
  }
}
