import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class EventTitleSection extends StatelessWidget {
  const EventTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.customColors.mainText,
      ),
    );
  }
}
