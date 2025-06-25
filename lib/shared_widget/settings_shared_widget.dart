import 'package:baby_name_app/shared_widget/settings_container.dart';
import 'package:flutter/material.dart';

import 'shared_widget_for_text.dart';
import '../utils/app_colors.dart';

class SettingsSharedWidget extends StatelessWidget {
  const SettingsSharedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SettingsContainer(text: "Rate us",),
          SettingsContainer(text: "About us",),
          SettingsContainer(text: "Feedback",),
          SettingsContainer(text: "Share App",),
        ],
      ),
    );
  }
}
