import 'dart:convert';

class SignUpModel {
  final String firstName;
  final String lastName;
  final String country;
  final String city;
  final String email;
  final String phone;
  final String password;

  SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.country,
      required this.city,
      required this.email,
      required this.phone,
      required this.password});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'country': country});
    result.addAll({'city': city});
    result.addAll({'email': email});
    result.addAll({'phone': phone});
    result.addAll({'password': password});

    return result;
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      firstName: map['firstName'] ?? '',
      password: map['password'] ?? '',
      lastName: map['lastName'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(
        json.decode(source),
      );
}
