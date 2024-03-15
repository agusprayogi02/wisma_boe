import 'package:flutter/material.dart';

class RoomInfoNull extends StatelessWidget {
  const RoomInfoNull({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          onTap: onTap,
          child: Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 37, 197, 19),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: const Text(
                'Pindai',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}
