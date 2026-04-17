import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingChoiceRow extends StatelessWidget {
  final String label;
  final String? leftText;
  final String? rightText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool leftSelected;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  const OnboardingChoiceRow({
    super.key,
    required this.label,
    this.leftText,
    this.rightText,
    this.leftIcon,
    this.rightIcon,
    required this.leftSelected,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: isDark ? Colors.white : context.customColors.primary,
          ),
        ),
        Row(
          children: [
            _buildSegment(
              context: context,
              text: leftText,
              icon: leftIcon,
              isSelected: leftSelected,
              isDark: isDark,
              onTap: onLeftTap,
            ),
            context.gapW(8),
            _buildSegment(
              context: context,
              text: rightText,
              icon: rightIcon,
              isSelected: !leftSelected,
              isDark: isDark,
              onTap: onRightTap,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSegment({
    required BuildContext context,
    String? text,
    IconData? icon,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    final bool hasText = text != null;
    final Color selectedBgColor = context.customColors.primary;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: hasText ? 16.w : 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? selectedBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selectedBgColor,
            width: 1.5.w,
          ),
        ),
        child: hasText
            ? Text(
                text,
                style: context.textTheme.titleSmall?.copyWith(
                  color: isSelected 
                      ? Colors.white 
                      : (isDark ? Colors.white : context.customColors.primary),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              )
            : Icon(
                icon,
                color: isSelected 
                    ? Colors.white 
                    : (isDark ? Colors.white : context.customColors.primary),
                size: 20.sp,
              ),
      ),
    );
  }
}
