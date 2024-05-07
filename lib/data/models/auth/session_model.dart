import 'package:equatable/equatable.dart';

class SessionModel extends Equatable {
  final int? id;
  final String? name;
  final List<String>? roles;
  final String? email;
  final String? accessToken;

  const SessionModel({
    this.id,
    this.name,
    this.roles,
    this.email,
    this.accessToken,
  });

  SessionModel copyWith({
    int? id,
    String? name,
    List<String>? roles,
    String? email,
    String? accessToken,
  }) {
    return SessionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      roles: roles ?? this.roles,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'roles': roles,
      'email': email,
      'access_token': accessToken,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      id: map['id']?.toInt(),
      name: map['name'],
      roles: List<String>.from(map['roles']),
      email: map['email'],
      accessToken: map['access_token'],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      roles,
      email,
      accessToken,
    ];
  }
}
