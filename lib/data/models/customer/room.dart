import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'wisma.dart';

class Room extends Equatable {
  final String? id;
  final String? wismaId;
  final Wisma? wisma;
  final String? name;
  final int? capacity;
  final String? note;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Room({
    this.id,
    this.wismaId,
    this.wisma,
    this.name,
    this.capacity,
    this.note,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Room.fromMap(Map<String, Object?> data) => Room(
        id: data['id'] as String?,
        wismaId: data['wisma_id'] as String?,
        wisma: data['wisma'] == null
            ? null
            : Wisma.fromMap(data['wisma']! as Map<String, Object?>),
        name: data['name'] as String?,
        capacity: data['capacity'] as int?,
        note: data['note'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at']! as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at']! as String),
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'wisma_id': wismaId,
        'wisma': wisma?.toMap(),
        'name': name,
        'capacity': capacity,
        'note': note,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Room].
  factory Room.fromJson(String data) {
    return Room.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [Room] to a JSON string.
  String toJson() => json.encode(toMap());

  Room copyWith({
    String? id,
    String? wismaId,
    Wisma? wisma,
    String? name,
    int? capacity,
    String? note,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Room(
      id: id ?? this.id,
      wismaId: wismaId ?? this.wismaId,
      wisma: wisma ?? this.wisma,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      note: note ?? this.note,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      wismaId,
      wisma,
      name,
      capacity,
      note,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
