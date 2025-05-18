import 'package:flutter/material.dart';
import 'package:flutter_asssesment/theme/color_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cardButton() {
  return Container(
    alignment: Alignment.center,
    width: 50.w,
    height: 26.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        gradient: LinearGradient(
          colors: [
            ColorPallete.gradient1,
            ColorPallete.gradient2,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )),
    child: Text(
      'A',
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorPallete.backgroundColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
