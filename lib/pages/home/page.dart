import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:nfc_manager/nfc_manager.dart';

part 'controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    controller = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: NfcManager.instance.isAvailable(),
          builder: (context, ss) => ss.data != true
              ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
              : Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        constraints: const BoxConstraints.expand(),
                        decoration: BoxDecoration(border: Border.all()),
                        child: SingleChildScrollView(
                          child: ValueListenableBuilder<dynamic>(
                            valueListenable: controller.result,
                            builder: (context, value, _) => Text('${value ?? ''}'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: GridView.count(
                        padding: const EdgeInsets.all(4),
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        children: [
                          ElevatedButton(
                            onPressed: controller.tagRead,
                            child: const Text('Tag Read'),
                          ),
                          ElevatedButton(
                            onPressed: controller.ndefWrite,
                            child: const Text('Ndef Write'),
                          ),
                          ElevatedButton(
                            onPressed: controller.ndefWriteLock,
                            child: const Text('Ndef Write Lock'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
