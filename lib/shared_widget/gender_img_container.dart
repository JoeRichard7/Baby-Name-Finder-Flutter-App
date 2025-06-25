import 'package:flutter/material.dart';

class ProfileImageContainer extends StatelessWidget {
  final String imagePath;
  final double size;
  final Color backgroundColor;

  const ProfileImageContainer({
    Key? key,
    required this.imagePath,
    this.size = 60.0,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          scale: 1.8,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
