import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BabySelectContainer extends StatelessWidget {
  Color color;
  String text;
  String img;
  // double sizedBoxHeight;
  double? height;
  double? width;
  double? sHeight;
  void Function() onTap;
  bool tappedBaby;

  BabySelectContainer({
    super.key,
    required this.color,
    required this.text,
    required this.img,
    // required this.sizedBoxHeight,
    this.height,
    this.width,
    this.sHeight,
    required this.onTap,
    required this.tappedBaby,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 230,
        width: width ?? 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusDirectional.circular(45),
          border: Border.all(
            color: tappedBaby ? AppColor.selectedBorder : AppColor.border,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: sHeight ?? 35),
            SharedWidgetForText(
              text: text,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            Image.asset(img),
          ],
        ),
      ),
    );
  }
}
