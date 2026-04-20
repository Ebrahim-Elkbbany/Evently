import 'package:evently/core/navigation/app_routes.dart';
import 'package:evently/core/navigation/navigation_context_extension.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_icon_button.dart';
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/event_details/presentation/views/widgets/event_details_body.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseServices.firebaseAuth.currentUser;
    return Scaffold(
      appBar: CustomAppBar(
        title: context.lan.event_details,
        backgroundColor: context.customColors.background,
        hasActions: event.userId == currentUser!.uid,
        actions: [
          CustomIconButton(
            onTap: () {
              context.pushNamed(AppRoutes.editEventView, arguments: event);
            },
            icon: Icons.edit_outlined,
            iconColor: context.customColors.primary,
          ),
          context.gapW(8),
          CustomIconButton(
            onTap: () {
              _showDeleteDialog(context);
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.customColors.inputs,
          title: Text(context.lan.delete),
          content: Text(context.lan.are_you_sure_to_delete_this_event),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.lan.cancel),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseServices.deleteEvent(event.eventId);
                if (context.mounted) {
                  context.pushNamedAndRemoveUntil(
                    AppRoutes.layoutView,
                    predicate: (route) => false,
                  );
                  CustomSnackBar.show(
                    context: context,
                    message: context.lan.event_deleted_successfully,
                    type: CustomSnackBarType.success,
                  );
                }
              },
              child: Text(
                context.lan.delete,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
