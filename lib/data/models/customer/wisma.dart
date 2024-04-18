import 'dart:convert';

import 'package:equatable/equatable.dart';

class Wisma extends Equatable {
  final String? id;
  final String? userId;
  final dynamic user;
  final String? name;
  final String? address;
  final String? code;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Wisma({
    this.id,
    this.userId,
    this.user,
    this.name,
    this.address,
    this.code,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory Wisma.fromMap(Map<String, Object?> data) => Wisma(
        id: data['id'] as String?,
        userId: data['user_id'] as String?,
        user: data['user'] as dynamic,
        name: data['name'] as String?,
        address: data['address'] as String?,
        code: data['code'] as String?,
        note: data['note'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at']! as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at']! as String),
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'user_id': userId,
        'user': user,
        'name': name,
        'address': address,
        'code': code,
        'note': note,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Wisma].
  factory Wisma.fromJson(String data) {
    return Wisma.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [Wisma] to a JSON string.
  String toJson() => json.encode(toMap());

  Wisma copyWith({
    String? id,
    String? userId,
    dynamic user,
    String? name,
    String? address,
    String? code,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Wisma(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      name: name ?? this.name,
      address: address ?? this.address,
      code: code ?? this.code,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      user,
      name,
      address,
      code,
      note,
      createdAt,
      updatedAt,
    ];
  }
}
