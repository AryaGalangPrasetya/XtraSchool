import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController kelasController = TextEditingController();
    final TextEditingController nisnController = TextEditingController();
    final TextEditingController tanggalController = TextEditingController();
    final TextEditingController ekstrakurikulerController = TextEditingController();
    final TextEditingController kehadiranController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.calendar_today, color: Colors.blue),
        onPressed: () {
          // Bisa kosong karena sudah di halaman ini
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        notchMargin: 6.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Kembali ke Home
                },
              ),
              const SizedBox(width: 24), // Kosong di tengah
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Arahkan ke halaman profil, nanti bisa diganti
                },
              ),
            ],
          ),
        ),
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
                if (_validateFields(namaController, kelasController, nisnController, tanggalController, ekstrakurikulerController, kehadiranController)) {
                  // Menggunakan SnackBar untuk memberikan feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil dikirim')),
                  );
                  namaController.clear();
                  kelasController.clear();
                  nisnController.clear();
                  tanggalController.clear();
                  ekstrakurikulerController.clear();
                  kehadiranController.clear();
                } else {
                  // Menampilkan pesan error dengan SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap isi semua data')),
                  );
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

  bool _validateFields(
    TextEditingController nama,
    TextEditingController kelas,
    TextEditingController nisn,
    TextEditingController tanggal,
    TextEditingController ekstrakurikuler,
    TextEditingController kehadiran,
  ) {
    return nama.text.isNotEmpty &&
        kelas.text.isNotEmpty &&
        nisn.text.isNotEmpty &&
        tanggal.text.isNotEmpty &&
        ekstrakurikuler.text.isNotEmpty &&
        kehadiran.text.isNotEmpty;
  }
}
