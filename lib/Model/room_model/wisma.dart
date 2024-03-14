import 'package:equatable/equatable.dart';

import 'user.dart';

class Wisma extends Equatable {
  final String? id;
  final String? userId;
  final User? user;
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

  factory Wisma.fromJson(Map<String, Object?> json) => Wisma(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        user: json['user'] == null ? null : User.fromJson(json['user']! as Map<String, Object?>),
        name: json['name'] as String?,
        address: json['address'] as String?,
        code: json['code'] as String?,
        note: json['note'] as String?,
        createdAt:
            json['created_at'] == null ? null : DateTime.parse(json['created_at']! as String),
        updatedAt:
            json['updated_at'] == null ? null : DateTime.parse(json['updated_at']! as String),
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'user_id': userId,
        'user': user?.toJson(),
        'name': name,
        'address': address,
        'code': code,
        'note': note,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Wisma copyWith({
    String? id,
    String? userId,
    User? user,
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
