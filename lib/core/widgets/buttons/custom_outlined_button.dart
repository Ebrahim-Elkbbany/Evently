import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.borderColor,
    this.textColor,
    this.height,
    this.width,
    this.radius,
    this.borderWidth,
    this.padding,
  });

  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          side: BorderSide(
            color: borderColor ?? context.customColors.primary,
            width: borderWidth ?? 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?.r ?? 12.r),
          ),
        ),
        child: Text(
          text,
          style:
              textStyle ??
              context.textTheme.titleSmall?.copyWith(
                color: textColor ?? context.customColors.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
