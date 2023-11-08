// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApplicationUser {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final bool isUserDonor;

  ApplicationUser(
    this.firstName,
    this.lastName,
    this.birthDate,
    this.isUserDonor,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'isUserDonor': isUserDonor,
    };
  }

  factory ApplicationUser.fromMap(Map<String, dynamic> map) {
    return ApplicationUser(
      map['firstName'] as String,
      map['lastName'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      map['isUserDonor'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationUser.fromJson(String source) =>
      ApplicationUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
