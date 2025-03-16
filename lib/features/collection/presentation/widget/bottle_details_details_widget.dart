import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';

class BottleDetailsDetailsWidget extends StatelessWidget {
  const BottleDetailsDetailsWidget({
    super.key,
    required this.bottleModel,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsItemWidget(
          title: "Distillery",
          description: bottleModel.details!.distillery ?? '-',
        ),
        DetailsItemWidget(
          title: "Region",
          description: bottleModel.details!.region ?? '-',
        ),
        DetailsItemWidget(
          title: "Country",
          description: bottleModel.details!.country ?? '-',
        ),
        DetailsItemWidget(
          title: "Type",
          description: bottleModel.details!.type ?? '-',
        ),
        DetailsItemWidget(
          title: "Age statement",
          description: bottleModel.details!.ageStatement ?? '-',
        ),
        DetailsItemWidget(
          title: "Filled",
          description: bottleModel.details!.filled ?? '-',
        ),
        DetailsItemWidget(
          title: "Bottled",
          description: bottleModel.details!.bottled ?? '-',
        ),
        DetailsItemWidget(
          title: "Cask number",
          description: bottleModel.details!.caskNumber ?? '-',
        ),
        DetailsItemWidget(
          title: "ABV",
          description: bottleModel.details!.abv ?? '-',
        ),
        DetailsItemWidget(
          title: "Size",
          description: bottleModel.details!.size ?? '-',
        ),
        DetailsItemWidget(
          title: "Finish",
          description: bottleModel.details!.finish ?? '-',
        )
      ],
    );
  }
}

class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: AppTextStyles.latoMedium(
                  fontWeight: FontWeight.w400, color: Palette.whiteColor)),
          Text(description,
              style: AppTextStyles.latoMedium(
                  fontWeight: FontWeight.w400, color: Palette.subtitleColor))
        ],
      ),
    );
  }
}
