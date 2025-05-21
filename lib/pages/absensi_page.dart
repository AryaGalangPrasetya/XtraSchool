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

  // Brightened primary color for better contrast
  final Color primaryColor = const Color(0xFF0071D1); // Brightened from 0xFF0059AA
  final Color accentColor = const Color(0xFF2962FF);
  final Color backgroundColor = const Color(0xFFF8FAFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // HEADER - Brightened and improved
          Container(
            padding:
                const EdgeInsets.only(left: 4, right: 20, top: 40, bottom: 10),
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
                // Back button with reduced padding
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 22,
                  ),
                ),
                // Logo image with appropriate size and better contrast
                Image.asset(
                  'assets/images/logo2.png',
                  width: 150,
                  height: 40,
                  color: Colors.white, // Added to improve logo visibility
                ),
              ],
            ),
          ),
          // CONTENT
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                // Removed "Kehadiran Ekstrakurikuler" title here
                const SizedBox(height: 10),
                _buildMetodeSelector(),
                const SizedBox(height: 20),
                if (metode == 'manual') _buildForm() else _buildQrPlaceholder(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- UI BUILDERS ---------- //
  Widget _buildSectionTitle(String title) {
    return Row(
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
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  Widget _buildMetodeSelector() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("METODE ABSENSI"),
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
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("FORMULIR ABSENSI"),
          const SizedBox(height: 20),
          _buildModernTextField('Nama Lengkap', namaController, Icons.person_outline),
          _buildModernTextField('Kelas', kelasController, Icons.class_outlined),
          _buildModernTextField('NISN', nisnController, Icons.badge_outlined),
          _buildModernTextField('Tanggal Kegiatan', tanggalController, Icons.calendar_today_outlined),
          _buildModernTextField('Nama Ekstrakurikuler', ekstrakurikulerController, Icons.sports_soccer_outlined),
          _buildModernTextField('Status Kehadiran', kehadiranController, Icons.check_circle_outline),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                shadowColor: primaryColor.withOpacity(0.5),
              ),
              child: const Text(
                'KIRIM',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor.withOpacity(0.3), width: 2),
            ),
            child: Icon(Icons.qr_code_scanner_rounded, size: 80, color: primaryColor.withOpacity(0.7)),
          ),
          const SizedBox(height: 24),
          Text(
            'Silakan scan QR Code\ndi tempat kegiatan',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }

  // ---------- HELPERS ---------- //
  Widget _buildMethodChip(String label, String value) {
    bool isSelected = metode == value;
    return GestureDetector(
      onTap: () {
        setState(() => metode = value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? accentColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [BoxShadow(color: accentColor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))]
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

  void _onSubmit() {
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  bool _validateFields() {
    return namaController.text.isNotEmpty &&
        kelasController.text.isNotEmpty &&
        nisnController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        ekstrakurikulerController.text.isNotEmpty &&
        kehadiranController.text.isNotEmpty;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.green.shade100, shape: BoxShape.circle),
                  child: Icon(Icons.check_circle_outline_rounded, color: Colors.green.shade700, size: 50),
                ),
                const SizedBox(height: 24),
                const Text('Berhasil!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text('Data kehadiran kamu telah\nberhasil dikirim', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text('OK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}