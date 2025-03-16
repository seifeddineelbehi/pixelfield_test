import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/bottom_nav_bar.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/core/widgets/custom_button.dart';
import 'package:pixelfield_test/core/widgets/custom_text_form_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  TextEditingController emailController =
      TextEditingController(text: "email@email.com");
  TextEditingController passwordController =
      TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Palette.backgroundColor,
          iconTheme: IconThemeData(color: Palette.whiteColor),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  Text("Sign in",
                      style: AppTextStyles.ebGaramondLarge(
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 0.06.sh,
                  ),
                  CustomTextFormField(
                    text: "Email",
                    controller: emailController,
                    textColor: Palette.blackColor,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    onSaved: (String? value) {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email shouldn't be empty";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Email format is invalid";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    textColor: Palette.blackColor,
                    obscureText: !_passwordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Palette.secondaryColor,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    text: "Password",
                    onSaved: (String? value) {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Password shouldn't be empty";
                      } else if (value.length < 6) {
                        return "Password must contain at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  CustomButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BottomNavBar(),
                          ),
                        );
                      },
                      text: "Continue"),
                  SizedBox(
                    height: 52.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Can’t sign in? ",
                          style: AppTextStyles.latoMedium(
                              fontWeight: FontWeight.w400)),
                      SizedBox(width: 12.sp),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Recover password",
                          style: AppTextStyles.ebGaramondMedium(
                            fontWeight: FontWeight.w600,
                            color: Palette.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
