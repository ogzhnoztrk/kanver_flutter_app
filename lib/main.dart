import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/firebase_options.dart';
import 'package:kanver_flutter_app/view/pages/authentication/login_page.dart';
import 'package:kanver_flutter_app/view/shared/CheckAuth.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: CheckAuth(),
    );
  }
}
