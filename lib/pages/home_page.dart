import 'package:flutter/material.dart';
import 'absensi_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> jadwalHariIni = [
    {'jam': '8:00pm', 'judul': 'Futsal', 'lokasi': 'Lapangan Sm'},
    {'jam': '2:00pm', 'judul': 'Basket', 'lokasi': 'Lapangan Cobra'},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color deepNavyBlue = Color(0xFF00447C);
    final Color brightBlue = Color(0xFF2962FF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // HEADER
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
                decoration: BoxDecoration(
                  color: deepNavyBlue,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("XtraSchool",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                        const Spacer(),
                        const Icon(Icons.mail_outline, color: Colors.white, size: 24),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Cari...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // SCROLLABLE CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),

                        // MENU ICONS
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildMenuIcon(Icons.calendar_month, "Jadwal", brightBlue, () {}),
                              _buildMenuIcon(Icons.assignment, "Pendaftaran", brightBlue, () {}),
                              _buildMenuIcon(Icons.emoji_events, "Prestasi", brightBlue, () {}),
                              _buildMenuIcon(Icons.check_circle, "Kehadiran", brightBlue, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AbsensiPage()),
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
                              const Text("Acara Hari ini",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF333333))),
                              const SizedBox(height: 12),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: brightBlue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text("17 Agustus, 2024",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                              const SizedBox(height: 16),

                              ...jadwalHariIni.asMap().entries.map((entry) {
                                final jadwal = entry.value;
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: brightBlue,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              jadwal['jam']!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 4),
                                            const Text(
                                              "i-Lecture",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(jadwal['judul']!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.black)),
                                              const SizedBox(height: 4),
                                              Text(jadwal['lokasi']!,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 14)),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),

                        // INFORMASI EKSTRAKULIKULER DENGAN GAMBAR
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Informasi Extrakulikuler",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF333333))),
                              const SizedBox(height: 16),
                              // Akademik dengan gambar
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(
                                        'assets/images/akademik.png',
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Akademik",
                                              style: TextStyle(
                                                  fontSize: 16, 
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF333333))),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                            decoration: BoxDecoration(
                                              color: brightBlue.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              "COMPETITION\nKATEGORI : SMA & SPM",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Non Akademik dengan gambar
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(
                                        'assets/images/nonakademik.png',
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Non Akademik",
                                              style: TextStyle(
                                                  fontSize: 16, 
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF333333))),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                            decoration: BoxDecoration(
                                              color: brightBlue.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              "TUTUAL COMPETITION\nKATEGORI : SMA & SPM",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // NAVIGATION BAR
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
                    onPressed: () {},
                  ),
                  const SizedBox(width: 60),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white, size: 28),
                    onPressed: () {},
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
                  icon: Icon(
                    Icons.calendar_today,
                    color: deepNavyBlue,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AbsensiPage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE6EFFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF333333))),
        ],
      ),
    );
  }
}