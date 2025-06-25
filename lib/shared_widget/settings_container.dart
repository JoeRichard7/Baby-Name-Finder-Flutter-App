import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SettingsContainer extends StatelessWidget {

  String text;

  SettingsContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: AppColor.bgcolor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SharedWidgetForText(text: text, textAlign: TextAlign.start, fontWeight: FontWeight.normal,),
          Icon(Icons.chevron_right),
        ],
      ),
    );

  }
}
