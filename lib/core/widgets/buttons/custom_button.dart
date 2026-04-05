import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/button_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.onPressed,
    this.height,
    this.width,
    this.radius,
    this.textStyle,
    this.backgroundColor,
    this.isLoading = false,
  });

  final String buttonName;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.customColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?.r ?? 16.r),
          ),
        ),
        child: isLoading
            ? ButtonLoadingIndicator(color: context.customColors.mainText)
            : Text(
                buttonName,
                style: textStyle ?? context.textTheme.titleLarge,
              ),
      ),
    );
  }
}
