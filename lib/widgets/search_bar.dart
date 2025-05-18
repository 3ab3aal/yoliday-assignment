import 'package:flutter/material.dart';
import 'package:flutter_asssesment/theme/color_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.h, 8.w),
      child: SizedBox(
        height: 44.h,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: borderDecoration(),
            enabledBorder: borderDecoration(),
            focusedBorder: borderDecoration(),
            focusedErrorBorder: borderDecoration(),
            errorBorder: borderDecoration(),
            disabledBorder: borderDecoration(),
            hintText: 'Search a project',
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                margin: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: ColorPallete.mainColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.search,
                  color: ColorPallete.backgroundColor,
                  size: 16.sp,
                ),
              ),
            ),
            fillColor: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }
}

borderDecoration() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorPallete.borderColor,
    ),
    borderRadius: BorderRadius.circular(10.r),
  );
}
