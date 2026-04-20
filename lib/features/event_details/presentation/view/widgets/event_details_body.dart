import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/add_event/presentation/view/widgets/category_image_header.dart';
import 'package:evently/features/event_details/presentation/view/widgets/event_date_and_time_section.dart';
import 'package:evently/features/event_details/presentation/view/widgets/event_description_section.dart';
import 'package:evently/features/event_details/presentation/view/widgets/event_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsBody extends StatelessWidget {
  final EventModel event;

  const EventDetailsBody({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    CategoryModel eventCategory = CategoryModel.getCategoriesList(
      context,
    )[int.parse(event.categoryId)];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryImageHeader(
            eventCategory: eventCategory,
            margin: EdgeInsets.zero,
          ),
          context.gapH(16),
          EventTitleSection(title: event.title),
          context.gapH(16),
          EventDateAndTimeSection(date: event.date),
          context.gapH(20),
          EventDescriptionSection(description: event.description),
        ],
      ),
    );
  }
}
