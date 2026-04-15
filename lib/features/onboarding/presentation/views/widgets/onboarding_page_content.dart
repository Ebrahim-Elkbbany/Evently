import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingEntity onboarding;

  const OnboardingPageContent({super.key, required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            onboarding.image,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        context.gapH(24),
        Align(
          alignment: context.isArabic ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            onboarding.title,
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.customColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        context.gapH(16),
        if (onboarding.subtitle != null)
          Text(
            onboarding.subtitle!,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.customColors.mainText,
              height: 1.6,
              fontSize: 16.sp,
            ),
          ),
      ],
    );
  }
}
