import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:evently/core/widgets/text_fields/custom_password_text_field.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
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
            context.gapH(20),
            Image.asset(
              configProvider.isDarkThme
                  ? AppImages.logoDark
                  : AppImages.logoLight,
              height: 27.h,
              width: 142.w,
            ),
            context.gapH(48),
            Text(
              context.lan.login_to_your_account,
              style: context.textTheme.headlineMedium,
            ),
            context.gapH(24),
            CustomTextFormField(
              hintText: context.lan.enter_your_email,
              prefixIcon: Icons.email_outlined,
            ),
            context.gapH(16),
            CustomPasswordTextField(hintText: context.lan.enter_your_password),
            context.gapH(24),
            CustomTextButton(
              text: context.lan.forget_password,
              onPressed: () {},
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
