import 'package:flutter/material.dart';

class RoomInfoNotNull extends StatefulWidget {
  const RoomInfoNotNull(
      {super.key,
      required this.hallName,
      required this.roomNumber,
      required this.roomType,
      required this.nameEvent});

  final String hallName;
  final String roomNumber;
  final String roomType;
  final String nameEvent;
  @override
  State<RoomInfoNotNull> createState() => _RoomInfoNotNullState();
}

class _RoomInfoNotNullState extends State<RoomInfoNotNull> {
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
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: List<BoxShadow>.generate(
                3,
                (index) => BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 0))),
          ),
          child: Row(
            children: [
              Container(
                width: 150,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.roomNumber,
                  style: const TextStyle(
                      fontSize: 40, color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.hallName,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text(widget.roomType),
                    const SizedBox(height: 5),
                    FittedBox(fit: BoxFit.scaleDown, child: Text(widget.nameEvent)),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
