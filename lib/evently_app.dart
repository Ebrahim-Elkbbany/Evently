import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/app_routing.dart';
import 'package:evently/core/theming/app_theme.dart';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, localizationProvider, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: localizationProvider.currentTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(localizationProvider.currentLanguage),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: AppRoutes.onboardingView,
            );
          },
        );
      },
    );
  }
}
