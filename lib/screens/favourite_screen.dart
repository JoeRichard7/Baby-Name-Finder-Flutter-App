import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:flutter/material.dart';

import '../controllers/controller.dart';
import '../shared_widget/name_list_container.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../shared_widget/bottomsheet.dart'; // Import the Bottomsheet widget

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SharedWidgetForText(text: "Favourites"),
      ),
      body: AppControllers.favouriteList.isEmpty
          ? Center(
        child: SharedWidgetForText(text: "No favourites added"),
      )
          : ListView.builder(
        itemCount: AppControllers.favouriteList.length,
        itemBuilder: (context, index) {
          final favName = AppControllers.favouriteList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NameCard(
              name: favName.name,
              meaning: favName.nameMeaning,
              imagePath: favName.babyType == 1 ? AppImages.male : AppImages.female,
              backgroundColor: AppColor.yellow,
              isFavourite: favName.isFavourite, // Pass the favourite status
              onVolumeTap: () {}, // No volume functionality in favourites
              onMoreTap: () {
                // Open the bottom sheet to remove from favourites
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Bottomsheet(nameModel: favName);
                  },
                ).then((_) {
                  // Refresh the list after removing a favourite
                  setState(() {});
                });
                },
            ),
          );
        },
      ),
    );
  }
}