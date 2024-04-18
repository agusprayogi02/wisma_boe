import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/extensions.dart';

import '../../../components/components.dart';

class HomeKeeperPage extends StatefulWidget {
  const HomeKeeperPage({super.key});

  static const path = "/home/keeper";

  @override
  State<HomeKeeperPage> createState() => _HomeKeeperPageState();
}

class _HomeKeeperPageState extends State<HomeKeeperPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      padding: 24.horizontal,
      appBar: BaseAppBar(
        title: 'Wisma BOE',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: const Column(
        children: [
          Text("Halo, Nama Petugas"),
        ],
      ),
    );
  }
}
