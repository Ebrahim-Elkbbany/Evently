import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/buttons/custom_button.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/features/add_event/presentation/manager/add_event_provider.dart';
import 'package:evently/features/add_event/presentation/view/widgets/category_image_header.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_date_and_time.dart';
import 'package:evently/features/add_event/presentation/view/widgets/event_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategoriesWithoutAll(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: context.lan.add_event,
        onBackTap: () {
          context.pop();
        },
      ),
      body: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          final provider = Provider.of<AddEventProvider>(context);

          return SingleChildScrollView(
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryImageHeader(
                    categoryIndex: provider.selectedCategoryIndex,
                  ),
                  context.gapH(16),
                  CustomTabBar(
                    tabs: categories,
                    selectedIndex: provider.selectedCategoryIndex,
                    onTabChanged: (index) {
                      provider.changeCategoryIndex(index);
                    },
                  ),
                  context.gapH(16),
                  EventFormFields(
                    titleController: provider.titleController,
                    descController: provider.descController,
                  ),
                  context.gapH(16),
                  const EventDateAndTime(),
                  context.gapH(40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: CustomButton(
                      isLoading: provider.state == AddEventViewState.loading,
                      buttonName: context.lan.add_event,
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {
                          var result = provider.addEvent();
                          result.then((value) {
                            value.fold(
                              (failure) {
                                CustomSnackBar.show(
                                  context: context,
                                  message: failure.errorMessage,
                                  type: CustomSnackBarType.error,
                                );
                              },
                              (successMessage) {
                                CustomSnackBar.show(
                                  context: context,
                                  message: context.lan.event_added_successfully,
                                  type: CustomSnackBarType.success,
                                );
                                context.pop(true);
                              },
                            );
                          });
                        }
                      },
                    ),
                  ),
                  context.gapH(32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
