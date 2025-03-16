import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';

class BottleDetailsTastingNotesWidget extends StatelessWidget {
  const BottleDetailsTastingNotesWidget({
    super.key,
    required this.bottleModel,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          // Centers all children
          children: [
            Container(
              width: 1.sw,
              height: 0.3.sh,
              color: Palette.mainDarkColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 50,
              color: Palette.textColor,
            )
          ],
        ),
        SizedBox(height: 16.sp),
        Text(
          "Tasting notes",
          style: AppTextStyles.ebGaramondLarge(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Palette.textColor,
          ),
        ),
        SizedBox(height: 6.sp),
        Text(
          "by ${bottleModel.otherTastingNotes!.doneBy}",
          style: AppTextStyles.latoMedium(
              fontWeight: FontWeight.w400, color: Palette.lightGreyColor),
        ),
        SizedBox(height: 12.sp),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Nose",
          desc: "${bottleModel.otherTastingNotes!.noseDesc}",
        ),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Palate",
          desc: "${bottleModel.otherTastingNotes!.palateDesc}",
        ),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Finish",
          desc: "${bottleModel.otherTastingNotes!.finishDesc}",
        ),
        SizedBox(height: 12.sp),
        Text(
          "Your Notes",
          style: AppTextStyles.ebGaramondLarge(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Palette.textColor,
          ),
        ),
        SizedBox(height: 12.sp),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Nose",
          desc: "${bottleModel.personalTastingNote!.noseDesc}",
        ),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Palate",
          desc: "${bottleModel.personalTastingNote!.palateDesc}",
        ),
        BottleDetailsTastingItemWidget(
          bottleModel: bottleModel,
          title: "Finish",
          desc: "${bottleModel.personalTastingNote!.finishDesc}",
        ),
      ],
    );
  }
}

class BottleDetailsTastingItemWidget extends StatelessWidget {
  const BottleDetailsTastingItemWidget({
    super.key,
    required this.bottleModel,
    required this.title,
    required this.desc,
  });

  final BottleModel bottleModel;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Container(
        width: 1.sw,
        color: Palette.backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.ebGaramondLarge(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Palette.textColor,
                ),
              ),
              SizedBox(height: 6.sp),
              Text(
                desc,
                style: AppTextStyles.latoMedium(
                  fontWeight: FontWeight.w400,
                  color: Palette.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
