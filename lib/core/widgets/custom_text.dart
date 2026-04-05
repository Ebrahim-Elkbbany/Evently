import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.textTheme.titleSmall?.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor ?? context.customColors.mainText,
      ),
    );
  }
}
