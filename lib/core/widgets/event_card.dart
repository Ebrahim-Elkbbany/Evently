import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/home/data/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 193.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: event.imagePath.isNotEmpty
              ? DecorationImage(
                  image: AssetImage(event.imagePath),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: context.customColors.stroke),
                color: context.customColors.background,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Jan",
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.customColors.primary,
                    ),
                  ),
                  context.gapW(4),
                  Text(
                    event.date.split('/').first,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.customColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: context.customColors.stroke),
                color: context.customColors.background,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      event.title,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: context.customColors.primary,
                    size: 20.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
