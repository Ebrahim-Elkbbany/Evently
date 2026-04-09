import 'package:evently/features/login/data/models/sign_in_model.dart';
import 'package:evently/features/sign_up/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  static Future<UserCredential> login(SignInModel signInModel) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: signInModel.email,
          password: signInModel.password,
        );
    return user;
  }

  static Future<UserCredential> signUp(SignUpModel signUpModel) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: signUpModel.email,
          password: signUpModel.password,
        );
    return user;
  }

 static saveUser (){
  
   
 }
}
