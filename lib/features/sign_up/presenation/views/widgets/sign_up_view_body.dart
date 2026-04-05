import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/profile/presentation/manager/config_provider.dart';
import 'package:evently/features/sign_up/presenation/views/widgets/already_have_an_account_row.dart';
import 'package:evently/features/sign_up/presenation/views/widgets/sign_up_form.dart';
import 'package:evently/features/sign_up/presenation/views/widgets/social_sign_up_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.gapH(60),
            Image.asset(
              configProvider.isDarkThme
                  ? AppImages.logoDark
                  : AppImages.logoLight,
              height: 26.h,
              width: 142.w,
            ),
            context.gapH(48),
            Text(
              context.lan.create_your_account,
              style: context.textTheme.headlineMedium,
            ),
            context.gapH(24),
            const SignUpForm(),
            context.gapH(24),
            const AlreadyHaveAnAccountRow(),
            context.gapH(32),
            const SocialSignUpSection(),
            context.gapH(32),
          ],
        ),
      ),
    );
  }
}
