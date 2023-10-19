import 'package:kanver_flutter_app/data/abstracts/iauth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends IAuth {
  @override
  Future<void> createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "oguzhanoztrk00@gmail.com", password: "O.o123456");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e.toString());
    } catch (e) {
      print(e);
    }
  }
}
