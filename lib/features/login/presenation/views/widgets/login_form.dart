import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:evently/core/widgets/text_fields/custom_password_text_field.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          isUnderLine: true,
        ),
        context.gapH(48),
        CustomButton(
          buttonName: context.lan.login,
          onPressed: () {},
        ),
      ],
    );
  }
}
