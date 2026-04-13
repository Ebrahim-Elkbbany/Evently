import 'package:evently/core/utils/constants/assets_paths.dart';
import 'package:evently/features/home/data/models/event_model.dart';
import 'package:flutter/material.dart';

enum HomeViewState { initial, loading, success, failure }

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getEvents(0);
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
    getEvents(index);
  }

  Future<void> getEvents(int categoryIndex) async {
    state = HomeViewState.loading;
    notifyListeners();
    final categories = ['All', 'Sports', 'Birthday', 'Book Club', 'Exhibition'];
    final categoryName = categories[categoryIndex];
    try {
      await Future.delayed(const Duration(seconds: 2));
      events = List.generate(10, (index) {
        final currentDate = DateTime.now().add(Duration(days: index));
        return EventModel(
          id: '$categoryName-$index',
          title: '$categoryName Event $index',
          date: "${currentDate.day}/${currentDate.month}/${currentDate.year}",
          imagePath: AppImages.birthday,
          description: '',
          category: '',
          isFavorite: true,
        );
      });
      state = HomeViewState.success;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to load events';
      state = HomeViewState.failure;
      notifyListeners();
    }
  }
}
