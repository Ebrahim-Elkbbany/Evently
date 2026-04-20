import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/core/widgets/event/event_form_body.dart';
import 'package:evently/features/event_details/presentation/manager/edit_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEventView extends StatelessWidget {
  const EditEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategoriesWithoutAll(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: context.lan.update_event,
        onBackTap: () {
          context.pop();
        },
      ),
      body: Consumer<EditEventProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          return EventFormBody(
            formKey: provider.formKey,
            categories: categories,
            selectedCategoryIndex: provider.selectedCategoryIndex,
            onCategoryChanged: provider.changeCategoryIndex,
            titleController: provider.titleController,
            descController: provider.descController,
            selectedDate: provider.selectedDate,
            selectedTime: provider.selectedTime,
            onDateChanged: provider.changeSelectedDate,
            onTimeChanged: provider.changeSelectedTime,
            buttonName: context.lan.update_event,
            isLoading: provider.state == EditEventViewState.loading,
            onSubmit: () {
              if (provider.formKey.currentState!.validate()) {
                provider.updateEvent().then((result) {
                  result.fold(
                    (failure) => CustomSnackBar.show(
                      context: context,
                      message: failure.errorMessage,
                      type: CustomSnackBarType.error,
                    ),
                    (_) {
                      CustomSnackBar.show(
                        context: context,
                        message: context.lan.event_updated_successfully,
                        type: CustomSnackBarType.success,
                      );
                      context.pushNamedAndRemoveUntil(
                        AppRoutes.layoutView,
                        predicate: (route) => false,
                      );
                    },
                  );
                });
              }
            },
          );
        },
      ),
    );
  }
}
