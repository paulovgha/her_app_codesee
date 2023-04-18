import 'dart:convert';

class SignInModel {
  final String email;
  final String password;

  SignInModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': email});
    result.addAll({'password': password});

    return result;
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      email: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInModel.fromJson(String source) =>
      SignInModel.fromMap(json.decode(source));
}
