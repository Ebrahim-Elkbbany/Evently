import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileLogoutSection extends StatelessWidget {
  const ProfileLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      title: context.lan.logout,
      trailing: Icon(
        Icons.logout_rounded,
        color: context.customColors.red,
        size: 24.r,
      ),
      onTap: () {
        FirebaseServices.logout();
        context.pushNamedAndRemoveUntil(
          AppRoutes.loginView,
          predicate: (route) => false,
        );
      },
    );
  }
}
