import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'room.dart';
import 'user.dart';

class CustomerModel extends Equatable {
  final String? id;
  final String? nik;
  final String? name;
  final String? address;
  final String? phone;
  final String? roomId;
  final Room? room;
  final String? userId;
  final User? user;
  final String? checkIn;
  final String? checkOut;

  const CustomerModel({
    this.id,
    this.nik,
    this.name,
    this.address,
    this.phone,
    this.roomId,
    this.room,
    this.userId,
    this.user,
    this.checkIn,
    this.checkOut,
  });

  factory CustomerModel.fromMap(Map<String, Object?> data) => CustomerModel(
        id: data['id'] as String?,
        nik: data['nik'] as String?,
        name: data['name'] as String?,
        address: data['address'] as String?,
        phone: data['phone'] as String?,
        roomId: data['room_id'] as String?,
        room: data['room'] == null
            ? null
            : Room.fromMap(data['room']! as Map<String, Object?>),
        userId: data['user_id'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user']! as Map<String, Object?>),
        checkIn: data['check_in'] as String?,
        checkOut: data['check_out'] as String?,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'nik': nik,
        'name': name,
        'address': address,
        'phone': phone,
        'room_id': roomId,
        'room': room?.toMap(),
        'user_id': userId,
        'user': user?.toMap(),
        'check_in': checkIn,
        'check_out': checkOut,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomerModel].
  factory CustomerModel.fromJson(String data) {
    return CustomerModel.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [CustomerModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CustomerModel copyWith({
    String? id,
    String? nik,
    String? name,
    String? address,
    String? phone,
    String? roomId,
    Room? room,
    String? userId,
    User? user,
    String? checkIn,
    String? checkOut,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      nik: nik ?? this.nik,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      roomId: roomId ?? this.roomId,
      room: room ?? this.room,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      nik,
      name,
      address,
      phone,
      roomId,
      room,
      userId,
      user,
      checkIn,
      checkOut,
    ];
  }
}
