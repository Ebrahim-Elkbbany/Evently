import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

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
          onTap: () {},
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
                  context.lan.login_with_google,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
