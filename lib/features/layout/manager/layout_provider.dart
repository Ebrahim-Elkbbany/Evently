import 'package:evently/features/favourites/presentation/views/favourites_view.dart';
import 'package:evently/features/home/presentation/view/home_view.dart';
import 'package:evently/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> get screens => const [
    HomeView(),
    FavouritesView(),
    ProfileView(),
  ];
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
