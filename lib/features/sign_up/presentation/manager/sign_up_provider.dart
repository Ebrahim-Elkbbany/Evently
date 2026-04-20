import 'package:dartz/dartz.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/sign_up/data/models/sign_up_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<Either<String, void>> signUpWithEmailAndPassword(
    SignUpModel signUpModel,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await FirebaseServices.signUp(
        signUpModel,
      );
      FirebaseServices.saveUser(
        UserModel(
          userId: userCredential.user!.uid,
          name: signUpModel.name!,
          email: userCredential.user!.email!,
          favorites: [],
        ),
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

  Future<Either<String, UserModel>> signUpWithGoogle() async {
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
