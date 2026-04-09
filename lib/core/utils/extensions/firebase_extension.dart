import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

extension AuthErrorExtension on BuildContext {
  void handleAuthError(String errorCode) {
    String errorMessage;

    if (errorCode == 'weak-password') {
      errorMessage = lan.the_password_provided_is_too_weak;
    } else if (errorCode == 'email-already-in-use') {
      errorMessage = lan.the_account_already_exists_for_that_email;
    } else if (errorCode == 'user-not-found') {
      errorMessage = lan.no_user_found_for_that_email;
    } else if (errorCode == 'wrong-password') {
      errorMessage = lan.wrong_password_provided_for_that_user;
    } else {
      errorMessage = errorCode;
    }

    CustomSnackBar.show(
      context: this,
      message: errorMessage,
      duration: const Duration(seconds: 2),
      type: CustomSnackBarType.error,
    );
  }
}
