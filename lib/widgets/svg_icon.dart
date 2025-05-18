import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget svgIcon({required String svgText}) {
  return SvgPicture.asset(
    svgText,
    width: 24.sp,
    height: 24.sp,
  );
}
