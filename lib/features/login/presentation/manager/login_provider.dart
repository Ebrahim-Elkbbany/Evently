import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/login/data/models/sign_in_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<Either<String, UserModel>> loginWithEmailAndPassword(
    SignInModel signInModel,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await FirebaseServices.login(signInModel);
      UserModel userModel = await FirebaseServices.getUser(
        userCredential.user!.uid,
      );
      log(userModel.name);
      return right(userModel);
    } on FirebaseAuthException catch (erorr) {
      return left(erorr.code);
    } catch (e) {
      return left(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Either<String, UserModel>> loginWithGoogle(
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await FirebaseServices.signInWithGoogle();
      if (userCredential.additionalUserInfo!.isNewUser == true) {
        FirebaseServices.saveUser(
          UserModel(
            favorites: [],
            userId: userCredential.user!.uid,
            name: userCredential.user!.displayName!,
            email: userCredential.user!.email!,
          ),
        );
        UserModel userModel = await FirebaseServices.getUser(
          userCredential.user!.uid,
        );
        return right(userModel);
      }
      UserModel userModel = await FirebaseServices.getUser(
        userCredential.user!.uid,
      );
      return right(userModel);
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
