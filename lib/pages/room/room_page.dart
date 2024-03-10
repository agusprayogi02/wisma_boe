import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  static const route = '/room';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room'),
      ),
      body: const Center(
        child: Text('Room Page'),
      ),
    );
  }
}
