import 'package:evently/core/models/tab_bar_model.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/add_event/presentation/view/widgets/category_image_header.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_date_and_time.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEventView extends StatefulWidget {
  const AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  int _selectedCategoryIndex = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = TabItemModel.getTabBarListWithoutAll(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: context.lan.add_event,
        onBackTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryImageHeader(),
            context.gapH(16),
            CustomTabBar(
              tabs: categories,
              selectedIndex: _selectedCategoryIndex,
              onTabChanged: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
            context.gapH(16),
            EventFormFields(
              titleController: _titleController,
              descController: _descController,
            ),
            context.gapH(16),
            const EventDateAndTime(),
            context.gapH(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomButton(
                buttonName: context.lan.add_event,
                onPressed: () {},
              ),
            ),
            context.gapH(32),
          ],
        ),
      ),
    );
  }
}
