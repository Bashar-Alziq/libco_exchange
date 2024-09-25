// ignore_for_file: non_constant_identifier_names

class SignUpRequest {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;
  final String phone;
  final String? birthday;

  SignUpRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.password_confirmation,
      required this.phone,
      this.birthday});
  Map<String, dynamic> toJson() {
    return {
      "full_name": name,
      "email": email,
      "password": password,
      "username": name,
      // "password_confirmation": password_confirmation,
      "phone": phone,
      // "birthday": birthday
    };
  }
}
