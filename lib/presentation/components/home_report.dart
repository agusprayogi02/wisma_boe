import 'package:flutter/material.dart';

part 'report_box.dart';

class HomeReport extends StatelessWidget {
  const HomeReport(
      {super.key,
      this.title1,
      this.value1,
      this.title2,
      this.value2,
      this.title3,
      this.value3,
      this.title4,
      this.value4});

  final String? title1;
  final String? value1;
  final String? title2;
  final String? value2;
  final String? title3;
  final String? value3;
  final String? title4;
  final String? value4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Laporan 24 Maret 2023", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReportBox(
                  title: title1,
                  value: value1,
                ),
                ReportBox(
                  title: title2,
                  value: value2,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReportBox(
                  title: title3,
                  value: value3,
                ),
                ReportBox(
                  title: title4,
                  value: value4,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
