import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void hideLoading() {
    if (Navigator.maybeOf(this) != null && Navigator.maybeOf(this)!.canPop()) {
      Navigator.of(this).pop();
    }
  }

  void showLoading() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => const AlertDialog.adaptive(
        content: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(width: 12),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
