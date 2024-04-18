import 'package:fl_chart/src/chart/line_chart/line_chart_data.dart';
import 'package:flutter/material.dart';
import '../../../components/app_bar_wisma.dart';
import '../../../components/head_bottom_bar.dart';
import '../../../components/home_report.dart';
import '../../../components/keeper_table_widget.dart';

class HomeHeadPage extends StatefulWidget {
  const HomeHeadPage({super.key});

  static const String path = '/home/head';

  @override
  State<HomeHeadPage> createState() => _HomeHeadPageState();
}

class _HomeHeadPageState extends State<HomeHeadPage> {
  LineChartData get lineChartData => LineChartData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWisma(
        namePage: "Wisma VEDC",
      ),
      bottomNavigationBar: const ButtomBarHead(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          const HomeReport(
            title1: "Total Karyawan",
            value1: "100",
            title2: "Total Kamar",
            value2: "50",
            title3: "Kamar Terisi",
            value3: "25",
            title4: "Kamar Kosong",
            value4: "25",
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/head/rooms/detail');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            ),
            child: const Text(
              "Lihat Daftar Kamar",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Statistik", style: Theme.of(context).textTheme.titleLarge),
              InkWell(
                onTap: () {},
                child: Text(
                  "Lihat Semua",
                  style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue.shade300),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 170,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dana Operasional', style: Theme.of(context).textTheme.titleSmall),
                //LineChart(lineChartData)
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Petugas Kebersihan", style: Theme.of(context).textTheme.titleLarge),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/head/keeper');
                },
                child: Text(
                  "Lihat Semua",
                  style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue.shade300),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const KeeperTable(keeperList: [
            (name: "Budi Agung Prasetyo", point: 100),
            (name: "Ana", point: 10),
            (name: "Eka", point: 110),
          ]),
        ],
      ),
    );
  }
}
