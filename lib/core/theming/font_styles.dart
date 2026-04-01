import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyles {
  static TextStyle font50SemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 50.sp,
    height: 1.09,
    fontFamily: "Poppins",
  );

  static TextStyle font20SemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 20.sp,
    fontFamily: "Poppins",
  );

  static TextStyle font16Regular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    fontFamily: "Poppins",
  );

  static TextStyle font16SemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 16.sp,
    fontFamily: "Poppins",
  );

  static TextStyle font14Bold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 14.sp,
    fontFamily: "Poppins",
  );
}
