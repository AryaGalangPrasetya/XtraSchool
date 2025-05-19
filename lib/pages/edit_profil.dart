import 'package:flutter/material.dart';

/// Halaman Edit Profil yang memungkinkan pengguna mengubah informasi profil
/// dengan desain yang selaras dengan halaman Detail Profil
class EditProfil extends StatefulWidget {
  final Map<String, String> initialData;
  
  const EditProfil({
    super.key, 
    required this.initialData,
  });

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  // Data profil untuk diubah, diinisialisasi dengan data yang sudah ada
  final Map<String, TextEditingController> _controllers = {};
  late Map<String, String> _profileData;

  @override
  void initState() {
    super.initState();
    // Salin data dari initialData
    _profileData = Map<String, String>.from(widget.initialData);
    // Buat TextEditingController untuk setiap field
    _profileData.forEach((key, value) {
      _controllers[key] = TextEditingController(text: value);
    });
  }

  @override
  void dispose() {
    // Hapus controllers untuk mencegah memory leak
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tema warna
    final Color primaryColor = const Color(0xFF0A1172); // Biru navy
    final Color labelColor = Colors.grey.shade500;
    
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
                  'Edit Profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
                const Spacer(),
                // Tombol Simpan
                GestureDetector(
                  onTap: _saveProfile,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Form edit profil
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _profileData.keys.map((key) {
                  return _buildEditProfileItem(
                    label: key,
                    controller: _controllers[key]!,
                    labelColor: labelColor,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item edit profil
  Widget _buildEditProfileItem({
    required String label,
    required TextEditingController controller,
    required Color labelColor,
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
                color: Colors.grey.shade200, 
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: InputBorder.none,
                hintText: 'Masukkan $label',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method untuk menyimpan perubahan profil
  void _saveProfile() {
    // Update nilai dalam map profileData
    _controllers.forEach((key, controller) {
      _profileData[key] = controller.text;
    });

    // Kembali ke halaman profil dengan membawa data yang sudah diperbarui
    Navigator.pop(context, _profileData);
  }
}

/// Contoh penggunaan untuk menghubungkan halaman DetailProfil dan EditProfil
class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  Map<String, String> _profileData = {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailProfil(profileData: _profileData),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0A1172),
        onPressed: () async {
          // Navigasi ke halaman edit dan tunggu hasil
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfil(initialData: _profileData),
            ),
          );
          
          // Update data jika ada perubahan
          if (result != null && result is Map<String, String>) {
            setState(() {
              _profileData = result;
            });
          }
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Versi yang diperbarui dari DetailProfil untuk menerima data profil
class DetailProfil extends StatelessWidget {
  final Map<String, String> profileData;
  
  const DetailProfil({
    super.key,
    required this.profileData,
  });

  @override
  Widget build(BuildContext context) {
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