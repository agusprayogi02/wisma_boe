import 'package:flutter/material.dart';

import '../../../components/card/home_notification_card.dart';

class HomeGuestPage extends StatefulWidget {
  const HomeGuestPage({super.key});

  static const String path = '/home/guest';

  @override
  State<HomeGuestPage> createState() => _HomeGuestPageState();
}

class _HomeGuestPageState extends State<HomeGuestPage> {
  final countDayController = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisma BOE'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            alignment: AlignmentDirectional.centerEnd,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang,',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'name',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 20),
            // Container(
            //   child: item.roomId == null
            //       ? RoomInfoNull(
            //           onTap: () {
            //             context.goNamed(QrScannerPage.path);
            //           },
            //         )
            //       : RoomInfoNotNull(
            //           hallName: item.room?.wisma?.name ?? '-',
            //           roomNumber: item.room?.name ?? '-',
            //           roomType: item.room?.note ?? '-',
            //           capacity: item.room?.capacity ?? 0,
            //         ),
            // ),
            const SizedBox(height: 20),
            const Text(
              'Pemberitahuan',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),
            Container(
                height: 150,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: List<BoxShadow>.generate(
                      3,
                      (index) => BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 0))),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.right,
                  radius: const Radius.circular(3),
                  thickness: 5,
                  trackVisibility: false,
                  interactive: true,
                  child: ListView(scrollDirection: Axis.vertical, children: const [
                    HomeNotificationCard('Pendaftaran Akun Berhasil'),
                    SizedBox(height: 15),
                    HomeNotificationCard('Selamat Datang di Wisma BOE'),
                    SizedBox(height: 15),
                    HomeNotificationCard('Silahkan pindai QR Code sesuai kamar'),
                    SizedBox(height: 15),
                    HomeNotificationCard('Silahkan pindai QR Code sesuai kamar'),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
