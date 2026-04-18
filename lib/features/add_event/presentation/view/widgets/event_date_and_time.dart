import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/features/add_event/presentation/manager/add_event_provider.dart';
import 'package:evently/features/add_event/presentation/view/widgets/date_time_selector_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDateAndTime extends StatelessWidget {
  const EventDateAndTime({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddEventProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          DateTimeSelectorRow(
            icon: Icons.calendar_today_outlined,
            label: DateFormat('dd-MM-yyyy').format(provider.selectedDate),
            actionText: context.lan.choose_date,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDate: DateTime.now(),
              );
              if (pickedDate != null) {
                provider.changeSelectedDate(pickedDate);
              }
            },
          ),
          context.gapH(16),
          DateTimeSelectorRow(
            icon: Icons.access_time_outlined,
            label: provider.selectedTime.format(context),
            actionText: context.lan.choose_time,
            onTap: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (selectedTime != null) {
                provider.changeSelectedTime(selectedTime);
              }
            },
          ),
        ],
      ),
    );
  }
}
