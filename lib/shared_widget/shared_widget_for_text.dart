import 'package:flutter/material.dart';

class SharedWidgetForText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  TextAlign? textAlign;
  Color? color;

  SharedWidgetForText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      text,
      style: TextStyle(fontWeight: fontWeight ?? FontWeight.w700, fontSize: fontSize ?? 25, color: color),
    );
  }
}
