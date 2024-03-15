import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/qr_scanner/page.dart';
import 'package:wisma_boe/utils/extension/context_extension.dart';
import 'package:wisma_boe/utils/home_notification_utils.dart';
import 'package:wisma_boe/utils/network_utils.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

part 'controller.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  static const String route = '/guest';

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  late final GuestController c;

  @override
  void initState() {
    c = GuestController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisma BOE'),
        actions: [
          IconButton(
            onPressed: () {
              c.logOut(context);
            },
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
            const Text(
              'Selamat Datang,',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${c.local.getUser()?.name}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informasi Kamar',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),
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
                    'Kamar belum ditemukan, silahkan pindai QR Code.',
                    style: TextStyle(color: Colors.grey.shade600),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                c.goScan();
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
                    HomeNotification('Pendaftaran Akun Berhasil'),
                    SizedBox(height: 15),
                    HomeNotification('Selamat Datang di Wisma BOE'),
                    SizedBox(height: 15),
                    HomeNotification('Silahkan pindai QR Code sesuai kamar'),
                    SizedBox(height: 15),
                    HomeNotification('Silahkan pindai QR Code sesuai kamar'),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
