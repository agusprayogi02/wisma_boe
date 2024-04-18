import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required Key key,
    this.hintText = "Masukkan Text",
    this.icon = const Icon(Icons.person),
    this.fontSize = 10.0,
  }) : super(key: key);

  final String hintText;
  final Icon icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 12),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
          width: 1, // Ketebalan garis 1 pixel
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            color: Color(0xFFD9D9D9),
          ),
        ],
      ),
      child: TextField(
        cursorColor: const Color(0xFFD9D9D9),
        style: TextStyle(
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          icon: icon,
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
