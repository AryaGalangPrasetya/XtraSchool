// File: lib/pages/daftar_page.dart

import 'package:flutter/material.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _namaController = TextEditingController();
  final _nisnController = TextEditingController();
  final _kelasController = TextEditingController();
  final _extraController = TextEditingController();
  final _phoneController = TextEditingController();
  final _alamatController = TextEditingController();

  // Brightened primary color to match AbsensiPage
  final Color primaryColor = const Color(0xFF0071D1); // Brightened from 0xFF0059AA
  final Color backgroundColor = const Color(0xFFF8FAFF);

  @override
  void dispose() {
    _namaController.dispose();
    _nisnController.dispose();
    _kelasController.dispose();
    _extraController.dispose();
    _phoneController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _nisnController.clear();
    _kelasController.clear();
    _extraController.clear();
    _phoneController.clear();
    _alamatController.clear();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah kamu yakin ingin mengirim formulir ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Pendaftaran berhasil dikirim'),
                    backgroundColor: primaryColor,
                  ),
                );
                _resetForm();
              },
              child: const Text(
                'Kirim',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // Remove AppBar and replace with custom header
      body: Column(
        children: [
          // HEADER - Matching AbsensiPage style
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
          
          // BODY - Form content
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'PENDAFTARAN',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        _buildFormLabel('Nama Panjang :'),
                        _buildTextField(_namaController, 'Masukkan nama lengkap', Icons.person),
                        const SizedBox(height: 16),
                        _buildFormLabel('NISN :'),
                        _buildTextField(_nisnController, 'Masukkan NISN', Icons.badge,
                            keyboardType: TextInputType.number),
                        const SizedBox(height: 16),
                        _buildFormLabel('Kelas :'),
                        _buildTextField(_kelasController, 'Masukkan kelas', Icons.class_),
                        const SizedBox(height: 16),
                        _buildFormLabel('Nama Ekstrakurikuler :'),
                        _buildTextField(_extraController, 'Masukkan ekstrakurikuler', Icons.sports_basketball),
                        const SizedBox(height: 16),
                        _buildFormLabel('No Telephone :'),
                        _buildTextField(_phoneController, 'Masukkan nomor telepon', Icons.phone,
                            keyboardType: TextInputType.phone),
                        const SizedBox(height: 16),
                        _buildFormLabel('Alamat :'),
                        _buildTextField(_alamatController, 'Masukkan alamat lengkap', Icons.home, maxLines: 2),
                        const SizedBox(height: 40),

                        // Tombol KIRIM
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'KIRIM',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Tombol RESET
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: _resetForm,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: Icon(icon, color: primaryColor.withOpacity(0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field ini tidak boleh kosong';
        }
        return null;
      },
    );
  }
}