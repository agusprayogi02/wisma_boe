import 'package:flutter/material.dart';
import 'package:wisma_boe/pages/guest/notification.dart';
import 'package:wisma_boe/pages/guest/room_info_not_null.dart';
import 'package:wisma_boe/pages/guest/room_info_null.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key, required this.guestName, this.isNullroomInfo = false});

  final String guestName;
  final bool isNullroomInfo;

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wisma BOE'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/logout");
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
                widget.guestName, //Dinamis
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Container(
                child: widget.isNullroomInfo
                    ? const RoomInfoNull()
                    : const RoomInfoNotNull(
                        hallName: 'Wisma Kendedes',
                        roomNumber: '101',
                        roomType: 'Double',
                        nameEvent: 'Upskilling '),
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
              const SizedBox(height: 20),
              const Text(
                'Atur Jadwal Kegiatan',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              Container(
                height: 150,
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
              )
            ],
          ),
        ));
  }
}
