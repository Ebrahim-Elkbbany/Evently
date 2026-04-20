import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/onboarding/data/models/onboarding_model.dart';
import 'package:evently/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_bottom_navigation.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_header.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_selection_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        final List<OnboardingModel> data = provider.onboardingData(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  context.gapH(16),
                  OnboardingHeader(totalPages: data.length),
                  Expanded(
                    child: PageView.builder(
                      controller: provider.pageController,
                      onPageChanged: provider.updateIndex,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: index == 0 ? 5 : 6,
                                child: Image.asset(
                                  data[index].image,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              if (index > 0) ...[
                                context.gapH(16),
                                Center(
                                  child: DotsIndicator(
                                    dotsCount: data.length - 1,
                                    position:
                                        (index - 1).toDouble() >
                                            (data.length - 2).toDouble()
                                        ? (data.length - 2).toDouble()
                                        : (index - 1).toDouble(),
                                    decorator: DotsDecorator(
                                      size: Size.square(10.r),
                                      activeSize: Size(30.w, 10.r),
                                      activeShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                      ),
                                      activeColor: context.customColors.primary,
                                      color: context.customColors.disable,
                                      spacing: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                    ),
                                  ),
                                ),
                                context.gapH(24),
                              ],
                              Align(
                                alignment: context.isArabic
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Text(
                                  data[index].title,
                                  style: context.textTheme.headlineSmall
                                      ?.copyWith(
                                        color: context.customColors.mainText, 
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                      ),
                                ),
                              ),
                              context.gapH(16),
                              if (data[index].subtitle != null)
                                Text(
                                  data[index].subtitle!,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color: context.customColors.secondaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        height: 1.5,
                                      ),
                                ),
                              if (index == 0) ...[
                                context.gapH(24),
                                const OnboardingSelectionPanel(),
                              ],
                              context.gapH(16),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  OnboardingBottomNavigation(
                    provider: provider,
                    totalPages: data.length,
                  ),
                  context.gapH(24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
