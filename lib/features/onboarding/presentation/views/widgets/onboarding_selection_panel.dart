import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding_choice_row.dart';

class OnboardingSelectionPanel extends StatelessWidget {
  const OnboardingSelectionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, localizationProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnboardingChoiceRow(
              label: context.lan.language,
              leftText: context.lan.english,
              rightText: context.lan.arabic,
              leftSelected: localizationProvider.currentLanguage == 'en',
              onLeftTap: () => localizationProvider.changeLanguage('en'),
              onRightTap: () => localizationProvider.changeLanguage('ar'),
            ),
            context.gapH(16),
            OnboardingChoiceRow(
              label: context.lan.theme,
              leftIcon: Icons.sunny,
              rightIcon: Icons.dark_mode,
              leftSelected: !localizationProvider.isDarkTheme,
              onLeftTap: () => context.read<LocalizationProvider>().changeTheme(
                ThemeMode.light,
              ),
              onRightTap: () => context
                  .read<LocalizationProvider>()
                  .changeTheme(ThemeMode.dark),
            ),
          ],
        );
      },
    );
  }
}
