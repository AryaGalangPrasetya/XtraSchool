import 'package:flutter/material.dart';


/// Halaman Detail Profil yang menampilkan informasi lengkap siswa
/// dengan desain modern dan elegan
class DetailProfil extends StatelessWidget {
  const DetailProfil({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy profil lengkap
    final Map<String, String> profileData = {
      'Nama Lengkap': 'Arya Galang Prasetya',
      'NISN': '09327862767627',
      'Kelas': 'X RPL A',
      'Nama Ekstrakurikuler': 'Basket',
      'No Telephone': '081566767671',
      'Alamat': 'Jl Bungaaa Angtk',
      'Hobi': '-',
      'Jenis Kelamin': '-',
      'Email': '-',
      'Instagram': '-',
    };

    // Tema warna
    final Color primaryColor = const Color(0xFF0A1172); // Biru navy
    final Color labelColor = Colors.grey.shade500;
    final Color valueColor = const Color(0xFF333333);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header dengan gradient dan tombol kembali
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                const Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          
          // Konten profil
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profileData.entries.map((entry) {
                  return _buildProfileItem(
                    label: entry.key,
                    value: entry.value,
                    labelColor: labelColor,
                    valueColor: valueColor,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
     
    );
  }

  // Widget untuk item profil
  Widget _buildProfileItem({
    required String label,
    required String value,
    required Color labelColor,
    required Color valueColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: labelColor,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: Colors.grey.shade100, 
                width: 1,
              ),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}