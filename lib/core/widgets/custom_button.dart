import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelfield_test/core/util/palette.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final double width;
  final double height;
  final Color color;
  final SvgPicture? icon;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.width = 1,
    this.height = 58,
    this.fontSize = 16,
    this.color = Palette.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 5.0,
        textStyle: GoogleFonts.ebGaramond(
          color: Palette.textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 1.5,
        ),
      ).copyWith(
          minimumSize: MaterialStateProperty.all(Size(width.sw, height.sp))),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                SizedBox(width: 8.w), // Add some spacing
                Text(
                  text,
                  style: GoogleFonts.ebGaramond(
                    color: Palette.mainDarkColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    height: 1.5,
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: GoogleFonts.ebGaramond(
                color: Palette.mainDarkColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
                height: 1.5,
              ),
            ),
    );
  }
}
