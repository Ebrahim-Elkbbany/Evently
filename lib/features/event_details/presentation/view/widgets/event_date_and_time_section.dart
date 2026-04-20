import 'package:evently/core/theming/font_weight_helper.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/utils/get_date_and_month.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventDateAndTimeSection extends StatelessWidget {
  const EventDateAndTimeSection({super.key, required this.date});

  final int date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.customColors.inputs,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.customColors.stroke),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: context.customColors.inputs,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: context.customColors.stroke),
            ),
            child: Icon(
              Icons.calendar_month_outlined,
              color: context.customColors.primary,
              size: 28.r,
            ),
          ),
          context.gapW(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${GetDateAndMonth.getDay(date)} ${GetDateAndMonth.getMonth(date)}',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.customColors.primary,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                context.gapH(4),
                Text(
                  DateFormat(
                    'hh:mm a',
                  ).format(DateTime.fromMillisecondsSinceEpoch(date)),
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.customColors.mainText,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
