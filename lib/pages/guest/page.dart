import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wisma_boe/model/customer_model/customer_model.dart';
import 'package:wisma_boe/pages/guest/notification.dart';
import 'package:wisma_boe/pages/qr_scanner/page.dart';
import 'package:wisma_boe/utils/extension/context_extension.dart';
import 'package:wisma_boe/utils/network_utils.dart';
import 'package:wisma_boe/utils/user_shared_utils.dart';

import 'room_info_not_null.dart';
import 'room_info_null.dart';

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
      key: c.globalKey,
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
        child: FutureBuilder(
            future: c.getCustomer(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                final item = snapshot.data as CustomerModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang,',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '${c.local.getUser()?.name}',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: item.roomId == null
                          ? RoomInfoNull(
                              onTap: () {
                                c.goScan().then((value) => setState(() {}));
                              },
                            )
                          : RoomInfoNotNull(
                              hallName: item.room?.wisma?.name ?? '-',
                              roomNumber: item.room?.name ?? '-',
                              roomType: item.room?.note ?? '-',
                              capacity: item.room?.capacity ?? 0,
                            ),
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
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
