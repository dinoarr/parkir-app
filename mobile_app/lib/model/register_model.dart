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

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
    };
  }
}
