import 'dart:ui';
import 'package:evently/core/utils/change_lang/localization_provider.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingSelectionPanel extends StatelessWidget {
  const OnboardingSelectionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, localizationProvider, child) {
        return Column(
          children: [
            _buildSelectionRow(
              context,
              title: context.lan.language,
              icon: Icons.language,
              value: localizationProvider.currentLanguage == 'ar' ? 'العربية' : 'English',
              onToggle: () {
                final nextLang = localizationProvider.currentLanguage == 'ar' ? 'en' : 'ar';
                localizationProvider.changeLanguage(nextLang);
              },
              trailingIcon: context.isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            ),
            context.gapH(16),
            _buildSelectionRow(
              context,
              title: context.lan.dark_mode,
              icon: localizationProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              isSwitch: true,
              value: localizationProvider.isDarkTheme,
              onToggle: () {
                localizationProvider.changeTheme(
                  localizationProvider.isDarkTheme ? ThemeMode.light : ThemeMode.dark,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectionRow(
    BuildContext context, {
    required String title,
    required IconData icon,
    dynamic value,
    required VoidCallback onToggle,
    bool isSwitch = false,
    IconData? trailingIcon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.customColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.customColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: context.customColors.primary, size: 24.sp),
          context.gapW(12),
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          const Spacer(),
          if (isSwitch)
            Switch.adaptive(
              value: value as bool,
              onChanged: (_) => onToggle(),
              activeColor: context.customColors.primary,
            )
          else
            InkWell(
              onTap: onToggle,
              child: Row(
                children: [
                  Text(
                    value.toString(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.customColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  if (trailingIcon != null) ...[
                    context.gapW(4),
                    Icon(trailingIcon, color: context.customColors.primary, size: 20.sp),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
