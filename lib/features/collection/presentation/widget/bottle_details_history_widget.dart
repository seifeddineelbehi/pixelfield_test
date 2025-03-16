import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_history_card_widget.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_history_stepper_widget.dart';

class BottleDetailsHistoryWidget extends StatelessWidget {
  const BottleDetailsHistoryWidget({
    super.key,
    required this.bottleModel,
  });

  final BottleModel bottleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Palette.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bottleModel.history!.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 0.32.sh,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottleDetailsHistoryStepperWidget(),
                  SizedBox(width: 16.sp),
                  BottleDetailsHistoryCardWidget(
                    bottleModel: bottleModel,
                    index: index,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
