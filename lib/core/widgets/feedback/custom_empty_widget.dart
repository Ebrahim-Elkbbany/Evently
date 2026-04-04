import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_text.dart';
import 'package:evently/core/widgets/feedback/retry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onRetry;

  const CustomEmptyWidget({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 80.sp,
              color: context.customColors.stroke,
            ),
            SizedBox(height: 16.h),
            CustomText(
              text: title ?? context.lan.noDataFound,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              textColor: context.customColors.mainText,
            ),
            if (subtitle != null) ...[
              SizedBox(height: 8.h),
              CustomText(
                text: subtitle!,
                fontSize: 14.sp,
                textColor: context.customColors.secondaryText,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              RetryButton(onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
