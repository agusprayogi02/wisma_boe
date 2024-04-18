import 'package:flutter/material.dart';

import '../../../components/app_bar_wisma.dart';
import '../../../components/home_report.dart';

class HomeKeeperPage extends StatefulWidget {
  const HomeKeeperPage({super.key});

  static const String path = '/home/keeper';

  @override
  State<HomeKeeperPage> createState() => _HomeKeeperPageState();
}

class _HomeKeeperPageState extends State<HomeKeeperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWisma(
        namePage: "Wisma VEDC",
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Halo, John Doe",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade300,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Point",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "25/100",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const HomeReport(
              title1: "Kamar Kotor",
              value1: "5",
              title2: "Kamar Bersih",
              value2: "10",
              title3: "Kamar Dipesan",
              value3: "3",
              title4: "Kamar Kosong",
              value4: "2",
            ),
            const SizedBox(height: 20),
            const Text(
              'Informasi Kamar',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                boxShadow: List<BoxShadow>.generate(
                    3,
                    (index) => BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(0, 0))),
              ),
              child: Column(
                children: [
                  Text(
                    'Pindai QR Code di depan kamar setelah membersihkan kamar',
                    style: TextStyle(color: Colors.grey.shade600),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // showModalBottomSheet<void>(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const CheckBottomSheet();
                //   },
                // );
                Navigator.pushReplacementNamed(context, '/keeper/scan');
              },
              child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 37, 197, 19),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: const Text(
                    'Pindai',
                    style:
                        TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          ])),
    );
  }
}
