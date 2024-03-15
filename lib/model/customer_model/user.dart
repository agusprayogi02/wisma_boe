import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? id;
	final String? name;
	final String? email;

	const User({this.id, this.name, this.email});

	factory User.fromMap(Map<String, Object?> data) => User(
				id: data['id'] as String?,
				name: data['name'] as String?,
				email: data['email'] as String?,
			);

	Map<String, Object?> toMap() => {
				'id': id,
				'name': name,
				'email': email,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, Object?>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

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
