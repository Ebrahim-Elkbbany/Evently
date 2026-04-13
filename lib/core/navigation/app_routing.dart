import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/add_event/presentation/view/add_event_view.dart';
import 'package:evently/features/home/presentation/manager/home_provider.dart';
import 'package:evently/features/layout/manager/layout_provider.dart';
import 'package:evently/features/layout/presentation/layout_view.dart';
import 'package:evently/features/login/presentation/manager/login_provider.dart';
import 'package:evently/features/login/presentation/views/login_view.dart';
import 'package:evently/features/sign_up/presentation/manager/sign_up_provider.dart';
import 'package:evently/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    var name = routeSettings.name;
    User? currentUser = FirebaseServices.firebaseAuth.currentUser;
    try {
      switch (name) {
        case AppRoutes.initialRoute:
          return MaterialPageRoute(
            builder: (context) => currentUser == null
                ? ChangeNotifierProvider(
                    create: (context) => LoginProvider(),
                    child: const LoginView(),
                  )
                : MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => LayoutProvider()),
                      ChangeNotifierProvider(create: (_) => HomeProvider()),
                    ],
                    child: const LayoutView(),
                  ),
          );
        case AppRoutes.layoutView:
          return MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => LayoutProvider()),
                ChangeNotifierProvider(create: (_) => HomeProvider()),
              ],
              child: const LayoutView(),
            ),
          );
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
        case AppRoutes.addEventView:
          return MaterialPageRoute(builder: (context) => const AddEventView());
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
