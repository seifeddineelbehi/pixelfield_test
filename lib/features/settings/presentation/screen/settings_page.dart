import 'package:flutter/material.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      child: Center(
        child: Text("Settings",
            style: AppTextStyles.ebGaramondLarge(
                fontWeight: FontWeight.w500, color: Palette.whiteColor)),
      ),
    );
  }
}
