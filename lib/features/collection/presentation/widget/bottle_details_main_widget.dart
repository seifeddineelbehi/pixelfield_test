import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/helper_functions.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/core/widgets/custom_toggle_button.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_details_widget.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_history_widget.dart';
import 'package:pixelfield_test/features/collection/presentation/widget/bottle_details_tasting_notes_widget.dart';

class BottleDetailsMainWidget extends StatefulWidget {
  const BottleDetailsMainWidget({required this.bottleModel, super.key});

  final BottleModel bottleModel;

  @override
  State<BottleDetailsMainWidget> createState() =>
      _BottleDetailsMainWidgetState();
}

class _BottleDetailsMainWidgetState extends State<BottleDetailsMainWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Palette.mainColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 16.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bottle ${widget.bottleModel.bottleNum}",
                style: AppTextStyles.latoSmall()),
            Text.rich(
              TextSpan(
                text: "${widget.bottleModel.bottleName} ",
                // First part
                style:
                    AppTextStyles.ebGaramondLarge(fontWeight: FontWeight.w500),

                children: [
                  TextSpan(
                      text:
                          calculateBottleAge(int.parse(widget.bottleModel.bottleProdYear!)),
                      // Second part
                      style: AppTextStyles.ebGaramondLarge(
                          fontWeight: FontWeight.w500,
                          color: Palette.secondaryColor)),
                ],
              ),
            ),
            Text(
              "#${widget.bottleModel.bottleRef}",
              style: AppTextStyles.ebGaramondLarge(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.sp),
            Center(
              child: ToggleButton(
                onFirstButtonTap: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                },
                onSecondButtonTap: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                },
                onThirdButtonTap: () {
                  setState(() {
                    currentPageIndex = 2;
                  });
                },
                firstButtonText: 'Details',
                secondButtonText: 'Tasting notes',
                thirdButtonText: "History",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.sp),
              child: currentPageIndex == 0
                  ? BottleDetailsDetailsWidget(
                      bottleModel: widget.bottleModel,
                    )
                  : currentPageIndex == 1
                      ? BottleDetailsTastingNotesWidget(
                          bottleModel: widget.bottleModel,
                        )
                      : BottleDetailsHistoryWidget(
                          bottleModel: widget.bottleModel),
            ),
          ],
        ),
      ),
    );
  }
}
