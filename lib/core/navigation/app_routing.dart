import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/utils/constants/storage_keys.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/shared_prefrences_helper.dart';
import 'package:evently/features/add_event/presentation/manager/add_event_provider.dart';
import 'package:evently/features/add_event/presentation/view/add_event_view.dart';
import 'package:evently/features/home/presentation/manager/home_provider.dart';
import 'package:evently/features/layout/manager/layout_provider.dart';
import 'package:evently/features/layout/presentation/layout_view.dart';
import 'package:evently/features/login/presentation/manager/login_provider.dart';
import 'package:evently/features/login/presentation/views/login_view.dart';
import 'package:evently/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:evently/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:evently/features/sign_up/presentation/manager/sign_up_provider.dart';
import 'package:evently/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:evently/features/welcome/presentation/view/welcome_view.dart';
import 'package:evently/features/event_details/presentation/view/event_details_view.dart';
import 'package:evently/features/edit_event/presentation/manager/edit_event_provider.dart';
import 'package:evently/features/edit_event/presentation/view/edit_event_view.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
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
          final bool onBoardingShowed =
              sharedPrefsHelper.sharedPreferences.getBool(
                StorageKeys.onBoardingShowed,
              ) ??
              false;
          return MaterialPageRoute(
            builder: (context) => !onBoardingShowed
                ? ChangeNotifierProvider(
                    create: (_) => OnboardingProvider(sharedPrefsHelper),
                    child: const OnboardingView(),
                  )
                : currentUser == null
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
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => AddEventProvider(),
              child: const AddEventView(),
            ),
          );
        case AppRoutes.onboardingView:
          return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => OnboardingProvider(sharedPrefsHelper),
              child: const OnboardingView(),
            ),
          );
        case AppRoutes.eventDetailsView:
          final event = routeSettings.arguments as EventModel;
          return MaterialPageRoute(
            builder: (context) => EventDetailsView(event: event),
          );
        case AppRoutes.editEventView:
          final event = routeSettings.arguments as EventModel;
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => EditEventProvider(event: event),
              child: const EditEventView(),
            ),
          );
        case AppRoutes.welcomeView:
          return MaterialPageRoute(builder: (context) => const WelcomeView());
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    context.lan.navgationError,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
