import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;

  const User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, Object?> json) => User(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };

  User copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [id, name, email];
}
