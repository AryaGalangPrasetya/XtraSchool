import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userName = "Galang";
  final String userEmail = "galang@xtraschool.id";
  final String userClass = "XII IPA 2";
  final String userSchool = "SMAN 1 Bandung";

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0059AA);
    final Color accentColor = const Color(0xFF2962FF);
    final Color backgroundColor = const Color(0xFFF8FAFF);
    final Color cardColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              // Header Profil
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 25),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Text(
                      "Profil Saya",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // Konten Profil
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // Foto Profil
                        Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                                border: Border.all(color: Colors.white, width: 4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(Icons.person, size: 60, color: Colors.grey.shade500),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          userName,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$userClass - $userSchool",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_rounded, size: 16, color: accentColor),
                            const SizedBox(width: 6),
                            Text(
                              userEmail,
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        _buildMenuSection(context, cardColor, primaryColor),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildModernNavIcon(Icons.event_note, false, () {
                    Navigator.pushReplacementNamed(context, '/home');
                  }),
                  _buildModernNavIcon(Icons.app_registration, false, () {}),
                  const SizedBox(width: 10),
                  _buildModernNavIcon(Icons.emoji_events_rounded, false, () {}),
                  _buildModernNavIcon(Icons.person_rounded, true, () {}),
                ],
              ),
            ),
          ),

          // Tombol Tengah
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF1976D2),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1976D2).withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.calendar_today_rounded, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/absensi');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, Color cardColor, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.edit_rounded,
            title: "Edit Profil",
            onTap: () {},
            cardColor: cardColor,
            primaryColor: primaryColor,
          ),
          _buildMenuItem(
            icon: Icons.calendar_month_rounded,
            title: "Jadwal Ekstrakulikuler",
            onTap: () {},
            cardColor: cardColor,
            primaryColor: primaryColor,
          ),
          _buildMenuItem(
            icon: Icons.emoji_events_rounded,
            title: "Prestasi Saya",
            onTap: () {},
            cardColor: cardColor,
            primaryColor: primaryColor,
          ),
          _buildMenuItem(
            icon: Icons.history_rounded,
            title: "Riwayat",
            onTap: () {},
            cardColor: cardColor,
            primaryColor: primaryColor,
          ),
          _buildMenuItem(
            icon: Icons.logout_rounded,
            title: "Keluar",
            onTap: () {
              _showLogoutDialog(context);
            },
            cardColor: cardColor,
            primaryColor: primaryColor,
            isLogout: true,
          ),
          const SizedBox(height: 20),
          Text("XtraSchool v1.0.0", style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color cardColor,
    required Color primaryColor,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isLogout ? Colors.red.withOpacity(0.1) : primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: isLogout ? Colors.red : primaryColor, size: 22),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isLogout ? Colors.red : const Color(0xFF333333),
                  ),
                ),
                const Spacer(),
                Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernNavIcon(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 65,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isActive ? const Color(0xFFEEF1F9) : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, color: isActive ? const Color(0xFF0059AA) : const Color(0xFF9AA0AA), size: 28),
                ),
                if (isActive)
                  Positioned(
                    bottom: -3,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0059AA),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Konfirmasi Keluar', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333))),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?', style: TextStyle(color: Color(0xFF666666))),
          actions: <Widget>[
            TextButton(
              child: Text('Batal', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              onPressed: () {
                // Tambahkan logika logout di sini
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
