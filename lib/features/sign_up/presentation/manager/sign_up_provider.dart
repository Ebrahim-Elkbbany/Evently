import 'package:dartz/dartz.dart';
import 'package:evently/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<Either<String, void>> signUpWithEmailAndPassword(
    SignUpRequestModel signUpModel,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
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
