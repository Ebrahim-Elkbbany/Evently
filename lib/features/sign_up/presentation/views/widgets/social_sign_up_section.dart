import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/features/sign_up/presentation/manager/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SocialSignUpSection extends StatelessWidget {
  const SocialSignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: context.customColors.stroke,
                endIndent: 10,
                height: 1,
              ),
            ),
            Text(
              context.lan.or,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.customColors.primary,
              ),
            ),
            Expanded(
              child: Divider(
                color: context.customColors.stroke,
                indent: 10,
                height: 1,
              ),
            ),
          ],
        ),
        context.gapH(24),
        InkWell(
          onTap: () async {
            final result = await context
                .read<SignUpProvider>()
                .signUpWithGoogle();
            result.fold(
              (errorMessage) {
                final errorStr = errorMessage.toString().toLowerCase();
                if (errorStr.contains('canceled') ||
                    errorStr.contains('cancelled') ||
                    errorStr.contains('12501')) {
                  return;
                } else {
                  CustomSnackBar.show(
                    context: context,
                    message: errorMessage,
                    type: CustomSnackBarType.error,
                  );
                }
              },
              (userModel) {
                CustomSnackBar.show(
                  context: context,
                  message: context.lan.successfully_signed_up,
                  type: CustomSnackBarType.success,
                );
                context.pushReplacementNamed(AppRoutes.layoutView);
              },
            );
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: context.customColors.inputs,
              border: Border.all(color: context.customColors.stroke),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.googleIcon, height: 24.h, width: 24.w),
                context.gapW(10),
                Text(
                  context.lan.sign_up_with_google,
                  style: context.textTheme.displayLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
