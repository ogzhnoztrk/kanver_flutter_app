class User {
  final int id;
  final String firstName;
  final String lastName;
  final String eMail;
  final String phoneNumber;
  final String password;
  final bool isValidate;
  final DateTime birthDate;
  final bool isUserDonor = false;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.eMail,
    this.phoneNumber,
    this.password,
    this.isValidate,
    this.birthDate,
  );
}
