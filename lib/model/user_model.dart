class UserModel {
  final String email;
  final String password;
  final String phoneNumber;
  const UserModel(
      {required this.email, required this.password, required this.phoneNumber});
  toJson() {
    return {"email": email, "password": password, "phoneNumber": phoneNumber};
  }
}
