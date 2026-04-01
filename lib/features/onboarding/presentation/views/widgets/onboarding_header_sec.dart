import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeaderImage extends StatelessWidget {
  const OnboardingHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AspectRatio(
        aspectRatio: 291 / 151,
        child: Image.asset(AppImages.onboarding1, width: 291.w, height: 171.h),
      ),
    );
  }
}
