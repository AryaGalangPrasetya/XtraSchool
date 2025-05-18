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

  // Warna untuk UI yang sesuai dengan HomePage
  final Color primaryColor = const Color(0xFF0059AA);
  final Color accentColor = const Color(0xFF2962FF);
  final Color backgroundColor = const Color(0xFFF8FAFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              // MODERN HEADER - Lebih kecil seperti yang diminta
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 15),
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          "XtraSchool",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
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
                            Icons.help_outline_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // SCROLLABLE CONTENT
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 20),
                    
                    // JUDUL HALAMAN
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Kehadiran Ekstrakurikuler",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // METODE ABSENSI SELECTOR
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "METODE ABSENSI",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildMethodChip('Manual', 'manual'),
                              _buildMethodChip('Scan QR Code', 'qr'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    if (metode == 'manual') ...[
                      // FORMULIR DENGAN MODERN DESIGN
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "FORMULIR ABSENSI",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            _buildModernTextField('Nama Lengkap', namaController, Icons.person_outline),
                            _buildModernTextField('Kelas', kelasController, Icons.class_outlined),
                            _buildModernTextField('NISN', nisnController, Icons.badge_outlined),
                            _buildModernTextField('Tanggal Kegiatan', tanggalController, Icons.calendar_today_outlined),
                            _buildModernTextField('Nama Ekstrakurikuler', ekstrakurikulerController, Icons.sports_soccer_outlined),
                            _buildModernTextField('Status Kehadiran', kehadiranController, Icons.check_circle_outline),
                            const SizedBox(height: 20),
                            
                            // TOMBOL KIRIM MODERN
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_validateFields()) {
                                    _showSuccessDialog();
                                    namaController.clear();
                                    kelasController.clear();
                                    nisnController.clear();
                                    tanggalController.clear();
                                    ekstrakurikulerController.clear();
                                    kehadiranController.clear();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('Harap isi semua data'),
                                        backgroundColor: Colors.red.shade700,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5,
                                  shadowColor: primaryColor.withOpacity(0.5),
                                ),
                                child: const Text(
                                  'KIRIM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      // QR CODE SCANNER UI MODERN
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: accentColor.withOpacity(0.3),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 80,
                                color: primaryColor.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Silakan scan QR Code\ndi tempat kegiatan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Fitur scan QR belum tersedia'),
                                    backgroundColor: Colors.amber.shade700,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.camera_alt_rounded),
                              label: const Text('SCAN QR'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    // Extra space at bottom for the navigation bar
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),

          // BOTTOM NAVIGATION BAR - Sama seperti HomePage
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
                    spreadRadius: 0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildModernNavIcon(Icons.event_note, false, () {
                    Navigator.pop(context);
                  }),
                  _buildModernNavIcon(Icons.app_registration, false, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Navigasi ke halaman pendaftaran')),
                    );
                  }),
                  // Empty space for center button
                  const SizedBox(width: 10),
                  _buildModernNavIcon(Icons.emoji_events_rounded, false, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Navigasi ke halaman prestasi')),
                    );
                  }),
                  _buildModernNavIcon(Icons.person_rounded, false, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Navigasi ke halaman profil')),
                    );
                  }),
                ],
              ),
            ),
          ),
          
          // FLOATING CENTER BUTTON - Sama seperti HomePage
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
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // Sudah berada di halaman absensi
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodChip(String label, String value) {
    bool isSelected = metode == value;
    return GestureDetector(
      onTap: () {
        setState(() => metode = value);
        if (value == 'qr') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Fitur scan QR belum tersedia'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.amber.shade700,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? accentColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade800,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField(String label, TextEditingController controller, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Icon(icon, color: accentColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  // MODERN NAVIGATION ICON DENGAN GAYA YANG SAMA DENGAN HOMEPAGE
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
                  child: Icon(
                    icon,
                    color: isActive ? const Color(0xFF0059AA) : const Color(0xFF9AA0AA),
                    size: 28,
                  ),
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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green.shade700,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Berhasil!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Data kehadiran kamu telah\nberhasil dikirim",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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