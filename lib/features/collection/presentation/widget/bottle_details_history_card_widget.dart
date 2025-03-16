import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/generated/assets.dart';

class BottleDetailsHistoryCardWidget extends StatelessWidget {
  const BottleDetailsHistoryCardWidget({
    super.key,
    required this.bottleModel,
    required this.index,
  });

  final BottleModel bottleModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${bottleModel.history![index].date}",
            style: AppTextStyles.latoSmall(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${bottleModel.history![index].title}",
            style: AppTextStyles.ebGaramondLarge(
                fontWeight: FontWeight.w500, fontSize: 22),
          ),
          Text(
            "${bottleModel.history![index].desc}",
            style: AppTextStyles.latoMedium(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.sp),
          Container(
            width: 1.sw,
            height: 0.17.sh,
            color: Palette.mainDarkColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgsPaperclip,
                        height: 18.sp,
                        width: 18.sp,
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        "Attachments",
                        style: AppTextStyles.latoSmall(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.11.sh,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          bottleModel.history![index].attachments!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 0.11.sh, color: Palette.greyColorC0C7CA);
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.sp),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
