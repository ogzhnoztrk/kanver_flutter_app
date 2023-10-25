import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/firebase_options.dart';
import 'package:kanver_flutter_app/view/shared/check_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // debugPrint(Auth.isLoggedIn() ? "giriş yapılı" : "çıkış yapılı");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const CheckAuth(),
    );
  }
}
