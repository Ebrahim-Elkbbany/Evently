import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_page_content.dart';
import 'package:evently/features/onboarding/presentation/views/widgets/onboarding_selection_panel.dart';
import 'package:evently/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        final List<OnboardingEntity> data = provider.onboardingData(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  context.gapH(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/app_logo.png', // Assuming logo path
                        height: 40.h,
                      ),
                      if (provider.currentIndex != data.length - 1)
                        TextButton(
                          onPressed: () => provider.skip(data.length),
                          child: Text(
                            context.lan.skip,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.customColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: provider.pageController,
                      onPageChanged: provider.updateIndex,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: OnboardingPageContent(
                                onboarding: data[index],
                              ),
                            ),
                            if (index == 0) ...[
                              context.gapH(24),
                              const OnboardingSelectionPanel(),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                  context.gapH(24),
                  _buildBottomNavigation(context, provider, data.length),
                  context.gapH(24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation(
    BuildContext context,
    OnboardingProvider provider,
    int totalPages,
  ) {
    final bool isLastPage = provider.currentIndex == totalPages - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DotsIndicator(
          dotsCount: totalPages,
          position: provider.currentIndex,
          decorator: DotsDecorator(
            size: Size.square(10.r),
            activeSize: Size(30.w, 10.r),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            activeColor: context.customColors.primary,
            color: context.customColors.disable,
            spacing: EdgeInsets.symmetric(horizontal: 4.w),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (isLastPage) {
              // Finalize onboarding - navigation will be handled by router flow
              // Or just pop/replace route here if appropriate
            } else {
              provider.next(context, totalPages: totalPages);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.customColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 4,
          ),
          child: Text(
            isLastPage ? context.lan.done : context.lan.next,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
