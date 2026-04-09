import 'package:evently/core/theming/app_colors_extension.dart';
import 'package:evently/core/theming/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CustomSnackBarType { success, error, warning, info }

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    CustomSnackBarType type = CustomSnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final colors = Theme.of(context).extension<AppColorsExtension>();

    Color backgroundColor;
    IconData icon;

    switch (type) {
      case CustomSnackBarType.success:
        backgroundColor = colors?.success ?? const Color(0xFF4CAF50);
        icon = Icons.check_circle_outline;
        break;
      case CustomSnackBarType.error:
        backgroundColor = colors?.error ?? const Color(0xFFE53935);
        icon = Icons.error_outline;
        break;
      case CustomSnackBarType.warning:
        backgroundColor = colors?.warning ?? const Color(0xFFFFA000);
        icon = Icons.warning_amber_rounded;
        break;
      case CustomSnackBarType.info:
      default:
        backgroundColor = colors?.primary ?? const Color(0xFF2196F3);
        icon = Icons.info_outline;
        break;
    }

    final textColor = colors?.white ?? Colors.white;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          content: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 24.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100.r),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: textColor, size: 24.sp),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Text(
                      message,
                      style: FontStyles.font14Regular.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
