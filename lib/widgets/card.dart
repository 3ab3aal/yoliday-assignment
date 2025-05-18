import 'package:flutter/material.dart';
import 'package:flutter_asssesment/theme/color_palette.dart';
import 'package:flutter_asssesment/widgets/card_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cardWidget({
  required String imageText,
  required String title,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.w,
      vertical: 8.h,
    ),
    child: Container(
      width: double.maxFinite,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorPallete.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10.r),
            ),
            child: Image.asset(
              imageText,
              height: 110.h,
              width: 110.w,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                child: SizedBox(
                  width: 201.w,
                  height: 36.h,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      height: 18 / 14.sp,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BAHASA SUNDA',
                        style: TextStyle(
                          color: ColorPallete.blackColor,
                          fontFamily: 'Roboto',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Oleh ',
                            style: TextStyle(
                              color: ColorPallete.smallFontColor,
                              fontFamily: 'Roboto',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'Al-Baiqi Samaan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ))
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 54.w,
                  ),
                  cardButton(),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
