// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:kanver_flutter_app/data/abstracts/iauth.dart';

class Auth extends IAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  ///kullanıcının giriş yapıp yamadığını kontrol eden kod
  static bool isLoggedIn() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  ///[email] ve [password] kullanıcı hesabı açan blok
  static Future<void> createUserEmailAndPassword(
      String email, String password) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = userCredential.user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      } else {
        debugPrint("mail onaylanmış");
      }

      debugPrint(user.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///kullanıcının çıkış yapmasını sağlayan kod
  static Future<void> signOut() async {
    _auth.signOut();
  }

  ///kullanıcının [email] ve [password] girerek giriş yapamasını sağlayan blok
  static Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.toString());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  /// girilen [email] adresine şifre yenileme maili gönderen kod
  static Future<void> forgotPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}
