import 'package:baby_name_app/routes/route_names.dart';
import 'package:baby_name_app/shared_widget/elevatedButton.dart';
import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../controllers/controller.dart'; // Import the controller

class SelectReligionScreen extends StatefulWidget {
  const SelectReligionScreen({super.key});

  @override
  State<SelectReligionScreen> createState() => _SelectReligionScreenState();
}

class _SelectReligionScreenState extends State<SelectReligionScreen> {
  List<String> religion = [
    "Christianity",
    "Islam",
    "Hinduism",
    "Buddhism",
    "Judaism",
    "Sikhism",
    "Taoism",
    "Shintoism",
    "Zoroastrianism",
    "Confucianism",
  ];

  String? selectedReligion; // Track the selected religion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SharedWidgetForText(text: "Select Religion"),

            Wrap(
              spacing: 10,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                for (var religion in [
                  "Christianity",
                  "Islam",
                  "Hinduism",
                  "Buddhism",
                  "Judaism",
                  "Sikhism",
                  "Jainism",
                  "Zoroastrianism",
                ])
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedReligion = religion; // Update selected religion
                      });
                    },
                    child: IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectedReligion == religion
                              ? AppColor.selectedBorder // Highlight selected religion
                              : AppColor.yellow,
                        ),
                        child: SharedWidgetForText(
                          text: religion,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: selectedReligion == religion ? AppColor.white : AppColor.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            Elevatedbutton(
              onPressed: () {
                if (selectedReligion != null) {
                  AppControllers.selectedReligion = selectedReligion!; // Save selected religion
                  Navigator.pushNamed(context, RouteNames.homeScreen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select a religion")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}