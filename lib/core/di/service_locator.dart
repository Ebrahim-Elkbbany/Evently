import 'package:evently/core/utils/shared_prefrences_helper.dart';
import 'package:evently/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPrefsHelper>(
    () => SharedPrefsHelper(sharedPreferences: sharedPreferences),
  );

  // --- Features ---

  // -- Onboarding --
  getIt.registerFactory<OnboardingProvider>(
    () => OnboardingProvider(getIt<SharedPrefsHelper>()),
  );

  await getIt.allReady();
}
