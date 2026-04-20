import 'package:dartz/dartz.dart';
import 'package:evently/core/failure/failures.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

enum EditEventViewState { initial, loading, success, failure }

class EditEventProvider extends ChangeNotifier {
  final EventModel event;

  EditEventProvider({required this.event}) {
    titleController.text = event.title;
    descController.text = event.description;
    selectedCategoryIndex = int.parse(event.categoryId) - 1;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(event.date);
    selectedTime = TimeOfDay.fromDateTime(selectedDate);
  }

  int selectedCategoryIndex = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditEventViewState state = EditEventViewState.initial;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeSelectedTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  int get combinedDateTimeMs {
    final finalDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    return finalDateTime.millisecondsSinceEpoch;
  }

  void changeCategoryIndex(int index) {
    if (selectedCategoryIndex == index) return;
    selectedCategoryIndex = index;
    notifyListeners();
  }

  Future<Either<Failure, String>> updateEvent() async {
    state = EditEventViewState.loading;
    notifyListeners();
    try {
      UserModel? user = await FirebaseServices.getCurrentUser();
      final updatedEvent = EventModel(
        eventId: event.eventId,
        userId: user!.userId,
        title: titleController.text,
        description: descController.text,
        date: combinedDateTimeMs,
        categoryId: (selectedCategoryIndex + 1).toString(),
        imagePath: "imagePath",
      );
      await FirebaseServices.updateEvent(updatedEvent);
      state = EditEventViewState.success;
      notifyListeners();
      return const Right('تم تعديل الفعالية بنجاح');
    } on Exception catch (e) {
      state = EditEventViewState.failure;
      notifyListeners();
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
