import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldSuffixIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const TextFieldSuffixIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 20.sp, color: context.customColors.disable),
    );
  }
}
