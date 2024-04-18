import 'package:flutter/material.dart';

class GuestTable extends StatelessWidget {
  const GuestTable({
    super.key,
    required this.guestList,
  });
  final List<String> guestList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Table(
        children: [
          for (int i = 0; i < guestList.length; i++)
            TableRow(
              decoration: BoxDecoration(
                color: i.isEven ? Colors.grey.shade200 : Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    guestList[i],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
