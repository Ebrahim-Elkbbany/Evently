import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/text_fields/custom_password_text_field.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: context.lan.enter_your_name,
          prefixIcon: Icons.person_outline,
        ),
        context.gapH(16),
        CustomTextFormField(
          hintText: context.lan.enter_your_email,
          prefixIcon: Icons.email_outlined,
        ),
        context.gapH(16),
        CustomPasswordTextField(hintText: context.lan.enter_your_password),
        context.gapH(16),
        CustomPasswordTextField(hintText: context.lan.enter_your_password),
        context.gapH(52),
        CustomButton(buttonName: context.lan.login, onPressed: () {}),
      ],
    );
  }
}
