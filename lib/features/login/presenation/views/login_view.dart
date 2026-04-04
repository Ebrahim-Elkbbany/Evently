import 'package:evently/features/login/presenation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: LoginViewBody()));
  }
}
