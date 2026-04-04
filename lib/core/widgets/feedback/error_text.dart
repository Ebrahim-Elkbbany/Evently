import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorText extends StatelessWidget {
  final String message;
  const ErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: context.customColors.mainText,
      ),
      textAlign: TextAlign.center,
    );
  }
}
