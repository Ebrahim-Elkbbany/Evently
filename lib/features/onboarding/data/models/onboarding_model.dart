import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String? subtitle;

  OnboardingModel({required this.image, required this.title, this.subtitle});

  static List<OnboardingModel> onboardingData(BuildContext context) {
    List<OnboardingModel> onboarding = [
      OnboardingModel(
        image: AppImages.onboarding1,
        title: context.lan.onboarding1Title,
        subtitle: context.lan.onboarding1Subtitle,
      ),
      OnboardingModel(
        image: AppImages.onboarding2,
        title: context.lan.onboarding2Title,
        subtitle: context.lan.onboarding2Subtitle,
      ),
      OnboardingModel(
        image: AppImages.onboarding3,
        title: context.lan.onboarding3Title,
        subtitle: context.lan.onboarding3Subtitle,
      ),
      OnboardingModel(
        image: AppImages.onboarding4,
        title: context.lan.onboarding4Title,
        subtitle: context.lan.onboarding4Subtitle,
      ),
    ];
    return onboarding;
  }
}
