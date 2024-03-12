import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'wisma.dart';

class LoginModel extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? token;
  final List<Wisma>? wisma;

  const LoginModel({
    this.id,
    this.email,
    this.name,
    this.token,
    this.wisma,
  });

  factory LoginModel.fromMap(Map<String, Object?> data) => LoginModel(
        id: data['id'] as String?,
        email: data['email'] as String?,
        name: data['name'] as String?,
        token: data['token'] as String?,
        wisma: (data['wisma'] as List<dynamic>?)
            ?.map((e) => Wisma.fromMap(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'email': email,
        'name': name,
        'token': token,
        'wisma': wisma?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginModel].
  factory LoginModel.fromJson(String data) {
    return LoginModel.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LoginModel copyWith({
    String? id,
    String? email,
    String? name,
    String? token,
    List<Wisma>? wisma,
  }) {
    return LoginModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token,
      wisma: wisma ?? this.wisma,
    );
  }

  @override
  List<Object?> get props => [id, email, name, token, wisma];
}
