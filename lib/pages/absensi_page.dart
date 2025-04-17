import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat TextEditingController untuk mengontrol TextField
    final TextEditingController namaController = TextEditingController();
    final TextEditingController kelasController = TextEditingController();
    final TextEditingController nisnController = TextEditingController();
    final TextEditingController tanggalController = TextEditingController();
    final TextEditingController ekstrakurikulerController = TextEditingController();
    final TextEditingController kehadiranController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Navigator.pop(context); // ke Home
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Absensi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'FORMULIR ABSENSI EKSTRA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildTextField('Nama Lengkap', namaController),
            _buildTextField('Kelas', kelasController),
            _buildTextField('NISN', nisnController),
            _buildTextField('Tanggal Kegiatan', tanggalController),
            _buildTextField('Nama Ekstrakurikuler', ekstrakurikulerController),
            _buildTextField('Status Kehadiran', kehadiranController),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Validasi dan kirim data ke server/database
                if (_validateFields(namaController, kelasController, nisnController, tanggalController, ekstrakurikulerController, kehadiranController)) {
                  // Logic untuk menyimpan data absensi
                  print('Data berhasil dikirim');
                  // Reset field setelah kirim
                  namaController.clear();
                  kelasController.clear();
                  nisnController.clear();
                  tanggalController.clear();
                  ekstrakurikulerController.clear();
                  kehadiranController.clear();
                } else {
                  // Tampilkan pesan kesalahan jika ada field yang kosong
                  print('Harap isi semua data');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
              ),
              child: const Text(
                'KIRIM',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

  bool _validateFields(TextEditingController nama, TextEditingController kelas, TextEditingController nisn, TextEditingController tanggal, TextEditingController ekstrakurikuler, TextEditingController kehadiran) {
    return nama.text.isNotEmpty &&
        kelas.text.isNotEmpty &&
        nisn.text.isNotEmpty &&
        tanggal.text.isNotEmpty &&
        ekstrakurikuler.text.isNotEmpty &&
        kehadiran.text.isNotEmpty;
  }
}
