import 'package:evently/core/utils/app_regex_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/extensions/firebase_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/core/widgets/text_fields/custom_password_text_field.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:evently/features/login/data/models/sign_in_model.dart';
import 'package:evently/features/login/presentation/manager/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegexHelper.isEmailValid(value)) {
                return context.lan.invalidEmail;
              }
              return null;
            },
            hintText: context.lan.enter_your_email,
            prefixIcon: Icons.email_outlined,
          ),
          context.gapH(16),
          CustomPasswordTextField(
            controller: passwordController,
            hintText: context.lan.enter_your_password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.password_is_required;
              }
              return null;
            },
          ),
          context.gapH(24),
          CustomTextButton(
            alignment: AlignmentDirectional.centerEnd,
            text: context.lan.forget_password,
            onPressed: () {},
            isUnderLine: true,
          ),
          context.gapH(48),
          CustomButton(
            isLoading: context.watch<LoginProvider>().isLoading,
            buttonName: context.lan.login,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                var result = await context
                    .read<LoginProvider>()
                    .loginWithEmailAndPassword(
                      SignInModel(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                      context,
                    );
                result.fold(
                  (errorMessage) => context.handleAuthError(errorMessage),
                  (right) => CustomSnackBar.show(
                    context: context,
                    message: context.lan.successfully_logged_in,
                    type: CustomSnackBarType.success,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
