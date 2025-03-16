import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/widgets/custom_button.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_main_widget.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_top_part_widget.dart';
import 'package:pixelfield_test/generated/assets.dart';

class BottleDetailsPage extends StatelessWidget {
  const BottleDetailsPage({
    required this.bottleModel,
    super.key,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          color: Palette.mainDarkColor,
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 24.sp,
                ),
                BottleDetailsTopPartWidget(bottleModel: bottleModel),
                SizedBox(
                  height: 50.sp,
                ),
                SizedBox(
                  width: 1.sw,
                  height: 0.45.sh,
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
                SizedBox(
                  height: 20.sp,
                ),
                BottleDetailsMainWidget(
                  bottleModel: bottleModel,
                ),
                SizedBox(
                  height: 24.sp,
                ),
                CustomButton(
                  onPressed: () {},
                  width: 0.5,
                  height: 46,
                  text: "Add to my collection",
                  icon: SvgPicture.asset(
                    Assets.svgsPlus,
                    height: 26.sp,
                    width: 26.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
