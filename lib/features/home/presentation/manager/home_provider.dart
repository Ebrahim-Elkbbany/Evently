import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:flutter/material.dart';

enum HomeViewState { initial, loading, success, failure }

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getEvents("0");
  }

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  HomeViewState state = HomeViewState.initial;
  List<EventModel> events = [];
  String? errorMessage;

  void changeTabIndex(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    notifyListeners();
    getEvents(index.toString());
  }

  Future<void> getEvents(String categoryId) async {
    state = HomeViewState.loading;
    events = [];
    notifyListeners();
    try {
      events = await FirebaseServices.getEvents(categoryId);
      state = HomeViewState.success;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      state = HomeViewState.failure;
      notifyListeners();
    }
  }
}
