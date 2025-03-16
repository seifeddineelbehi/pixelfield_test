import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/core/util/text_styles.dart';
import 'package:pixelfield_test/core/widgets/custom_button.dart';
import 'package:pixelfield_test/features/auth/presentation/screen/auth_page.dart';
import 'package:pixelfield_test/generated/assets.dart';

class WelcomingPage extends StatefulWidget {
  const WelcomingPage({Key? key}) : super(key: key);

  @override
  _WelcomingPageState createState() => _WelcomingPageState();
}

class _WelcomingPageState extends State<WelcomingPage> {
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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Container(
              width: 1.sw,
              height: 0.35.sh,
              color: Palette.mainColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 28.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Welcome!",
                          style: AppTextStyles.ebGaramondLarge(
                              fontWeight: FontWeight.w500),
                        ),
                        Text("Text Text Text",
                            style: AppTextStyles.latoMedium(
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => AuthPage(),
                            ),
                          );
                        },
                        text: "Scan bottle"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? ",
                            style: AppTextStyles.latoMedium(
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 12.sp),
                        TextButton(
                          onPressed: () {},
                          child: Text("Sign in first",
                              style: AppTextStyles.ebGaramondMedium(
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
