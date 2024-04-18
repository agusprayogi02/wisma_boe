import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;

  const SmallText({required Key key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 10,
        ),
      ),
    );
  }
}
