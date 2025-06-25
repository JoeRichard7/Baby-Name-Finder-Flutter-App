import 'package:baby_name_app/shared_widget/shared_widget_for_text.dart';
import 'package:flutter/material.dart';
import '../utils/app_images.dart';

class NameCard extends StatelessWidget {
  final String name;
  final String meaning;
  final String imagePath;
  final Color backgroundColor;
  final bool isFavourite;
  final VoidCallback? onVolumeTap;
  final VoidCallback? onMoreTap;

  const NameCard({
    Key? key,
    required this.name,
    required this.meaning,
    required this.imagePath,
    this.backgroundColor = Colors.yellow,
    this.isFavourite = false,
    this.onVolumeTap,
    this.onMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Name and Meaning
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SharedWidgetForText(
                  text: name,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 5),
                SharedWidgetForText(
                  text: meaning,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),

          // Volume Icon
          IconButton(
            icon: const Icon(Icons.volume_up, color: Colors.black45),
            onPressed: onVolumeTap,
          ),

          // More Options Icon
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black45),
            onPressed: onMoreTap,
          ),
        ],
      ),
    );
  }
}