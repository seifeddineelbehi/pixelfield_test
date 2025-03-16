import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/features/auth/presentation/screen/welcoming_page.dart';
import 'package:pixelfield_test/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => WelcomingPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.mainDarkColor,
        image: DecorationImage(
          image: AssetImage(Assets.imagesBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        // Centering the image
        child: SizedBox(
          width: 180.sp,
          height: 180.sp,
          child: Image.asset(
            Assets.imagesLogo,
            fit: BoxFit.contain, // Ensure it scales properly
          ),
        ),
      ),
    );
  }
}
