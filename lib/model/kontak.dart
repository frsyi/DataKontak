// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String noTelepon;
  final String foto;
  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.foto,
  });

  Kontak copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? noTelepon,
    String? foto,
  }) {
    return Kontak(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      noTelepon: noTelepon ?? this.noTelepon,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'noTelepon': noTelepon,
      'foto': foto,
    };
  }

  factory Kontak.fromMap(Map<String, dynamic> map) {
    return Kontak(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      noTelepon: map['noTelepon'] as String,
      foto: map['foto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kontak.fromJson(String source) =>
      Kontak.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kontak(nama: $nama, email: $email, alamat: $alamat, noTelepon: $noTelepon, foto: $foto)';
  }

  @override
  bool operator ==(covariant Kontak other) {
    if (identical(this, other)) return true;

    return other.nama == nama &&
        other.email == email &&
        other.alamat == alamat &&
        other.noTelepon == noTelepon &&
        other.foto == foto;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        email.hashCode ^
        alamat.hashCode ^
        noTelepon.hashCode ^
        foto.hashCode;
  }
}
