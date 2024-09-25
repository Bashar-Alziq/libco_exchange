class LoginReq {
  final String email;
  final String password;
  LoginReq({required this.email, required this.password});
  Map<String, dynamic> toJSON() {
    return {"email": email, "password": password};
  }
}
