import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/presentation/screen/bottle_details_page.dart';

class BottleCardWidget extends StatelessWidget {
  const BottleCardWidget({
    required this.bottleModel,
    super.key,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BottleDetailsPage(
              bottleModel: bottleModel,
            ),
          ),
        );
      },
      child: Container(
        color: Palette.mainColor,
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.sp,
                height: 200.sp,
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Hero(
                    tag: bottleModel.bottleImage!,
                    child: Image.asset(
                      bottleModel.bottleImage!,
                      fit: BoxFit.contain, // Ensure it scales properly
                    ),
                  ),
                ),
              ),
              Text("${bottleModel.bottleName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.ebGaramondLarge(
                      fontSize: 22, fontWeight: FontWeight.w500)),
              Text("${bottleModel.bottleProdYear} #${bottleModel.bottleRef} ",
                  style: AppTextStyles.ebGaramondLarge(
                      fontSize: 22, fontWeight: FontWeight.w500)),
              Text("(${bottleModel.bottleNum})",
                  style: AppTextStyles.latoSmall()),
            ],
          ),
        ),
      ),
    );
  }
}
