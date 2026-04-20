import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.customColors.inputs,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: context.customColors.stroke),
        ),
        child: Icon(
          icon,
          size: 20.sp,
          color: iconColor ?? context.customColors.headLine,
        ),
      ),
    );
  }
}
