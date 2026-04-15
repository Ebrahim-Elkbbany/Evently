import 'package:evently/core/di/service_locator.dart';
import 'package:evently/core/services/fcm_service.dart';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/features/profile/presentation/manager/profile_provider.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
  await FCMService.initFCM();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()..getUserData()),
      ],
      child: const EventlyApp(),
    ),
  );
}
