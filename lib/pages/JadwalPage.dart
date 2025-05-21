import 'package:flutter/material.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  // Current selected day index (0 = Monday, 1 = Tuesday, etc.)
  int _selectedDayIndex = 0;
  
  // Days of the week
  final List<String> _days = [
    'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
  ];
  
  // Dummy data for jadwal per day
  final List<List<Map<String, String>>> _jadwalPerDay = [
    // Senin
    [
      {'jam': '2:00 pm', 'judul': 'Basket', 'lokasi': 'Lapangan Cobra', 'kategori': 'Olahraga'},
      {'jam': '4:30 pm', 'judul': 'Robotika', 'lokasi': 'Lab Teknik', 'kategori': 'Sains'},
    ],
    // Selasa
    [
      {'jam': '3:00 pm', 'judul': 'Paduan Suara', 'lokasi': 'Aula Utama', 'kategori': 'Seni'},
      {'jam': '4:00 pm', 'judul': 'Karya Ilmiah', 'lokasi': 'Lab Kimia', 'kategori': 'Akademik'},
    ],
    // Rabu
    [
      {'jam': '2:30 pm', 'judul': 'Pramuka', 'lokasi': 'Lapangan Utama', 'kategori': 'Organisasi'},
      {'jam': '4:00 pm', 'judul': 'Taekwondo', 'lokasi': 'Hall Sport', 'kategori': 'Bela Diri'},
    ],
    // Kamis
    [
      {'jam': '3:30 pm', 'judul': 'English Club', 'lokasi': 'Ruang Bahasa', 'kategori': 'Akademik'},
      {'jam': '5:00 pm', 'judul': 'Band', 'lokasi': 'Studio Musik', 'kategori': 'Seni'},
    ],
    // Jumat
    [
      {'jam': '2:00 pm', 'judul': 'PMR', 'lokasi': 'UKS', 'kategori': 'Organisasi'},
      {'jam': '4:30 pm', 'judul': 'Fotografi', 'lokasi': 'Studio Media', 'kategori': 'Seni'},
    ],
    // Sabtu
    [
      {'jam': '8:00 am', 'judul': 'Futsal', 'lokasi': 'Lapangan SM', 'kategori': 'Olahraga'},
      {'jam': '9:30 am', 'judul': 'Tari', 'lokasi': 'Sanggar Seni', 'kategori': 'Seni'},
      {'jam': '1:00 pm', 'judul': 'Karate', 'lokasi': 'Hall Sport', 'kategori': 'Bela Diri'},
    ],
    // Minggu
    [
      {'jam': '9:00 am', 'judul': 'Pecinta Alam', 'lokasi': 'Taman Sekolah', 'kategori': 'Outdoor'},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0059AA);
    const accentColor = Color(0xFF2962FF);
    const bgColor = Color(0xFFF8FAFF);
    const cardColor = Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Jadwal Ekstrakulikuler', 
          style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Header Calendar
          _buildCalendarHeader(accentColor, primaryColor),
          
          // Day selector
          _buildDaySelector(),
          
          // Schedule list
          Expanded(
            child: _jadwalPerDay[_selectedDayIndex].isEmpty
              ? _buildEmptySchedule()
              : _buildScheduleList(accentColor, cardColor),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader(Color accent, Color primary) {
    // Get the current date
    final now = DateTime.now();
    final month = _getMonthName(now.month);
    final year = now.year;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, accent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$month $year',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lihat jadwal ekstrakulikuler sekolah',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final isSelected = _selectedDayIndex == index;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDayIndex = index;
              });
            },
            child: Container(
              width: 85,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0059AA) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _days[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptySchedule() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy_rounded,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Tidak ada jadwal di hari ${_days[_selectedDayIndex]}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleList(Color accent, Color card) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      physics: const BouncingScrollPhysics(),
      itemCount: _jadwalPerDay[_selectedDayIndex].length,
      itemBuilder: (context, index) {
        final jadwal = _jadwalPerDay[_selectedDayIndex][index];
        return _jadwalCard(jadwal, accent, card);
      },
    );
  }

  Widget _jadwalCard(Map<String, String> j, Color accent, Color card) => Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: card,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 110,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accent, accent.withOpacity(.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                j['jam']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  j['kategori']!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
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
                Text(
                  j['judul']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      j['lokasi']!,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 14,
                            color: accent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Tersedia',
                            style: TextStyle(
                              color: accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  String _getMonthName(int month) {
    const monthNames = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return monthNames[month - 1];
  }
}