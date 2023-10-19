import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/data/concretes/auth.dart';
import 'package:kanver_flutter_app/view/pages/authentication/login_page.dart';
import 'package:kanver_flutter_app/view/pages/home/home_page.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: !Auth.isLoggedIn() ? LoginPage() : HomePage());
  }
}
