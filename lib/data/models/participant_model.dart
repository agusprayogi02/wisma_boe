import 'package:equatable/equatable.dart';

import 'base_model.dart';

class ParticipantModel extends Equatable implements BaseModel {
  final int? idXcalonpeserta;
  final int? idXkelas;
  final String? namaKelas;
  final DateTime? klsTglCheckin;
  final DateTime? klsTglCheckout;
  final String? nik;
  final String? nama;
  final String? tanggalLahir;
  final String? nip;
  final String? jenisKelamin;
  final int? idXpb;
  final String? npsn;
  final int? roomId;
  final String? roomName;
  final String? namaSekolah;
  final String? kotaUjob;

  const ParticipantModel({
    this.idXcalonpeserta,
    this.idXkelas,
    this.namaKelas,
    this.klsTglCheckin,
    this.klsTglCheckout,
    this.nik,
    this.nama,
    this.tanggalLahir,
    this.nip,
    this.jenisKelamin,
    this.idXpb,
    this.npsn,
    this.roomId,
    this.roomName,
    this.namaSekolah,
    this.kotaUjob,
  });

  factory ParticipantModel.fromJson(Map<String, Object?> json) {
    return ParticipantModel(
      idXcalonpeserta: json['id_xcalonpeserta'] as int?,
      idXkelas: json['id_xkelas'] as int?,
      namaKelas: json['nama_kelas'] as String?,
      klsTglCheckin: json['kls_tgl_checkin'] == null
          ? null
          : DateTime.parse(json['kls_tgl_checkin'] as String),
      klsTglCheckout: json['kls_tgl_checkout'] == null
          ? null
          : DateTime.parse(json['kls_tgl_checkout'] as String),
      nik: json['nik'] as String?,
      nama: json['nama'] as String?,
      tanggalLahir: json['tanggal_lahir'] as String?,
      nip: json['nip'] as String?,
      jenisKelamin: json['jenis_kelamin'] as String?,
      idXpb: json['id_xpb'] as int?,
      npsn: json['npsn'] as String?,
      roomId: json['room_id'] as int?,
      roomName: json['room_name'] as String?,
      namaSekolah: json['nama_sekolah'] as String?,
      kotaUjob: json['kota_ujob'] as String?,
    );
  }

  @override
  Map<String, Object?> toJson() => {
        'id_xcalonpeserta': idXcalonpeserta,
        'id_xkelas': idXkelas,
        'nama_kelas': namaKelas,
        'kls_tgl_checkin': klsTglCheckin,
        'kls_tgl_checkout': klsTglCheckout,
        'nik': nik,
        'nama': nama,
        'tanggal_lahir': tanggalLahir,
        'nip': nip,
        'jenis_kelamin': jenisKelamin,
        'id_xpb': idXpb,
        'npsn': npsn,
        'room_id': roomId,
        'room_name': roomName,
        'nama_sekolah': namaSekolah,
        'kota_ujob': kotaUjob,
      };

  ParticipantModel copyWith({
    int? idXcalonpeserta,
    int? idXkelas,
    String? namaKelas,
    DateTime? klsTglCheckin,
    DateTime? klsTglCheckout,
    String? nik,
    String? nama,
    String? tanggalLahir,
    String? nip,
    String? jenisKelamin,
    int? idXpb,
    String? npsn,
    int? roomId,
    String? roomName,
    String? namaSekolah,
    String? kotaUjob,
  }) {
    return ParticipantModel(
      idXcalonpeserta: idXcalonpeserta ?? this.idXcalonpeserta,
      idXkelas: idXkelas ?? this.idXkelas,
      namaKelas: namaKelas ?? this.namaKelas,
      klsTglCheckin: klsTglCheckin ?? this.klsTglCheckin,
      klsTglCheckout: klsTglCheckout ?? this.klsTglCheckout,
      nik: nik ?? this.nik,
      nama: nama ?? this.nama,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      nip: nip ?? this.nip,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      idXpb: idXpb ?? this.idXpb,
      npsn: npsn ?? this.npsn,
      roomId: roomId ?? this.roomId,
      roomName: roomName ?? this.roomName,
      namaSekolah: namaSekolah ?? this.namaSekolah,
      kotaUjob: kotaUjob ?? this.kotaUjob,
    );
  }

  @override
  List<Object?> get props {
    return [
      idXcalonpeserta,
      idXkelas,
      namaKelas,
      klsTglCheckin,
      klsTglCheckout,
      nik,
      nama,
      tanggalLahir,
      nip,
      jenisKelamin,
      idXpb,
      npsn,
      roomId,
      roomName,
      namaSekolah,
      kotaUjob,
    ];
  }
}
