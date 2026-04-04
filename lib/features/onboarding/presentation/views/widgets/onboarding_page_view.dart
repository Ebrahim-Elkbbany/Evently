import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  final PageController controller;
  final void Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: PageView.builder(
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: OnboardingModel.onboardingData(context).length,
        itemBuilder: (context, index) {
          return Image.asset(
            OnboardingModel.onboardingData(context)[index].image,
          );
        },
      ),
    );
  }
}
