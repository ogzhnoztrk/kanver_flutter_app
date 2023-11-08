import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:kanver_flutter_app/data/concretes/auth.dart';
import 'package:kanver_flutter_app/model/applicaton_user.dart';

import 'package:kanver_flutter_app/view/pages/home/home_page.dart';
import 'package:kanver_flutter_app/view/shared/check_auth.dart';
import 'package:kanver_flutter_app/view/shared/widgets/input_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController firstNameTextController;
  late TextEditingController lastNameTextController;
  late DateTime _selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    firstNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    _selectedDate = DateTime(2000);
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
                      // ust boşluk
                      SizedBox(height: size.height * 0.14),

                      Expanded(
                        flex: 1,
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
                                      // bottom: size.width * .1,
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

                                  // Row part
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * .05,
                                        right: size.width * .05),
                                    child: Row(
                                      children: [
                                        // FirstName FIELD
                                        Expanded(
                                          child: InputField(
                                            icon: Icons.account_circle_outlined,
                                            hintText: 'İsim...',
                                            isPassword: false,
                                            isEmail: false,
                                            controller: firstNameTextController,
                                          ),
                                        ),
                                        const SizedBox(width: 5),

                                        // EMAIL FIELD
                                        Expanded(
                                          child: InputField(
                                            icon: Icons.account_circle,
                                            hintText: 'Soyisim...',
                                            isPassword: false,
                                            isEmail: false,
                                            controller: lastNameTextController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Tarih seçici
                                  InkWell(
                                    splashColor: Colors.grey.shade100,
                                    highlightColor: Colors.grey.shade100,
                                    onTap: () {
                                      _showDatePicker(context).then((value) {
                                        _selectedDate = value;
                                        setState(() {});
                                      });
                                    },
                                    child: Container(
                                        height: size.width / 8,
                                        width: size.width / 1.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text(
                                              'Doğum Günü:',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              _selectedDate == null
                                                  ? ""
                                                  : (_selectedDate.toString())
                                                      .split(" ")
                                                      .first,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            const Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                          ],
                                        )),
                                  ),

                                  // PASSWORD FIELD
                                  InputField(
                                    icon: Icons.lock_outline,
                                    hintText: 'Şifre...',
                                    isPassword: true,
                                    isEmail: false,
                                    controller: passwordTextController,
                                  ),

                                  // Kayıt Butonu
                                  InkWell(
                                    splashColor:
                                        const Color.fromARGB(0, 172, 96, 96),
                                    highlightColor:
                                        const Color.fromARGB(0, 211, 111, 111),
                                    onTap: () {
                                      HapticFeedback.lightImpact();

                                      Auth.createUser(
                                              emailTextController.text
                                                  .toString(),
                                              passwordTextController.text
                                                  .toString(),
                                              firstNameTextController.text
                                                  .toString(),
                                              lastNameTextController.text
                                                  .toString(),
                                              _selectedDate.toUtc())
                                          .whenComplete(
                                        () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CheckAuth(),
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

                      // alt boşluk
                      SizedBox(height: size.height * 0.14),
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

  Future<DateTime> _showDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year - 18),
    );

    if (selectedDate != null) {
      // Kullanıcı bir tarih seçtiğinde yapılacak işlemleri burada gerçekleştirebilirsiniz.
      return selectedDate;
      // print('Seçilen tarih: $selectedDate');
    } else {
      return DateTime(2000);
    }
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
