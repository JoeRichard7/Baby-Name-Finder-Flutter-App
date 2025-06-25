import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_colors.dart';
import 'package:baby_name_app/utils/app_images.dart';
import 'package:flutter/material.dart';

class DrawerSharedWidget extends StatelessWidget {

  void Function() onTapRateUs;
  void Function() onTapAbtUs;
  void Function() onTapFeedback;
  void Function() onTapShareApp;
  void Function() onTapPP;
  void Function() onTapTC;

  DrawerSharedWidget(
      {super.key, required this.onTapRateUs, required this.onTapAbtUs, required this.onTapFeedback, required this.onTapShareApp, required this.onTapPP, required this.onTapTC, });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.bgcolor),
            child: SharedWidgetForText(text: "Settings",),
          ),
          ListTile(
            leading: Image.asset(AppImages.rateUs, scale: 2,),
            title: const Text('Rate us'),
            onTap: onTapRateUs,
          ),
          ListTile(
              leading: Image.asset(AppImages.aboutUs, scale: 2,),
              title: const Text('About us'),
              onTap: onTapAbtUs
          ),
          ListTile(
            leading: Image.asset(AppImages.feedback, scale: 2,),
            title: const Text('Feedback'),
            onTap: onTapFeedback
          ),
          ListTile(
            leading: Image.asset(AppImages.shareApp, scale: 2,),
            title: const Text('Share App'),
            onTap: onTapShareApp
          ),
          ListTile(
            leading: Image.asset(AppImages.pp, scale: 2,),
            title: const Text('Privacy Policy'),
            onTap: onTapPP,
          ),
          ListTile(
            leading: Image.asset(AppImages.tc, scale: 2,),
            title: const Text('Terms & Conditions'),
            onTap: onTapTC,
          ),
          ListTile(
            // leading: Image.asset(AppImages.tc, scale: 2,),
            title: const Text('Change the Language'),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
