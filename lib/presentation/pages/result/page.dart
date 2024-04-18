import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'img/checklist.png',
                height: 120,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
              child: Column(
                children: [
                  Text(
                    "Kamar 101",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Guest House",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Selesai Dibersihkan!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/keeper/home");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25C513),
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Selesai',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
