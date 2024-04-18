import 'package:flutter/material.dart';

class KeeperTable extends StatelessWidget {
  const KeeperTable({
    super.key,
    required this.keeperList,
  });
  final List keeperList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: DataTable(
          headingTextStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          dataTextStyle: Theme.of(context).textTheme.bodyMedium,
          headingRowColor: MaterialStateProperty.all(Colors.blue.shade300),
          dataRowColor: MaterialStateProperty.all(Colors.white),
          columnSpacing: 0.5,
          columns: const [
            DataColumn(
              label: Text('No.'),
            ),
            DataColumn(label: Text('Nama')),
            DataColumn(label: Text('Poin'), numeric: true)
          ],
          rows: [
            for (int i = 0; i < keeperList.length; i++)
              DataRow(cells: [
                DataCell(Text((i + 1).toString())),
                DataCell(Text(keeperList[i].name)),
                DataCell(Text(keeperList[i].point.toString()))
              ]),
          ]),
    );
  }
}
