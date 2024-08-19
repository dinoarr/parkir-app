class RegisterModel {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  RegisterModel({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
    };
  }
}
