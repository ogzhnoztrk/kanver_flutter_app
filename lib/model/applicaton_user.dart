import 'package:firebase_auth/firebase_auth.dart';

class ApplicationUser {
  final User user;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final bool isUserDonor = false;

  ApplicationUser(
    this.user,
    this.firstName,
    this.lastName,
    this.birthDate,
  );
}
