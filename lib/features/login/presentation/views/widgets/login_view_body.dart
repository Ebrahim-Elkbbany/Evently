import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/login/presentation/views/widgets/create_account_row.dart';
import 'package:evently/features/login/presentation/views/widgets/login_form.dart';
import 'package:evently/features/login/presentation/views/widgets/social_login_section.dart';
import 'package:evently/features/profile/presentation/manager/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              context.lan.login_to_your_account,
              style: context.textTheme.headlineMedium,
            ),
            context.gapH(24),
            const LoginForm(),
            context.gapH(48),
            const CreateAccountRow(),
            context.gapH(24),
            const SocialLoginSection(),
            context.gapH(32),
          ],
        ),
      ),
    );
  }
}
