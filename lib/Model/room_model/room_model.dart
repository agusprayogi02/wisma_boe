import 'package:equatable/equatable.dart';

import 'wisma.dart';

class RoomModel extends Equatable {
  final String? id;
  final String? wismaId;
  final Wisma? wisma;
  final String? name;
  final int? capacity;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RoomModel({
    this.id,
    this.wismaId,
    this.wisma,
    this.name,
    this.capacity,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory RoomModel.fromJson(Map<String, Object?> json) => RoomModel(
        id: json['id'] as String?,
        wismaId: json['wisma_id'] as String?,
        wisma: json['wisma'] == null
            ? null
            : Wisma.fromJson(json['wisma']! as Map<String, Object?>),
        name: json['name'] as String?,
        capacity: json['capacity'] as int?,
        note: json['note'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']! as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']! as String),
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'wisma_id': wismaId,
        'wisma': wisma?.toJson(),
        'name': name,
        'capacity': capacity,
        'note': note,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  RoomModel copyWith({
    String? id,
    String? wismaId,
    Wisma? wisma,
    String? name,
    int? capacity,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RoomModel(
      id: id ?? this.id,
      wismaId: wismaId ?? this.wismaId,
      wisma: wisma ?? this.wisma,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      note: note ?? this.note,
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
      createdAt,
      updatedAt,
    ];
  }
}
