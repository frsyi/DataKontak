import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Kontak',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Data Kontak")),
        ),
        body: const FormKontak(),
      ),
    );
  }
}

class FormKontak extends StatefulWidget {
  const FormKontak({super.key});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  File? _image;
  final _imagePicker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noTelpController = TextEditingController();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nama", hintText: "Masukkan Nama"),
                  controller: _namaController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email", hintText: "Masukkan Email"),
                  controller: _emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Alamat", hintText: "Masukkan Alamat"),
                  controller: _alamatController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "No Telpon", hintText: "Masukkan No Telpon"),
                  controller: _noTelpController,
                ),
              ),
              _image == null
                  ? const Text('Tidak ada gambar yang dipilih.')
                  : Image.file(_image!),
              const SizedBox(
                height: 100,
                child: Text(""),
              ),
              ElevatedButton(
                  onPressed: getImage, child: const Text("Ambil Gambar")),
              Container(
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // var result = await KontakController().addPerson(

                          // );
                        }
                      },
                      child: const Text("Simpan"))),
            ],
          ),
        ));
  }
}
