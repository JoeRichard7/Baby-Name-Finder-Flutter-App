import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:baby_name_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/controller.dart';
import '../models/baby_name_models.dart';

class Bottomsheet extends StatelessWidget {
  final BabyNameModel nameModel;

  const Bottomsheet({super.key, required this.nameModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(AppImages.share),
            title: SharedWidgetForText(
              text: "Share",
              textAlign: TextAlign.start,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            onTap: () {
              Share.share(
                "Check out this beautiful baby name: ${nameModel.name}\n\n"
                    "Meaning: ${nameModel.nameMeaning}\n\n"
                    "From Baby Name App 🍼",
              );
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image.asset(
              nameModel.isFavourite ? AppImages.addedToFav : AppImages.addToFav,
            ),
            title: SharedWidgetForText(
              text: nameModel.isFavourite ? "Remove from Favourites" : "Add to Favourites",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              textAlign: TextAlign.start,
            ),
              onTap: () {
                if (!nameModel.isFavourite) {
                  AppControllers.favouriteList.add(nameModel);
                } else {
                  AppControllers.favouriteList.remove(nameModel);
                }
                nameModel.isFavourite = !nameModel.isFavourite;
                Navigator.pop(context);
              }

          ),

        ],
      ),
    );
  }
}

