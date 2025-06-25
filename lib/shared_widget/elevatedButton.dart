import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class Elevatedbutton extends StatelessWidget {

  void Function() onPressed;


  Elevatedbutton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.black,
        foregroundColor: Colors.white,
        minimumSize: Size(200, 45),
        textStyle: TextStyle(fontSize: 17),
      ),
      child: Text("Continue"),
    );
  }
}
