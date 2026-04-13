import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider();

  bool isLoading = false;
  UserModel? user;
  String? errorMessage;

  Future<void> getUserData() async {
    isLoading = true;
    notifyListeners();
    final result = await FirebaseServices.getCurrentUser();
    user = result;
    isLoading = false;
    notifyListeners();
  }
}
