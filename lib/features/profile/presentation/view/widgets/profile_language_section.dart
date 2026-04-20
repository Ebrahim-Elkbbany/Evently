import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileLanguageSection extends StatelessWidget {
  const ProfileLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      title: context.lan.language,
      trailing: DropdownButton(
        items: [context.lan.arabic, context.lan.english].map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        value: context.read<LocalizationProvider>().currentLanguage == 'en'
            ? context.lan.english
            : context.lan.arabic,
        underline: SizedBox.shrink(),
        onChanged: (value) {
          if (value == null) return;
          final localizationProvider = context.read<LocalizationProvider>();
          if (value == context.lan.english &&
              localizationProvider.currentLanguage == 'en') {
            return;
          } else if (value == context.lan.arabic &&
              localizationProvider.currentLanguage == 'ar') {
            return;
          }
          final newLang = localizationProvider.currentLanguage == 'en'
              ? 'ar'
              : 'en';
          localizationProvider.changeLanguage(newLang);
        },
      ),
      onTap: () {},
    );
  }
}
