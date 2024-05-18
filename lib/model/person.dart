// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Person {
  final String nama;
  final String email;
  final String gambar;
  Person({
    required this.nama,
    required this.email,
    required this.gambar,
  });

  Person copyWith({
    String? nama,
    String? email,
    String? gambar,
  }) {
    return Person(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'gambar': gambar,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      nama: map['nama'] as String,
      email: map['email'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Person(nama: $nama, email: $email, gambar: $gambar)';

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.nama == nama && other.email == email && other.gambar == gambar;
  }

  @override
  int get hashCode => nama.hashCode ^ email.hashCode ^ gambar.hashCode;
}
