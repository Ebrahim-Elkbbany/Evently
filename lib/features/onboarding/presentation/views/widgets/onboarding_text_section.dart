import 'package:evently/core/theming/font_styles.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          OnboardingModel.onboardingData[currentIndex].title,
          style: FontStyles.font20SemiBold.copyWith(
            color: context.customColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        context.gapH(30),
        if (OnboardingModel.onboardingData[currentIndex].subtitle != null)
          Text(
            OnboardingModel.onboardingData[currentIndex].subtitle!,
            textAlign: TextAlign.center,
            style: FontStyles.font20SemiBold.copyWith(
              color: context.customColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
