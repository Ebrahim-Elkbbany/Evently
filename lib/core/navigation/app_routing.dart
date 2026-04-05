import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/features/login/presenation/manager/login_provider.dart';
import 'package:evently/features/login/presenation/views/login_view.dart';
import 'package:evently/features/sign_up/presenation/manager/sign_up_provider.dart';
import 'package:evently/features/sign_up/presenation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    var name = routeSettings.name;
    try {
      switch (name) {
        case AppRoutes.loginView:
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => LoginProvider(),
              child: const LoginView(),
            ),
          );
        case AppRoutes.signUpView:
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => SignUpProvider(),
              child: const SignUpView(),
            ),
          );
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Material(
          child: Container(
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
