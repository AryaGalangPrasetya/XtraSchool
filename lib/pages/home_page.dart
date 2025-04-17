import 'package:flutter/material.dart';
import 'absensi_page.dart';  // Pastikan AbsensiPage diimpor dengan benar

class HomePage extends StatelessWidget {
  final List<Map<String, String>> jadwalHariIni = [
    {'jam': '8:00pm', 'judul': 'Futsal', 'lokasi': 'Lapangan Sm'},
    {'jam': '2:00pm', 'judul': 'Basket', 'lokasi': 'Lapangan Cobra'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                color: Colors.blue.shade900,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("XtraSchool",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const Spacer(),
                        const Icon(Icons.mail_outline, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Cari...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // MENU ICONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuIcon(Icons.calendar_month, "Jadwal", () {}),
                    _buildMenuIcon(Icons.assignment, "Pendaftaran", () {}),
                    _buildMenuIcon(Icons.emoji_events, "Prestasi", () {}),
                    _buildMenuIcon(Icons.check_circle, "Kehadiran", () {
                      // Navigasi ke halaman AbsensiPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AbsensiPage()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ACARA HARI INI
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Acara Hari ini", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("17 Agustus, 2024", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 12),
                    ...jadwalHariIni.map((jadwal) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                children: [
                                  Text(jadwal['jam']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  const Text("i-Lecture", style: TextStyle(color: Colors.white, fontSize: 10)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(jadwal['judul']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(jadwal['lokasi']!),
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              // INFORMASI EKSTRAKULIKULER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Informasi Extrakulikuler", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    const Text("Akademik"),
                    _buildBannerImage(),
                    const SizedBox(height: 12),
                    const Text("Non Akademik"),
                    _buildBannerImage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue.shade900),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
