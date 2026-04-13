import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileLanguageSection extends StatelessWidget {
  const ProfileLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      title: context.lan.language,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: context.customColors.primary,
        size: 20.r,
      ),
      onTap: () {
        final localizationProvider = context.read<LocalizationProvider>();
        final newLang =
            localizationProvider.currentLanguage == 'en' ? 'ar' : 'en';
        localizationProvider.changeLanguage(newLang);
      },
    );
  }
}
