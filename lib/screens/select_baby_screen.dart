import 'package:baby_name_app/controllers/controller.dart';
import 'package:baby_name_app/routes/route_names.dart';
import 'package:baby_name_app/shared_widget/babyselect_container.dart';
import 'package:baby_name_app/shared_widget/elevatedButton.dart';
import 'package:baby_name_app/utils/app_colors.dart';
import 'package:baby_name_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import '../shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_constants.dart';

class BabySelect extends StatefulWidget {
  const BabySelect({super.key});

  @override
  State<BabySelect> createState() => _BabySelectState();
}

class _BabySelectState extends State<BabySelect> {
  int selectedBabyType = AppConstants.baby_boy;

  void _selectBaby(int babyType) {
    setState(() {
      selectedBabyType = babyType;
      AppControllers.selectedBaby = babyType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 15),
            SharedWidgetForText(text: "Select Baby"),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BabySelectContainer(
                      tappedBaby: selectedBabyType == AppConstants.baby_boy,
                      color: AppColor.blue,
                      text: "Baby Boy",
                      img: AppImages.babyBoy,
                      onTap: () => _selectBaby(AppConstants.baby_boy),
                    ),
                    BabySelectContainer(
                      tappedBaby: selectedBabyType == AppConstants.baby_girl,
                      color: AppColor.rose,
                      text: "Baby Girl",
                      img: AppImages.babyGirl,
                      onTap: () => _selectBaby(AppConstants.baby_girl),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BabySelectContainer(
                      tappedBaby: selectedBabyType == AppConstants.twin_baby,
                      color: AppColor.yellow,
                      text: "Blessed with Twins",
                      img: AppImages.twinBaby,
                      height: 140,
                      width: 320,
                      sHeight: 15,
                      onTap: () => _selectBaby(AppConstants.twin_baby),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Elevatedbutton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.selectReligion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
