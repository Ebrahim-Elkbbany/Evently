import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/add_event/presentation/view/widgets/category_image_header.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_date_and_time.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventFormBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<CategoryModel> categories;
  final int selectedCategoryIndex;
  final Function(int) onCategoryChanged;
  final TextEditingController titleController;
  final TextEditingController descController;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function(DateTime) onDateChanged;
  final Function(TimeOfDay) onTimeChanged;
  final String buttonName;
  final bool isLoading;
  final VoidCallback onSubmit;

  const EventFormBody({
    super.key,
    required this.formKey,
    required this.categories,
    required this.selectedCategoryIndex,
    required this.onCategoryChanged,
    required this.titleController,
    required this.descController,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.buttonName,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryImageHeader(
              eventCategory: categories[selectedCategoryIndex],
            ),
            context.gapH(16),
            CustomTabBar(
              tabs: categories,
              selectedIndex: selectedCategoryIndex,
              onTabChanged: onCategoryChanged,
            ),
            context.gapH(16),
            EventFormFields(
              titleController: titleController,
              descController: descController,
            ),
            context.gapH(16),
            EventDateAndTime(
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              onDateChanged: onDateChanged,
              onTimeChanged: onTimeChanged,
            ),
            context.gapH(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomButton(
                isLoading: isLoading,
                buttonName: buttonName,
                onPressed: onSubmit,
              ),
            ),
            context.gapH(32),
          ],
        ),
      ),
    );
  }
}
