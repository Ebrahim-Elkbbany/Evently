import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountRow extends StatelessWidget {
  const AlreadyHaveAnAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.lan.already_have_an_account,
          style: context.textTheme.bodySmall,
        ),
        CustomTextButton(
          text: context.lan.login,
          onPressed: () {},
          isUnderLine: true,
        ),
      ],
    );
  }
}
