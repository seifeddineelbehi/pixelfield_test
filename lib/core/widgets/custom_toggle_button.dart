import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelfield_test/core/util/palette.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap,
    required this.onThirdButtonTap,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.thirdButtonText,
  });

  final void Function()? onFirstButtonTap;
  final void Function()? onSecondButtonTap;
  final void Function()? onThirdButtonTap;
  final String firstButtonText;
  final String secondButtonText;
  final String thirdButtonText;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

const double height = 40.0;
const double firstButtonAlign = -1.0;
const double secondButtonAlign = 0.0;
const double thirdButtonAlign = 1.0;
const Color selectedColor = Colors.white;
const Color normalColor = Palette.lightGreyColor;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color firstButtonColor;
  late Color secondButtonColor;
  late Color thirdButtonColor;

  @override
  void initState() {
    super.initState();
    xAlign = firstButtonAlign;
    firstButtonColor = selectedColor;
    secondButtonColor = normalColor;
    thirdButtonColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: height,
      decoration: const BoxDecoration(
        color: Palette.backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: 0.75.sw / 3, // Divide width by 3 for 3 buttons
              height: height,
              decoration: const BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = firstButtonAlign;
                firstButtonColor = selectedColor;
                secondButtonColor = normalColor;
                thirdButtonColor = normalColor;
              });
              widget.onFirstButtonTap!();
            },
            child: CustomToggleTextWidget(
              index: -1,
              firstButtonText: widget.firstButtonText,
              firstButtonColor: firstButtonColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = secondButtonAlign;
                secondButtonColor = selectedColor;
                firstButtonColor = normalColor;
                thirdButtonColor = normalColor;
              });
              widget.onSecondButtonTap!();
            },
            child: CustomToggleTextWidget(
              index: 0,
              firstButtonText: widget.secondButtonText,
              firstButtonColor: secondButtonColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = thirdButtonAlign;
                thirdButtonColor = selectedColor;
                firstButtonColor = normalColor;
                secondButtonColor = normalColor;
              });
              widget.onThirdButtonTap!();
            },
            child: CustomToggleTextWidget(
              index: 1,
              firstButtonText: widget.thirdButtonText,
              firstButtonColor: thirdButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomToggleTextWidget extends StatelessWidget {
  const CustomToggleTextWidget({
    super.key,
    required this.firstButtonText,
    required this.firstButtonColor,
    required this.index,
  });

  final Color firstButtonColor;
  final double index;
  final String firstButtonText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(index, 0),
      child: Container(
        width: 0.75.sw / 3,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          firstButtonText,
          style: GoogleFonts.lato(
            color: firstButtonColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
