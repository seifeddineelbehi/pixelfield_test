import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String initialValue;
  final IconButton? suffixIcon;
  final Color? hintColor;
  final Color textColor;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final String? Function(String?)? onValidate;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CustomTextFormField({
    Key? key,
    this.text,
    this.initialValue = "",
    this.suffixIcon,
    this.hintColor = Palette.whiteColor,
    required this.onSaved,
    required this.controller,
    required this.textColor,
    required this.onValidate,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text != null
            ? Text(
                text!,
                style: AppTextStyles.latoSmall(color: Palette.secondaryColor),
              )
            : Container(),
        TextFormField(
          textInputAction: textInputAction,
          style: AppTextStyles.latoMedium(fontWeight: FontWeight.w400),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            focusColor: Palette.secondaryColor,
            suffixIcon: suffixIcon != null ? suffixIcon : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Palette.secondaryColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Palette.secondaryColor),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.sp, horizontal: 16.sp),
          ),
          keyboardType: textInputType,
          onSaved: onSaved,
          validator: onValidate,
        ),
      ],
    );
  }
}
