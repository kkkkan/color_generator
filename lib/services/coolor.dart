import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'dart:developer';

class Coolor implements ICoolor {
  @override
  Color complementary(Color color) {
    return Color.fromRGBO(
      255 - color.red,
      255 - color.green,
      255 - color.blue,
      1 - color.opacity,
    );
  }

  @override
  Color fromHSL(double alpha, double hue, double saturation, double lightness) {
    final _hslColor = HSLColor.fromAHSL(alpha, hue, saturation, lightness);

    return _hslColor.toColor();
  }

  @override
  Color fromHexadecimal(String hexadecimal) {
    String _hexadecimal = hexadecimal;

    if (_hexadecimal.startsWith('#')) {
      _hexadecimal = _hexadecimal.replaceAll('#', '');
    }

    log('color 0x$_hexadecimal');
    final _intColor = int.parse('0x$_hexadecimal');

    final _color = Color(_intColor);

    log(_color.toString());
    return _color;
  }

  @override
  Color fromARGB(int alpha,int red, int green, int blue) {
    return Color.fromARGB(alpha, red, green, blue);
  }
}

abstract class ICoolor {
  Color complementary(Color color);
  Color fromHSL(double alpha, double hue, double saturation, double lightness);
  Color fromARGB(int alpha,int red, int green, int blue);
  Color fromHexadecimal(String hexadecimal);
}
