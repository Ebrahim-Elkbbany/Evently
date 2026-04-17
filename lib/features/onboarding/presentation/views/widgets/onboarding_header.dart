import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../manager/onboarding_provider.dart';

class OnboardingHeader extends StatelessWidget {
  final int totalPages;

  const OnboardingHeader({super.key, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    final isDark = context.isDark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (provider.currentIndex > 0)
          InkWell(
            onTap: () {
              provider.pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: context.customColors.primary,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: context.customColors.primary,
                size: 20.sp,
              ),
            ),
          )
        else
          SizedBox(width: 40.sp, height: 40.sp),
        Expanded(
          child: Center(
            child: Image.asset(
              isDark ? AppImages.logoDark : AppImages.logoLight,
              height: 28.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (provider.currentIndex > 0 && provider.currentIndex < totalPages - 1)
          InkWell(
            onTap: () => provider.skip(context, totalPages),
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isDark ? Colors.transparent : Colors.white,
                border: Border.all(
                  color: isDark
                      ? context.customColors.primary
                      : Colors.transparent,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                context.lan.skip,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.customColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        else
          SizedBox(width: 65.w, height: 40.sp),
      ],
    );
  }
}
