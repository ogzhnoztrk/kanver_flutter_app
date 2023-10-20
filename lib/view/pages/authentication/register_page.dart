import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:kanver_flutter_app/data/concretes/auth.dart';
import 'package:kanver_flutter_app/view/pages/Authentication/login_page.dart';
import 'package:kanver_flutter_app/view/shared/widgets/input_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Register TITLE
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .1,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'Kayıt',
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
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  // PASSWORD FIELD
                                  InputField(
                                    icon: Icons.lock_outline,
                                    hintText: 'Şifre...',
                                    isPassword: true,
                                    isEmail: false,
                                    controller: passwordTextController,
                                  ),

                                  SizedBox(height: size.width * 0.05),

                                  // Kayıt Butonu
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      // Fluttertoast.showToast(
                                      //   msg: 'Sign-In button pressed',
                                      // );
                                      debugPrint("Kayıta Basıldı");
                                      debugPrint(passwordTextController.text);
                                      debugPrint(emailTextController.text);
                                      Auth.createUserEmailAndPassword(
                                              emailTextController.text
                                                  .toString(),
                                              passwordTextController.text
                                                  .toString())
                                          .whenComplete(
                                        () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage(),
                                                  ),
                                                  (route) => true);
                                        },
                                      );
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
                                        'Kayıt Ol',
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
                      Expanded(
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
