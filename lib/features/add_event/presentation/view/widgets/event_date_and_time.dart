import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/add_event/presentation/view/widgets/date_time_selector_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDateAndTime extends StatelessWidget {
  const EventDateAndTime({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          DateTimeSelectorRow(
            icon: Icons.calendar_today_outlined,
            label: context.lan.event_date,
            actionText: context.lan.choose_date,
            onTap: () {},
          ),
          context.gapH(16),
          DateTimeSelectorRow(
            icon: Icons.access_time_outlined,
            label: context.lan.event_time,
            actionText: context.lan.choose_time,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
