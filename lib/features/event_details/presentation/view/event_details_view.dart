import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_icon_button.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/event_details/presentation/view/widgets/event_details_body.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.lan.event_details,
        backgroundColor: context.customColors.background,
        actions: [
          CustomIconButton(
            onTap: () {
              // Edit Event
            },
            icon: Icons.edit_outlined,
            iconColor: context.customColors.primary,
          ),
          context.gapW(8),
          CustomIconButton(
            onTap: () {
              // Delete Event
            },
            icon: Icons.delete_outline,
            iconColor: Colors.red,
          ),
          context.gapW(16),
        ],
      ),
      body: EventDetailsBody(event: event),
    );
  }
}
