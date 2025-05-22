import 'package:flutter/material.dart';

class PrestasiPage extends StatelessWidget {
  const PrestasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A1172),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A1172),
          brightness: Brightness.light,
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const _PrestasiHome(),
    );
  }
}

class _PrestasiHome extends StatelessWidget {
  const _PrestasiHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildHeader(context),
          const Expanded(child: _AchievementList()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    const primaryColor = Color(0xFF0A1172);
    
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 4, right: 20, top: 40, bottom: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A1172), Color(0xFF2E3192)],
        ),
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
      child: SafeArea(
        child: Row(
          children: [
            // Back button yang fungsional
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                onPressed: () {
                  // Fungsi untuk kembali ke halaman sebelumnya
                  Navigator.of(context).pop();
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 22,
              ),
            ),
            // Logo image
            Image.asset(
              'assets/images/logo2.png',
              width: 150,
              height: 40,
              color: Colors.white, // Untuk meningkatkan visibilitas logo
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    'XtraSchool',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implementation would filter real results
    return Center(
      child: Text('Hasil pencarian untuk: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implementation would show suggestions
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Futsal'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Pramuka'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Robotika'),
        ),
      ],
    );
  }
}

class _AchievementList extends StatelessWidget {
  const _AchievementList();

  @override
  Widget build(BuildContext context) {
    final achievements = <Achievement>[
      Achievement(
        title: 'Juara 1 Kompetisi Futsal',
        location: 'Stadion Kanjuruhan',
        date: '12 Maret 2025',
        eventName: 'Turnamen Futsal Antar SMP Se-Jawa Timur',
        holder: 'Tim Futsal SMP XtraSchool',
        participants: ['Ahmad Dahlan', 'Rafi Pradana', 'Dimas Rizky', 'Fajar Nugraha', 'Bayu Permadi'],
        imagePath: 'assets/images/futsal.jpg',
        category: 'Olahraga',
        categoryIcon: Icons.sports_soccer,
        categoryColor: Colors.green,
      ),
      Achievement(
        title: 'Juara 2 Lomba Robotik',
        location: 'Politeknik Negeri Malang',
        date: '25 Februari 2025',
        eventName: 'Indonesia Robot Contest 2025',
        holder: 'Tim Robotika XtraSchool',
        participants: ['Anita Dewi', 'Rizky Pratama', 'Budi Santoso'],
        imagePath: 'assets/images/robotics.jpg',
        category: 'Sains & Teknologi',
        categoryIcon: Icons.smart_toy,
        categoryColor: Colors.blue,
      ),
      Achievement(
        title: 'Juara 1 Lomba Paduan Suara',
        location: 'Gedung Kesenian Jakarta',
        date: '18 Januari 2025',
        eventName: 'Festival Paduan Suara Nasional',
        holder: 'Paduan Suara XtraSchool',
        participants: ['Maya Anggraini', 'Putri Rahayu', 'Dimas Ardiansyah', 'Sinta Dewi', 'Rafi Ahmad', 'Anisa Pratiwi', 'Bayu Purnama', 'Dini Anggraeni'],
        imagePath: 'assets/images/choir.jpg',
        category: 'Seni',
        categoryIcon: Icons.music_note,
        categoryColor: Colors.purple,
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: achievements.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => _AchievementCard(achievement: achievements[i]),
    );
  }
}

class Achievement {
  final String title, location, date, eventName, holder, imagePath, category;
  final List<String> participants;
  final IconData categoryIcon;
  final Color categoryColor;
  
  const Achievement({
    required this.title, 
    required this.location, 
    required this.date, 
    required this.eventName, 
    required this.holder,
    required this.participants,
    required this.imagePath,
    required this.category,
    required this.categoryIcon,
    required this.categoryColor,
  });
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});
  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  achievement.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Placeholder for demo purposes
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      width: double.infinity,
                      color: achievement.categoryColor.withOpacity(0.3),
                      child: Icon(
                        achievement.categoryIcon,
                        color: achievement.categoryColor,
                        size: 60,
                      ),
                    );
                  },
                ),
                // Gradient overlay
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                // Bottom title overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                achievement.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            _CategoryChip(
                              label: achievement.category,
                              icon: achievement.categoryIcon,
                              color: achievement.categoryColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, color: Colors.white, size: 14),
                            const SizedBox(width: 6),
                            Text(
                              achievement.date,
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F6FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        achievement.categoryIcon,
                        color: achievement.categoryColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            achievement.holder,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A1172),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Peserta: ${achievement.participants.join(', ')}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Divider
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                const SizedBox(height: 16),
                // Location and Event
                _InfoRow(icon: Icons.emoji_events, color: Colors.amber, text: achievement.eventName),
                const SizedBox(height: 8),
                _InfoRow(icon: Icons.location_on, color: Colors.red, text: achievement.location),
                const SizedBox(height: 20),
                
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye, size: 16),
                      label: const Text('Detail'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border, color: Color(0xFF0A1172)),
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share, size: 16),
                          label: const Text('Bagikan'),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF0A1172),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.color, required this.text});
  final IconData icon;
  final Color color;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.icon, required this.color});
  final String label;
  final IconData icon;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}