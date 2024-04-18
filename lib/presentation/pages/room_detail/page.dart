import 'package:flutter/material.dart';

import '../../components/app_bar_wisma.dart';
import '../../components/guest_table_widget.dart';
import '../../components/head_bottom_bar.dart';

class RoomDetailPage extends StatelessWidget {
  const RoomDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWisma(
          namePage: "Detail Kamar",
        ),
        bottomNavigationBar: const ButtomBarHead(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                    //Room Information
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '210',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Text('Asrama Ken Arok')
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 30,
                                width: 60,
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('VC',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            color: Colors.white, fontWeight: FontWeight.bold)),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text('Double Bed')],
                        )
                      ],
                    )),
                //Tabel Daftar Nama Tamu
                //header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar Nama Tamu',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //body
                const GuestTable(
                  guestList: [
                    'Budi',
                    'Andi',
                    'Caca',
                    'Dedi',
                    'Eka',
                    'Fafa',
                    'Gaga',
                    'Haha',
                    'Ika',
                    'Jaja',
                    'Kaka',
                    'Lala',
                    'Mama',
                    'Nana',
                    'Oka',
                    'Papa',
                    'Qiqi',
                    'Rara',
                    'Sasa',
                    'Tata',
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
