import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldPrefixIcon extends StatelessWidget {
  final IconData icon;

  const TextFieldPrefixIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 20.sp,
      color: context.customColors.iconColor,
    );
  }
}
