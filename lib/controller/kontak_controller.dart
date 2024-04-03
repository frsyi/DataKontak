import 'dart:convert';
import 'dart:io';

import 'package:data_kontak/model/kontak.dart';
import 'package:data_kontak/service/kontak_service.dart';

class KontakController {
  final kontakService = KontakService();

  Future<Map<String, dynamic>> addPerson(Kontak person, File? file) async {
    Map<String, String> data = {
      'nama': person.nama,
      'email': person.email,
      'alamat': person.alamat,
      'no_telepon': person.noTelepon,
    };

    try {
      var response = await kontakService.addPerson(data, file);

      if (response.statusCode == 201) {
        return {'succes': true, 'message': 'Data berhasil disimpan'};
      } else {
        //Penanganan ketika Content-Type bukan application/json
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'succes': false,
            'message': decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'succes': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data',
        };
      }
    } catch (e) {
      //Menangkap kesalahan jaringan atau saat decoding JSON
      return {
        'succes': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}
