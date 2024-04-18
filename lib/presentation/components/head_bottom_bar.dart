import 'package:flutter/material.dart';

class ButtomBarHead extends StatelessWidget {
  const ButtomBarHead({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue.shade300,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/head/home');
                  },
                  icon: const Icon(Icons.home_rounded),
                  iconSize: 30,
                  color: Colors.blue.shade300,
                  disabledColor: Colors.grey.shade400,
                ),
              ),
              Text("Home",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/head/rooms');
                  },
                  icon: const Icon(Icons.king_bed_rounded),
                  iconSize: 30,
                  color: Colors.grey.shade400,
                ),
              ),
              Text("Kamar",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/head/keeper');
                  },
                  icon: const Icon(Icons.cleaning_services_rounded),
                  iconSize: 30,
                  color: Colors.grey.shade400,
                ),
              ),
              Text("Petugas",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
