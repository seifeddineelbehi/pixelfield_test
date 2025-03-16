import 'package:flutter/material.dart';
import 'package:pixelfield_test/core/util/palette.dart';

///@nodoc
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(color: Palette.secondaryColor),
        ),
      ),
    );
  }
}
