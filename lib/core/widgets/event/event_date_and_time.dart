import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/event/date_time_selector_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventDateAndTime extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function(DateTime) onDateChanged;
  final Function(TimeOfDay) onTimeChanged;

  const EventDateAndTime({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          DateTimeSelectorRow(
            icon: Icons.calendar_today_outlined,
            label: DateFormat('dd-MM-yyyy').format(selectedDate),
            actionText: context.lan.choose_date,
            onTap: () async {
              DateTime firstDate = DateTime.now();
              DateTime initialDate = selectedDate.isBefore(firstDate)
                  ? firstDate
                  : selectedDate;
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: firstDate,
                lastDate: DateTime(DateTime.now().year + 5),
                initialDate: initialDate,
              );
              if (pickedDate != null) {
                onDateChanged(pickedDate);
              }
            },
          ),
          context.gapH(16),
          DateTimeSelectorRow(
            icon: Icons.access_time_outlined,
            label: selectedTime.format(context),
            actionText: context.lan.choose_time,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );
              if (pickedTime != null) {
                onTimeChanged(pickedTime);
              }
            },
          ),
        ],
      ),
    );
  }
}
