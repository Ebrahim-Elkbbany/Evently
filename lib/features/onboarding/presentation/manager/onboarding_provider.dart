import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/constants/storage_keys.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/shared_prefrences_helper.dart';
import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final SharedPrefsHelper _prefsHelper;
  final PageController pageController = PageController();
  int _currentIndex = 0;

  OnboardingProvider(this._prefsHelper);

  int get currentIndex => _currentIndex;

  Future<void> markOnboardingAsShown() async {
    await _prefsHelper.setBool(StorageKeys.onBoardingShowed, true);
  }

  List<OnboardingModel> onboardingData(BuildContext context) => [
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

  void updateIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void next(BuildContext context, {required int totalPages}) {
    if (_currentIndex < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding(context);
    }
  }

  void skip(BuildContext context, int totalPages) {
    finishOnboarding(context);
  }

  Future<void> finishOnboarding(BuildContext context) async {
    await markOnboardingAsShown();
    if (context.mounted) {
      context.pushReplacementNamed(AppRoutes.loginView);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
