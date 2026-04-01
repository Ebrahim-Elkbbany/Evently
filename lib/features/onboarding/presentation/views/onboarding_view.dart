import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_bottom_sec.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_header_sec.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController? controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              context.gapH(16),
              const OnboardingHeaderImage(),
              context.gapH(100),
              OnboardingPageView(
                controller: controller!,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
              ),
              context.gapH(80),
              OnboardingTextSection(currentIndex: currentIndex),
              context.gapH(20),
              OnboardingBottomSection(
                currentIndex: currentIndex,
                backButtonOntap: () {
                  controller!.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                nextButtonOntap: () {
                  if (currentIndex ==
                      OnboardingModel.onboardingData.length - 1) {
                  } else {
                    controller!.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
