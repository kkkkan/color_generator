import 'package:color_generator/screens/home/widgets/color_text_field.dart';
import 'package:flutter/material.dart';

class HexadecimalColorTextField extends StatelessWidget {
  final Color color; // カラー名の表示の色を輝度から決めるためだけに使用
  final Function(String hexadecimal) onChanged;

  const HexadecimalColorTextField({
    Key key,
    this.color,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _hexa = getHexadecimalFromColor(color);

    return ColorTextField(
      color: color,
      fontSize: 32,
      value: _hexa,
      onChanged: onChanged,
    );
  }

  String getHexadecimalFromColor(Color color) {
    final _colorString = color.toString().substring(8, 16).toUpperCase();// 頭も切らないと、COLOR(0xが入り込む。
    final _hexaColorString = '#' + _colorString;

    return _hexaColorString;
  }
}
