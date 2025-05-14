import 'package:flutter/material.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController ekstrakurikulerController = TextEditingController();
  final TextEditingController kehadiranController = TextEditingController();

  String metode = 'manual';

  // Warna untuk navigasi bar
  Color deepNavyBlue = const Color(0xFF001F54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const SizedBox(height: 60),
                const Text(
                  'METODE ABSENSI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoiceChip(
                      label: const Text('Manual'),
                      selected: metode == 'manual',
                      onSelected: (_) => setState(() => metode = 'manual'),
                    ),
                    ChoiceChip(
                      label: const Text('Scan QR Code'),
                      selected: metode == 'qr',
                      onSelected: (_) {
                        setState(() => metode = 'qr');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fitur scan QR belum tersedia')),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (metode == 'manual') ...[
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
                      if (_validateFields()) {
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Harap isi semua data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepNavyBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'KIRIM',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ] else ...[
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: const [
                        Icon(Icons.qr_code_scanner, size: 100, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          'Silakan scan QR Code di tempat kegiatan',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),

          // NAVIGATION BAR (SAMA KAYAK DI HALAMAN HOME)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: deepNavyBlue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home'); // Menuju halaman home
                    },
                  ),
                  const SizedBox(width: 60),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profil'); // Menuju halaman profil
                    },
                  ),
                ],
              ),
            ),
          ),

          // FLOATING ACTION BUTTON
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.calendar_today, color: deepNavyBlue, size: 28),
                  onPressed: () {
                    // Sedang di halaman absensi, tidak perlu pindah
                  },
                ),
              ),
            ),
          ),
        ],
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

  bool _validateFields() {
    return namaController.text.isNotEmpty &&
        kelasController.text.isNotEmpty &&
        nisnController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        ekstrakurikulerController.text.isNotEmpty &&
        kehadiranController.text.isNotEmpty;
  }
}
