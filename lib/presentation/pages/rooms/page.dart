import 'package:flutter/material.dart';

import '../../components/app_bar_wisma.dart';
import '../../components/head_bottom_bar.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWisma(
        namePage: "Daftar Kamar",
      ),
      bottomNavigationBar: ButtomBarHead(),
      body: ListView(
        children: [],
      ),
    );
  }
}
