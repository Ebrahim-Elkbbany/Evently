import 'package:evently/core/services/fcm_service.dart';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/core/utils/shared_prefrences_helper.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/features/profile/presentation/manager/profile_provider.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sharedPrefsHelper = SharedPrefsHelper(sharedPreferences: await SharedPreferences.getInstance());
  FCMService.initFCM();
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
