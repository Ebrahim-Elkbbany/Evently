import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    isDark ? AppImages.logoLight : AppImages.logoDark,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                context.lan.welcome,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: isDark ? Colors.white : context.customColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.onboardingView,
                  );
                },
                buttonName: context.lan.letsStart,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
