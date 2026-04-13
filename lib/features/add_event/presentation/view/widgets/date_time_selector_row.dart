import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeSelectorRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String actionText;
  final VoidCallback onTap;

  const DateTimeSelectorRow({
    super.key,
    required this.icon,
    required this.label,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: context.customColors.primary, size: 24.w),
        context.gapW(8),
        Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        const Spacer(),
        CustomTextButton(text: actionText, onPressed: onTap, isUnderLine: true),
      ],
    );
  }
}
