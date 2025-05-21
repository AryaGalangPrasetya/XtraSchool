import 'package:flutter/material.dart';

// Fix: Use prefix for imports to avoid name conflicts
import 'detail_profil.dart' as detail; // Import with prefix
import 'edit_profil.dart' as edit;     // Import with prefix
import 'riwayat_page.dart' as riwayat; // Add this import with prefix
// Tambahkan import ini di bagian atas file
import 'prestasisaya.dart' as prestasi; // Tambahkan import dengan prefix

/// Halaman Kontak yang menampilkan informasi profil siswa serta
/// menu navigasi tindakan yang relevan.
///
/// * Perbaikan layout dengan menghilangkan AppBar custom dan mengoptimalkan desain
/// * Menggunakan SafeArea untuk menangani notch/status bar dengan benar
/// * Memperbaiki visual dan spacing untuk tampilan yang lebih profesional
/// * Menambahkan fitur Profil pada menu akun di bagian atas
class KontakPage extends StatefulWidget {
  const KontakPage({super.key});

  @override
  State<KontakPage> createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  // ---- Dummy data ----
  String userName = "Galang";
  String userEmail = "galang@xtraschool.id";
  final String userClass = "XRPL A";
  final String userSchool = "SMKB 4 Malang";

  // Data profil lengkap untuk digunakan oleh DetailProfil dan EditProfil
  Map<String, String> _profileData = {
    'Nama Lengkap': 'Arya Galang Prasetya',
    'NISN': '09327862767627',
    'Kelas': 'X RPL A',
    'Nama Ekstrakurikuler': 'Basket',
    'No Telephone': '081566767671',
    'Alamat': 'Jl Bungaaa Angtk',
    'Hobi': '-',
    'Jenis Kelamin': '-',
    'Email': 'galang@xtraschool.id',
    'Instagram': '-',
  };

  // ---- Theme colours ----
  final Color primaryColor = const Color(0xFF0059AA);
  final Color accentColor = const Color(0xFF2962FF);
  final Color backgroundColor = const Color(0xFFF8FAFF);
  
  // Warna untuk masing-masing menu
  final Map<String, List<Color>> menuColors = {
    'profil': [const Color(0xFF2196F3), const Color(0xFF1976D2)],    // Biru
    'edit': [const Color(0xFF9C27B0), const Color(0xFF7B1FA2)],      // Ungu
    'jadwal': [const Color(0xFF4CAF50), const Color(0xFF388E3C)],    // Hijau
    'prestasi': [const Color(0xFFFF9800), const Color(0xFFF57C00)],  // Oranye
    'riwayat': [const Color(0xFF00BCD4), const Color(0xFF0097A7)],   // Cyan
    'logout': [const Color(0xFFE53935), const Color(0xFFC62828)],    // Merah
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildAvatar(),
              const SizedBox(height: 16),
              _buildIdentity(),
              const SizedBox(height: 30),
              _buildMenuSection(context),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- UI PARTS ---------------- //

  Widget _buildAvatar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryColor, accentColor],
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person, size: 60, color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentity() {
    return Column(
      children: [
        Text(
          userName, 
          style: const TextStyle(
            fontSize: 28, 
            fontWeight: FontWeight.bold, 
            color: Color(0xFF333333),
            letterSpacing: 0.5,
          )
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$userClass - $userSchool', 
            style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.w500,
              color: primaryColor.withOpacity(0.8),
            )
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_rounded, size: 16, color: accentColor),
              const SizedBox(width: 8),
              Text(
                userEmail, 
                style: TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700
                )
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, bottom: 12),
            child: Text(
              'Menu Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF555555),
                letterSpacing: 0.3,
              ),
            ),
          ),
          _buildMenuItem(
            icon: Icons.person_rounded, 
            title: 'Profil Saya', 
            onTap: () {
              // Fix: Use correct class name with prefix
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detail.DetailProfil()
                ),
              );
            },
            colorKey: 'profil',
          ),
          _buildMenuItem(
            icon: Icons.edit_rounded, 
            title: 'Edit Profil', 
            onTap: () async {
              // Fix: Use correct class name with prefix
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => edit.EditProfil(initialData: _profileData)
                ),
              );
              
              // Update data profil jika ada perubahan
              if (result != null && result is Map<String, String>) {
                setState(() {
                  _profileData = result;
                  // Update userName & userEmail jika ada perubahan di profil
                  if (_profileData['Nama Lengkap'] != null) {
                    userName = _profileData['Nama Lengkap']!.split(' ').first;
                  }
                  if (_profileData['Email'] != null && _profileData['Email'] != '-') {
                    userEmail = _profileData['Email']!;
                  }
                });
              }
            },
            colorKey: 'edit',
          ),
          _buildMenuItem(
            icon: Icons.calendar_month_rounded, 
            title: 'Jadwal Ekstrakurikuler', 
            onTap: () {},
            colorKey: 'jadwal',
          ),
          _buildMenuItem(
            icon: Icons.emoji_events_rounded, 
            title: 'Prestasi Saya', 
            onTap: () {
              // Navigasi ke halaman prestasi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => prestasi.AchievementPage()
                ),
              );
            },
            colorKey: 'prestasi',
          ),
          _buildMenuItem(
            icon: Icons.history_rounded, 
            title: 'Riwayat', 
            onTap: () {
              // Fix: Add navigation to RiwayatPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => riwayat.RiwayatPage()
                ),
              );
            },
            colorKey: 'riwayat',
          ),
          _buildMenuItem(
            icon: Icons.logout_rounded, 
            title: 'Keluar', 
            onTap: () => _showLogoutDialog(context), 
            isLogout: true,
            colorKey: 'logout',
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text(
                'XtraSchool v1.0.0', 
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                )
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon, 
    required String title, 
    required VoidCallback onTap, 
    bool isLogout = false,
    required String colorKey,
  }) {
    final List<Color> gradientColors = menuColors[colorKey] ?? 
        (isLogout ? menuColors['logout']! : [primaryColor, accentColor]);
    
    final Color baseColor = gradientColors[0];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), 
            blurRadius: 12, 
            offset: const Offset(0, 3)
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: baseColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon, 
                    color: Colors.white, 
                    size: 22
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  title, 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w600, 
                    color: isLogout ? Colors.red : const Color(0xFF333333)
                  )
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: baseColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded, 
                    color: baseColor.withOpacity(0.7), 
                    size: 22
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: const Text(
            'Konfirmasi Keluar', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Color(0xFF333333),
              fontSize: 20,
            )
          ),
          content: const Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?', 
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 16,
            )
          ),
          actions: [
            TextButton(
              child: Text(
                'Batal', 
                style: TextStyle(
                  color: Colors.grey.shade700, 
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 2,
              ),
              child: const Text(
                'Keluar', 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false),
            ),
          ],
        );
      },
    );
  }
}