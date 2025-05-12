import 'package:flutter/material.dart';
import '../models/ekskul.dart';

class DaftarPage extends StatefulWidget {
  final Ekskul ekskul;

  const DaftarPage({super.key, required this.ekskul}); // menggunakan super.key

  @override
  DaftarPageState createState() => DaftarPageState();
}

class DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();
  String nama = '';
  String kelas = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar ${widget.ekskul.nama}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => nama = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kelas'),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => kelas = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Kirim'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Pendaftaran Berhasil'),
                        content: Text('Terima kasih sudah mendaftar, $nama!'),
                        actions: [
                          TextButton(
                            child: Text('Tutup'),
                            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
