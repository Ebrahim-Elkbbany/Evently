import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarItem customBottomNavBarItem({
  required String label,
  required IconData icon,
  required BuildContext context,
}) {
  return BottomNavigationBarItem(
    activeIcon: Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 17.w),
      child: Icon(icon, color: context.customColors.primary, size: 24.w),
    ),
    icon: Icon(icon, size: 24.w),
    label: label,
  );
}
