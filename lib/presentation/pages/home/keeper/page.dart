import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/pages/pages.dart';
import 'package:next_starter/presentation/theme/theme.dart';

import '../component/home_report.dart';

class HomeKeeperPage extends StatefulWidget {
  const HomeKeeperPage({super.key});

  static const String path = '/home/keeper';

  @override
  State<HomeKeeperPage> createState() => _HomeKeeperPageState();
}

class _HomeKeeperPageState extends State<HomeKeeperPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const BaseAppBar(
        title: 'Wisma BOE',
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Halo, John Doe",
          style: AppStyles.text18Px,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade300,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Point",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "25/100",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        20.verticalSpace,
        const HomeReport(
          title1: "Kamar Kotor",
          value1: "5",
          title2: "Kamar Bersih",
          value2: "10",
          title3: "Kamar Dipesan",
          value3: "3",
          title4: "Kamar Kosong",
          value4: "2",
        ),
        20.verticalSpace,
        Text(
          'Informasi Kamar',
          style: AppStyles.text18Px,
        ),
        10.verticalSpace,
        Container(
          height: 100,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ]),
          child: Column(
            children: [
              Text(
                'Pindai QR Code di depan kamar setelah membersihkan kamar',
                style: TextStyle(color: Colors.grey.shade600),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            context.go(ScanPage.path);
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
                style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ]),
    );
  }
}
