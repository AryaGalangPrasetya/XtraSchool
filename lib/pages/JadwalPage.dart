import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Ekstrakurikuler'),
      ),
      body: const Center(
        child: Text('Halaman Jadwal Akan Ditampilkan Di Sini'),
      ),
    );
  }
}