import 'dart:convert';

import 'package:mobx_auth_animation/features/auth/model/register_data.dart';

class RegisterDataDTO {
  final String login;
  final String email;
  final String password;

  RegisterDataDTO({
    required this.login,
    required this.email,
    required this.password,
  });

  factory RegisterDataDTO.fromModel(RegisterData data) {
    return RegisterDataDTO(
      login: data.login,
      email: data.email,
      password: data.password,
    );
  }
  RegisterData toModel() {
    return RegisterData(
      login: login,
      email: email,
      password: password,
    );
  }

  factory RegisterDataDTO.fromJson(String source) {
    Map<String, dynamic> data = jsonDecode(source);
    return RegisterDataDTO(
      login: data['login'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }
  String toJson() {
    return jsonEncode({
      'login': login,
      'email': email,
      'password': password,
    });
  }
}
