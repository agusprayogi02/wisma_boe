import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void hideLoading() {
    if (Navigator.canPop(this)) Navigator.of(this).pop();
  }
}
