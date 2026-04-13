import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_language_section.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_logout_section.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_theme_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            context.gapH(32),
            const ProfileHeader(),
            context.gapH(32),
            const ProfileLanguageSection(),
            context.gapH(16),
            const ProfileThemeSection(),
            context.gapH(16),
            const ProfileLogoutSection(),
          ],
        ),
      ),
    );
  }
}
