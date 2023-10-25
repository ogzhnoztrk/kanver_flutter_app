import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:kanver_flutter_app/data/concretes/auth.dart';
import 'package:kanver_flutter_app/view/pages/authentication/forgot_password_page.dart';
import 'package:kanver_flutter_app/view/pages/authentication/register_page.dart';
import 'package:kanver_flutter_app/view/pages/home/home_page.dart';
import 'package:kanver_flutter_app/view/shared/widgets/input_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  @override
  void initState() {
    // TODO: implement initState
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                // Background
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/images/background.jpeg',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SIGN IN TITLE
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .1,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'Giriş',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),

                                  // EMAIL FIELD
                                  InputField(
                                    icon: Icons.email_outlined,
                                    hintText: 'Email...',
                                    isPassword: false,
                                    isEmail: true,
                                    controller: emailTextController,
                                  ),

                                  // PASSWORD FIELD
                                  InputField(
                                    icon: Icons.lock_outline,
                                    hintText: 'Şifre...',
                                    isPassword: true,
                                    isEmail: false,
                                    controller: passwordTextController,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // .
                                      // şifremi Unuttum kısmı
                                      RichText(
                                        text: TextSpan(
                                          text: 'Şifremi Unuttum!',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgotPasswordPage(),
                                              ));
                                            },
                                        ),
                                      ),
                                      // .
                                      // Hesap oluştur kısmı
                                      RichText(
                                        text: TextSpan(
                                          text: 'Hesap oluştur',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterPage(),
                                              ));
                                            },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * .05),

                                  // Giriş Butonu
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      // Fluttertoast.showToast(
                                      //   msg: 'Sign-In button pressed',
                                      // );

                                      Auth.loginUserWithEmailAndPassword(
                                              emailTextController.text,
                                              passwordTextController.text)
                                          .whenComplete(() {
                                        if (Auth.isLoggedIn()) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage(),
                                                  ),
                                                  (route) => true);
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Giriş',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
