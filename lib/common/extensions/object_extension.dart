extension ObjectExtensionExt on Object? {
  int? toInt() => this == null ? null : int.tryParse(toString());
  double? toDouble() => this == null ? null : double.tryParse(toString());

  String? toStringX() => this == null ? null : toString();
  String toStringNotNull() => this == null ? '' : toString();

  num? toNum() => this == null ? null : num.tryParse(toString());

  bool toBool() => this == null ? false : toString().toLowerCase() == 'true';
}
