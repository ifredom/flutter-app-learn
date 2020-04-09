import 'package:flutter/material.dart';

class HexToColor extends Color {
  // https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
  static int fromHex(String hexColor) {
    assert(hexColor != null);
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    return int.parse('FF$hexColor', radix: 16);
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  HexToColor(final String hexColor) : super(fromHex(hexColor));
}
