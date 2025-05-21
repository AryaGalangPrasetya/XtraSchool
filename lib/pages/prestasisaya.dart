import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prestasi Saya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70, // Increased app bar height
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70, // Increased app bar height
          centerTitle: true,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const AchievementPage(),
    );
  }
}

class Achievement {
  final String title;
  final String date;
  final String organization;
  final String description;
  final String category;
  final Color color;
  final IconData icon;

  Achievement({
    required this.title,
    required this.date,
    required this.organization,
    required this.description,
    required this.category,
    required this.color,
    required this.icon,
  });
}

class AchievementPage extends StatefulWidget {
  const AchievementPage({Key? key}) : super(key: key);

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  String selectedCategory = 'Semua';
  final List<String> categories = ['Semua', 'Olahraga', 'Seni', 'Akademik', 'Organisasi'];

  final List<Achievement> achievements = [
    Achievement(
      title: 'Juara 1 Lomba Futsal',
      date: '15 Mei 2024',
      organization: 'Liga Futsal Antar SMA',
      description: 'Memenangkan kejuaraan futsal tingkat provinsi dengan skor akhir 3-1',
      category: 'Olahraga',
      color: Colors.blue,
      icon: Icons.sports_soccer,
    ),
    Achievement(
      title: 'Penghargaan Solo Vocal',
      date: '22 April 2024',
      organization: 'Festival Seni Nasional',
      description: 'Mendapatkan penghargaan sebagai solois terbaik dalam Festival Seni Pelajar',
      category: 'Seni',
      color: Colors.purple,
      icon: Icons.music_note,
    ),
    Achievement(
      title: 'Finalis Olimpiade Matematika',
      date: '3 Maret 2024',
      organization: 'Kementerian Pendidikan',
      description: 'Menjadi 10 finalis terbaik dalam Olimpiade Matematika tingkat nasional',
      category: 'Akademik',
      color: Colors.green,
      icon: Icons.calculate,
    ),
    Achievement(
      title: 'Ketua OSIS Terbaik',
      date: '27 Januari 2024',
      organization: 'Forum Pelajar Indonesia',
      description: 'Penghargaan atas dedikasi dan inovasi dalam kepemimpinan organisasi sekolah',
      category: 'Organisasi',
      color: Colors.orange,
      icon: Icons.groups,
    ),
    Achievement(
      title: 'Medali Perak Renang',
      date: '8 Desember 2023',
      organization: 'POPDA Provinsi',
      description: 'Meraih medali perak dalam lomba renang gaya bebas 100m',
      category: 'Olahraga',
      color: Colors.cyan,
      icon: Icons.pool,
    ),
    Achievement(
      title: 'Penghargaan Lukisan Terbaik',
      date: '17 November 2023',
      organization: 'Galeri Seni Kota',
      description: 'Karya lukis terpilih sebagai lukisan terbaik dalam pameran seni pelajar',
      category: 'Seni',
      color: Colors.pink,
      icon: Icons.palette,
    ),
  ];

  List<Achievement> getFilteredAchievements() {
    if (selectedCategory == 'Semua') {
      return achievements;
    } else {
      return achievements.where((achievement) => achievement.category == selectedCategory).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredAchievements = getFilteredAchievements();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0F7D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.of(context).pop(); // Added back button functionality
          },
        ),
        title: const Text(
          'Prestasi Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Increased font size
          ),
        ),
      ),
      body: Column(
        children: [
          // Category filter
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: categories.map((category) {
                  final isSelected = category == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : null,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      selectedColor: const Color(0xFF0A0F7D),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          
          // Achievements list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredAchievements.length,
              itemBuilder: (context, index) {
                final achievement = filteredAchievements[index];
                return AchievementCard(achievement: achievement);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0A0F7D),
        onPressed: () {
          // Tambah prestasi baru
          _showAddAchievementDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  void _showAddAchievementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Prestasi Baru'),
          content: const Text('Fitur ini akan memungkinkan Anda untuk menambahkan prestasi baru.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const AchievementCard({Key? key, required this.achievement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AchievementDetailPage(achievement: achievement),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with category and date
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: achievement.color.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: achievement.color,
                        child: Icon(achievement.icon, color: Colors.white, size: 20),
                        radius: 16,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        achievement.category,
                        style: TextStyle(
                          color: achievement.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    achievement.date,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            
            // Achievement content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    achievement.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    achievement.organization,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    achievement.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, size: 18),
                    label: const Text('Bagikan'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility, size: 18),
                    label: const Text('Detail'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementDetailPage extends StatelessWidget {
  final Achievement achievement;

  const AchievementDetailPage({Key? key, required this.achievement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0F7D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.of(context).pop(); // Added back button functionality
          },
        ),
        title: const Text(
          'Detail Prestasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Increased font size
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Achievement header
            Container(
              padding: const EdgeInsets.all(24),
              color: achievement.color.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: achievement.color,
                        child: Icon(achievement.icon, color: Colors.white),
                        radius: 24,
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: achievement.color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          achievement.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    achievement.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        achievement.date,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Organization
            Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: achievement.color.withOpacity(0.1),
                      child: Icon(
                        Icons.business,
                        color: achievement.color,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Organisasi Penyelenggara',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            achievement.organization,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        achievement.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Actions
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    Icons.share,
                    'Bagikan',
                    Colors.blue,
                  ),
                  _buildActionButton(
                    context,
                    Icons.edit,
                    'Edit',
                    Colors.orange,
                  ),
                  _buildActionButton(
                    context,
                    Icons.picture_as_pdf,
                    'Ekspor',
                    Colors.green,
                  ),
                ],
              ),
            ),
            
            // Similar achievements
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Prestasi Serupa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    achievement.icon,
                                    color: Colors.primaries[index % Colors.primaries.length],
                                    size: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prestasi ${index + 1}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Penyelenggara ${index + 1}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}