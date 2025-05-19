import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ─── dummy data ───
  final List<Map<String, String>> jadwalHariIni = [
    {'jam': '8:00 pm', 'judul': 'Futsal',  'lokasi': 'Lapangan Sm'},
    {'jam': '2:00 pm', 'judul': 'Basket',  'lokasi': 'Lapangan Cobra'},
  ];

  // ─── BUILD ───
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0059AA);
    const accentColor  = Color(0xFF2962FF);
    const bgColor      = Color(0xFFF8FAFF);
    const cardColor    = Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      /* ‼️  AppNavigation DIHAPUS di HomePage.
         Navigation bar sudah disediakan oleh HomeShell. */
      body: Column(
        children: [
          // ─────────── HEADER ───────────
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 25),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft:  Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'XtraSchool',
                      style: TextStyle(
                        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.mail_outline_rounded,
                          color: Colors.white, size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF9AA0AA)),
                      hintText: 'Cari kegiatan ekstrakulikuler…',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ─────────── KONTEN (scroll) ───────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  // ─── MENU IKON ───
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFeatureIcon(Icons.calendar_month_rounded, 'Jadwal',
                            const Color(0xFF4E6CEF), () {}),
                        _buildFeatureIcon(Icons.assignment_rounded, 'Pendaftaran',
                            const Color(0xFF3F8CFF), () {}),
                        _buildFeatureIcon(Icons.emoji_events_rounded, 'Prestasi',
                            const Color(0xFF5E56FF), () {}),
                        _buildFeatureIcon(Icons.check_circle_rounded, 'Kehadiran',
                            const Color(0xFF3F51B5), () {
                          // contoh navigate ke Absensi
                          Navigator.pushNamed(context, '/absensi');
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ─── ACARA HARI INI ───
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Acara Hari ini', accentColor),
                        const SizedBox(height: 16),
                        _tanggalBar(accentColor, primaryColor),
                        const SizedBox(height: 20),
                        ...jadwalHariIni
                            .map((j) => _jadwalCard(j, accentColor, cardColor))
                            .toList(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ─── INFORMASI EKSKUL ───
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Informasi Ekstrakulikuler', accentColor),
                        const SizedBox(height: 20),
                        _infoCard('assets/images/akademik.png',  'Akademik',
                            'COMPETITION\nKATEGORI : SMA & SPM', accentColor),
                        const SizedBox(height: 20),
                        _infoCard('assets/images/nonakademik.png', 'Non Akademik',
                            'FUTSAL COMPETITION\nKATEGORI : SMA & SPM', accentColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────── UTIL WIDGETS ───────────
  Widget _sectionTitle(String text, Color accent) => Row(
        children: [
          Container(width: 4, height: 20,
              decoration: BoxDecoration(
                color: accent, borderRadius: BorderRadius.circular(5))),
          const SizedBox(width: 8),
          Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF333333))),
        ],
      );

  Widget _tanggalBar(Color accent, Color primary) => Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [accent, primary]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today_rounded, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            const Text('17 Agustus, 2024',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _buildFeatureIcon(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _jadwalCard(Map<String, String> j, Color accent, Color card) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.05),
                blurRadius: 10, offset: const Offset(0,4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [accent, accent.withOpacity(.8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(j['jam']!, style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('i-Lecture',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(j['judul']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      Row(children: [
                        Icon(Icons.location_on_rounded,
                            size: 16, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text(j['lokasi']!, style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 14)),
                      ]),
                    ]),
              ),
            ),
          ],
        ),
      );

  Widget _infoCard(String img, String title, String desc, Color accent) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.05),
                blurRadius: 15, spreadRadius: 1, offset: const Offset(0,8)),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Stack(
                children: [
                  Image.asset(img, height: 140, width: double.infinity, fit: BoxFit.cover),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(.6), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.0, .6],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15, left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.85),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: accent.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accent.withOpacity(.3)),
                ),
                child: Text(desc,
                    style:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      );
}
