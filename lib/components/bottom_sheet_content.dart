import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Color.fromRGBO(246, 246, 246, 1),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/img/checklist.png',
                height: 158,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
              child: const Text(
                "Check In Berhasil!",
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
