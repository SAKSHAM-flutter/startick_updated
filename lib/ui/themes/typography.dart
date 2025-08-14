import 'package:flutter/material.dart';

class Font {
  var _textStyle = const TextStyle();

  TextStyle get s40 => _textStyle.copyWith(fontSize: 40);

  TextStyle get s26 => _textStyle.copyWith(fontSize: 26);
  TextStyle get s22 => _textStyle.copyWith(fontSize: 22);

  TextStyle get s20 => _textStyle.copyWith(fontSize: 20);

  TextStyle get s18 => _textStyle.copyWith(fontSize: 18);

  TextStyle get s16 => _textStyle.copyWith(fontSize: 16);
  TextStyle get s15 => _textStyle.copyWith(fontSize: 15);

  TextStyle get s14 => _textStyle.copyWith(fontSize: 14);

  TextStyle get s13 => _textStyle.copyWith(fontSize: 13);

  TextStyle get s12 => _textStyle.copyWith(fontSize: 12);

  TextStyle get s11 => _textStyle.copyWith(fontSize: 11);

  TextStyle get s10 => _textStyle.copyWith(fontSize: 10);

  TextStyle get s9 => _textStyle.copyWith(fontSize: 9);

  TextStyle get s8 => _textStyle.copyWith(fontSize: 8);

  TextStyle get s6 => _textStyle.copyWith(fontSize: 6);
}

class Inter extends Font {
  Inter.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12,
      color: color ?? Colors.black,
    );
  }

  Inter.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  Inter.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  Inter.semiLight([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      color: color ?? Colors.black,
    );
  }

  Inter.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}

class Archivo extends Font {
  Archivo.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Archivo',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}
