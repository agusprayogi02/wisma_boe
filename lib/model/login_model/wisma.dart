import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class Wisma extends Equatable {
  final String? id;
  final String? userId;
  final User? user;
  final String? nama;
  final String? address;
  final String? code;
  final String? note;
  final String? createdAt;
  final String? updatedAt;

  const Wisma({
    this.id,
    this.userId,
    this.user,
    this.nama,
    this.address,
    this.code,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory Wisma.fromMap(Map<String, Object?> data) => Wisma(
        id: data['id'] as String?,
        userId: data['user_id'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user']! as Map<String, Object?>),
        nama: data['nama'] as String?,
        address: data['address'] as String?,
        code: data['code'] as String?,
        note: data['note'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'user_id': userId,
        'user': user?.toMap(),
        'nama': nama,
        'address': address,
        'code': code,
        'note': note,
        'created_at': createdAt,
        'updated_at': updatedAt,
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
    User? user,
    String? nama,
    String? address,
    String? code,
    String? note,
    String? createdAt,
    String? updatedAt,
  }) {
    return Wisma(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      nama: nama ?? this.nama,
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
      nama,
      address,
      code,
      note,
      createdAt,
      updatedAt,
    ];
  }
}
