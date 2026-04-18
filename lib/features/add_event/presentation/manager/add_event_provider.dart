import 'package:dartz/dartz.dart';
import 'package:evently/core/failure/failures.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

enum AddEventViewState { initial, loading, success, failure }

class AddEventProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddEventViewState state = AddEventViewState.initial;

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

  Future<Either<Failure, String>> addEvent() async {
    state = AddEventViewState.loading;
    notifyListeners();
    try {
      UserModel? user = await FirebaseServices.getCurrentUser();
      FirebaseServices.addEvent(
        EventModel(
          eventId: '',
          userId: user!.userId,
          title: titleController.text,
          description: descController.text,
          date: combinedDateTimeMs,
          categoryId: (selectedCategoryIndex + 1).toString(),
          imagePath: "imagePath",
        ),
      );
      state = AddEventViewState.success;

      notifyListeners();
      return Right('Event added successfully');
    } on Exception catch (e) {
      state = AddEventViewState.failure;
      notifyListeners();
      return Left(Failure(errorMessage: 'error adding event: ${e.toString()}'));
    }
  }
}
