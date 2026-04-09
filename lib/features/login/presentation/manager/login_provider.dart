import 'package:dartz/dartz.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/login/data/models/sign_in_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<Either<String, void>> loginWithEmailAndPassword(
    SignInModel signInModel,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseServices.login(signInModel);
      return right(null);
    } on FirebaseAuthException catch (erorr) {
      return left(erorr.code);
    } catch (e) {
      return left(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
