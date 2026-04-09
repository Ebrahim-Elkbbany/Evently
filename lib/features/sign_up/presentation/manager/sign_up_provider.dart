import 'package:dartz/dartz.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/sign_up/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<Either<String, void>> signUpWithEmailAndPassword(
    SignUpModel signUpModel,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseServices.signUp(signUpModel);
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
