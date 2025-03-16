import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/generated/assets.dart';

class BottleDetailsTopPartWidget extends StatelessWidget {
  const BottleDetailsTopPartWidget({
    super.key,
    required this.bottleModel,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Palette.mainDarkColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${bottleModel.collection} Collection",
                  style: AppTextStyles.latoSmall(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Palette.mainDarkColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    SvgPicture.asset(Assets.svgsX, height: 26.sp, width: 26.sp),
              ),
            ),
          ],
        ),
        Container(
          color: Palette.mainDarkColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      Assets.imagesGenuinIcon,
                      fit: BoxFit.contain, // Ensure it scales properly
                    ),
                  ),
                  SizedBox(
                    width: 12.sp,
                  ),
                  Text(
                    "Genuine Bottle (${bottleModel.opened ?? false ? "Opened" : "Unopened"})",
                    style:
                        AppTextStyles.latoMedium(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Palette.mainDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.svgsDown,
                    height: 26.sp,
                    width: 26.sp,
                  ),
                  // Icon(
                  //   Icons.keyboard_arrow_down_sharp,
                  //   color: Palette.secondaryColor,
                  //   size: 28,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
