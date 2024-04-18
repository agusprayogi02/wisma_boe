import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;

  const PasswordTextField(
      {required Key key, this.hintText = "Masukkan Kata Sandi"})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;

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
          width: 1,
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
        obscureText: _isObscured,
        cursorColor: const Color(0xFFD9D9D9),
        style: const TextStyle(
          fontSize: 10.0,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          icon: const Icon(
            Icons.lock,
            color: Color(0xFFD9D9D9),
          ),
          hintText: widget.hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // Suffix icon untuk menampilkan/menyembunyikan teks password
          suffixIcon: IconButton(
            icon: _isObscured
                ? const Icon(Icons.visibility_off, color: Color(0xFFD9D9D9))
                : const Icon(Icons.visibility, color: Color(0xFFD9D9D9)),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Memantikkan nilai _isObscured
              });
            },
          ),
        ),
      ),
    );
  }
}
