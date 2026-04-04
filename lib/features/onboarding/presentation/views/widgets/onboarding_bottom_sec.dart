import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({
    super.key,
    required this.currentIndex,
    this.backButtonOntap,
    this.nextButtonOntap,
  });
  final int currentIndex;
  final VoidCallback? backButtonOntap;
  final VoidCallback? nextButtonOntap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          if (currentIndex != 0)
            CustomTextButton(onPressed: backButtonOntap ?? () {}, text: 'Back'),
          const Spacer(),
          DotsIndicator(
            decorator: DotsDecorator(
              activeColor: context.customColors.primary,
              color: const Color(0xff707070),
              shape: const CircleBorder(),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.r),
              ),
              activeSize: Size(18.r, 7.r),
              size: Size(7.r, 7.r),
              spacing: EdgeInsets.symmetric(horizontal: 5.w),
            ),
            dotsCount: OnboardingModel.onboardingData(context).length,
            position: currentIndex.toDouble(),
          ),
          const Spacer(),
          CustomTextButton(
            onPressed: nextButtonOntap ?? () {},
            text:
                currentIndex ==
                    OnboardingModel.onboardingData(context).length - 1
                ? 'Finish'
                : 'Next',
          ),
        ],
      ),
    );
  }
}
