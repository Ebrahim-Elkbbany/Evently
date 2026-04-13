import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/profile/presentation/manager/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        final name = provider.user?.name ?? '...';
        final email = provider.user?.email ?? '...';

        return Column(
          children: [
            Center(
              child: Container(
                width: 116.r,
                height: 116.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(AppImages.profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            context.gapH(24),
            Text(
              name,
              style: context.textTheme.headlineMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: context.customColors.mainText,
              ),
            ),
            context.gapH(8),
            Text(
              email,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 14.sp,
                color: context.customColors.secondaryText,
              ),
            ),
          ],
        );
      },
    );
  }
}
