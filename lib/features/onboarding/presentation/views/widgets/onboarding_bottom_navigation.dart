import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBottomNavigation extends StatelessWidget {
  const OnboardingBottomNavigation({
    super.key,
    required this.provider,
    required this.totalPages,
  });

  final OnboardingProvider provider;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = provider.currentIndex == totalPages - 1;
    final bool isFirstPage = provider.currentIndex == 0;

    return CustomButton(
      buttonName: isFirstPage
          ? context.lan.letsStart
          : (isLastPage ? context.lan.getStarted : context.lan.next),
      onPressed: () {
        if (isLastPage) {
          provider.skip(context, totalPages);
        } else {
          provider.next(context, totalPages: totalPages);
        }
      },
      textStyle: context.textTheme.titleMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
      radius: 16,
    );
  }
}
