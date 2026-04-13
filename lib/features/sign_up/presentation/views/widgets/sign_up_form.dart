import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/app_regex_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/extensions/firebase_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/core/widgets/text_fields/custom_password_text_field.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:evently/features/sign_up/data/models/sign_up_model.dart';
import 'package:evently/features/sign_up/presentation/manager/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.name_is_required;
              }
              return null;
            },
            controller: nameController,
            hintText: context.lan.enter_your_name,
            prefixIcon: Icons.person_outline,
          ),
          context.gapH(16),
          CustomTextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegexHelper.isEmailValid(value)) {
                return context.lan.invalidEmail;
              }
              return null;
            },
            controller: emailController,
            hintText: context.lan.enter_your_email,
            prefixIcon: Icons.email_outlined,
          ),
          context.gapH(16),
          CustomPasswordTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.password_is_required;
              } else if (!AppRegexHelper.isPasswordValid(value)) {
                return context.lan.week_password;
              }
              return null;
            },
            controller: passwordController,
            hintText: context.lan.enter_your_password,
          ),
          context.gapH(16),
          CustomPasswordTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.confirm_password_is_required;
              } else if (passwordController.text !=
                  confirmPasswordController.text) {
                return context.lan.passwords_do_not_match;
              }
              return null;
            },
            controller: confirmPasswordController,
            hintText: context.lan.confirm_your_password,
          ),
          context.gapH(52),
          CustomButton(
            buttonName: context.lan.sing_up,
            isLoading: context.watch<SignUpProvider>().isLoading,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                var result = await context
                    .read<SignUpProvider>()
                    .signUpWithEmailAndPassword(
                      SignUpModel(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                result.fold(
                  (error) => context.handleAuthError(error),
                  (r) {
                    CustomSnackBar.show(
                      context: context,
                      message: context.lan.successfully_signed_up,
                      type: CustomSnackBarType.success,
                    );
                    context.pushReplacementNamed(AppRoutes.layoutView);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
