import 'package:flutter/material.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      child: Center(
        child: Text("Shop",
            style: AppTextStyles.ebGaramondLarge(
                fontWeight: FontWeight.w500, color: Palette.whiteColor)),
      ),
    );
  }
}
