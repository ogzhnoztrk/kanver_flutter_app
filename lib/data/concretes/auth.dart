// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:kanver_flutter_app/data/abstracts/iauth.dart';

class Auth extends IAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
