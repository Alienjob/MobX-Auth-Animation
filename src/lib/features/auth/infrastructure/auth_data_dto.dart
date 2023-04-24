import 'dart:convert';

import 'package:mobx_auth_animation/features/auth/model/auth_data.dart';

class AuthDataDTO {
  final bool isAuthorized;
  final String login;
  final String email;
  final String token;

  AuthDataDTO({
    required this.isAuthorized,
    required this.login,
    required this.email,
    required this.token,
  });

  factory AuthDataDTO.fromModel(AuthData data) {
    return AuthDataDTO(
      isAuthorized: data.isAuthorized,
      login: data.login,
      email: data.email,
      token: data.token,
    );
  }
  AuthData toModel() {
    return AuthData(
      isAuthorized: isAuthorized,
      login: login,
      email: email,
      token: token,
    );
  }

  factory AuthDataDTO.fromJson(String source) {
    Map<String, dynamic> data = jsonDecode(source);
    return AuthDataDTO(
      isAuthorized: data['isAuthorized'] == true,
      login: data['login'] ?? '',
      email: data['email'] ?? '',
      token: data['token'] ?? '',
    );
  }
  String toJson() {
    return jsonEncode({
      'isAuthorized': isAuthorized,
      'login': login,
      'email': email,
      'token': token,
    });
  }
}
