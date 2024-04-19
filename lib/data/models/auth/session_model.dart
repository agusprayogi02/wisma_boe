import 'package:equatable/equatable.dart';

class SessionModel extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? phone;
  final String? email;
  final String? accessToken;

  const SessionModel({
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.accessToken,
  });

  SessionModel copyWith({
    int? id,
    String? name,
    String? username,
    String? phone,
    String? email,
    String? accessToken,
  }) {
    return SessionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'phone': phone,
      'email': email,
      'access_token': accessToken,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      id: map['id']?.toInt(),
      name: map['name'],
      username: map['username'],
      phone: map['phone'],
      email: map['email'],
      accessToken: map['access_token'],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      phone,
      email,
      accessToken,
    ];
  }
}
