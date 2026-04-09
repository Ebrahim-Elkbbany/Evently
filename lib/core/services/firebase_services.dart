import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/features/login/data/models/sign_in_model.dart';
import 'package:evently/features/sign_up/data/models/sign_up_model.dart';
import 'package:evently/features/sign_up/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<UserCredential> login(SignInModel signInModel) async {
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
      email: signInModel.email,
      password: signInModel.password,
    );
    return user;
  }

  static Future<UserCredential> signUp(SignUpModel signUpModel) async {
    UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
      email: signUpModel.email,
      password: signUpModel.password,
    );

    return user;
  }

  static Future<void> saveUser(UserModel userModel) async {
    CollectionReference usersCollection = firestore.collection('users');
    DocumentReference<Object?> userDoc = usersCollection.doc(userModel.userId);
    await userDoc.set(userModel.toJson());
  }
}
