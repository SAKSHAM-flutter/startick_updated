import 'dart:developer';

import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  final List strengths = <double>[.05];
  final Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch as dynamic);
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}

Color hexToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color oppositeColor(Color? color) {
  if (color == null) return Colors.white;
  String invert = invertColor(colorToHex(color));
  return hexToColor(invert);
}

String invertColor(String hex) {
  if (hex.indexOf('#') == 0) {
    hex = hex.substring(1);
  }
  // Convert 3-digit hex to 6-digits.
  if (hex.length == 3) {
    hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
  }
  if (hex.length != 6) {
    throw const FormatException('Invalid HEX color.');
  }
  // Invert color components
  var r = (255 - int.parse(hex.substring(0, 2), radix: 16)).toRadixString(16);
  var g = (255 - int.parse(hex.substring(2, 4), radix: 16)).toRadixString(16);
  var b = (255 - int.parse(hex.substring(4, 6), radix: 16)).toRadixString(16);
  // Pad each with zeros and return
  return '#${padZero(r)}${padZero(g)}${padZero(b)}';
}

String padZero(String str, [int len = 2]) {
  var zeros = '0' * (len - str.length);
  return zeros + str;
}
