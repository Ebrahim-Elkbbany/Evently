import 'dart:developer';

import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/add_event/data/models/event_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

enum FavouritesViewState { initial, loading, success, failure }

class FavouritesProvider extends ChangeNotifier {
  List<String> favouriteEventIds = [];
  List<EventModel> favouriteEvents = [];
  String? errorMessage;
  String searchQuery = '';

  FavouritesViewState favouriteViewState = FavouritesViewState.initial;

  bool isEventFavourite(String eventId) {
    return favouriteEventIds.contains(eventId);
  }

  void searchFavourites(String query) {
    searchQuery = query;
    notifyListeners();
  }

  List<EventModel> get displayedFavouriteEvents {
    if (searchQuery.isEmpty) {
      return favouriteEvents;
    }
    return favouriteEvents
        .where(
          (event) =>
              event.title.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  Future<void> updateFavourites(EventModel event) async {
    String eventId = event.eventId;
    if (isEventFavourite(eventId)) {
      favouriteEventIds.remove(eventId);
      favouriteEvents.removeWhere((e) => e.eventId == eventId);
    } else {
      favouriteEventIds.add(eventId);
      favouriteEvents.add(event);
    }
    notifyListeners();
    await FirebaseServices.updateFavorites(eventId);
  }

  Future<void> getFavouriteEvents() async {
    if (favouriteEvents.isEmpty) {
      favouriteViewState = FavouritesViewState.loading;
      notifyListeners();
    }
    try {
      favouriteEvents = await FirebaseServices.getFavouriteEvents();
      UserModel? currentUser = await FirebaseServices.getCurrentUser();
      if (currentUser != null) {
        favouriteEventIds = currentUser.favorites;
      }
      favouriteViewState = FavouritesViewState.success;
      log('favourite events length: ${favouriteEvents.length}');
      notifyListeners();
    } catch (e) {
      favouriteViewState = FavouritesViewState.failure;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
