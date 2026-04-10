import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';

class CreateAccountRow extends StatelessWidget {
  const CreateAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.lan.dont_have_an_account,
          style: context.textTheme.bodySmall,
        ),
        CustomTextButton(
          text: context.lan.sing_up,
          onPressed: () {
            context.pushNamed(AppRoutes.signUpView);
          },
          isUnderLine: true,
        ),
      ],
    );
  }
}
