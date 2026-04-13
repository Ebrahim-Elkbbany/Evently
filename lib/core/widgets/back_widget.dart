import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const BackWidget({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: onTap ?? () => context.pop(),
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 16.w),
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.customColors.inputs,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: context.customColors.stroke),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.sp,
            color: iconColor ?? context.customColors.headLine,
          ),
        ),
      ),
    );
  }
}
