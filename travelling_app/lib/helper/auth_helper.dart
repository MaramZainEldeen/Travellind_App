import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthHepler {
  AuthHepler._();
  static AuthHepler authHepler = AuthHepler._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> Signup(
      String? email, String? password, BuildContext context) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return userCredential;
  }

  Future<String?> signin(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
