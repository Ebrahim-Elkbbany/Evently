import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDescriptionSection extends StatelessWidget {
  const EventDescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.lan.description,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.customColors.mainText,
          ),
        ),
        context.gapH(12),
        Container(
          padding: EdgeInsets.all(16.r),
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.customColors.inputs,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: context.customColors.stroke),
          ),
          child: Text(
            description.isNotEmpty ? description : context.lan.noDataFound,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.customColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
