import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTabItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    Color getBgColor() =>
        isSelected ? context.customColors.primary : context.customColors.inputs;

    Color getTextColor() => isSelected
        ? Colors.white
        : (isDark ? Colors.white : context.customColors.mainText);

    Color getIconColor() =>
        isSelected ? Colors.white : context.customColors.primary;

    Color getBorderColor() =>
        isSelected ? context.customColors.primary : context.customColors.stroke;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: getBgColor(),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: getBorderColor(), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, size: 20.sp, color: getIconColor()),
            context.gapW(8),
            Text(
              title,
              style: context.textTheme.titleSmall?.copyWith(
                color: getTextColor(),
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
