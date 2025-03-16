import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/generated/assets.dart';

class BottleDetailsHistoryStepperWidget extends StatelessWidget {
  const BottleDetailsHistoryStepperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 1,
          height: 0.5.sh,
          color: Palette.secondaryColor,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Palette.whiteColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            Assets.svgsAccents,
            height: 40.sp,
            width: 40.sp,
          ),
        ),
      ],
    );
  }
}
