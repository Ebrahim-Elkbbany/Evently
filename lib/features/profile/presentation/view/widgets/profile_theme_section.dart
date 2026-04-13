import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileThemeSection extends StatelessWidget {
  const ProfileThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationProvider = context.watch<LocalizationProvider>();
    return ProfileMenuItem(
      title: context.lan.dark_mode,
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch.adaptive(
          value: localizationProvider.currentTheme == ThemeMode.dark,
          onChanged: (value) {
            localizationProvider.changeTheme(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
          padding: EdgeInsets.zero,
          activeThumbColor: context.customColors.white,
          activeTrackColor: context.customColors.primary,
          inactiveThumbColor: context.customColors.white,
          inactiveTrackColor: const Color(0xffE9EAEB),
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
