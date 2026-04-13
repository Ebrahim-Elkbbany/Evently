import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventFormFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;
  const EventFormFields({
    super.key,
    required this.titleController,
    required this.descController,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.lan.title,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          context.gapH(8),
          CustomTextFormField(
            controller: titleController,
            hintText: context.lan.event_title,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.title_is_required;
              }
              return null;
            },
          ),
          context.gapH(16),
          Text(
            context.lan.description,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          context.gapH(8),
          CustomTextFormField(
            controller: descController,
            hintText: context.lan.event_description,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.lan.description_is_required;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
