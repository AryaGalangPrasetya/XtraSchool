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
      extendBodyBehindAppBar: true, // Allow content to flow behind app bar
      appBar: _buildModernAppBar(context),
      body: Column(
        children: [
          _buildHeader(),
          const Expanded(child: _AchievementList()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildModernAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      leading: Hero(
        tag: 'back_button',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Show search dialog
                showSearch(
                  context: context, 
                  delegate: AchievementSearchDelegate(),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Icon(Icons.search, size: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A1172), Color(0xFF2E3192)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hall of Fame',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Prestasi terbaik dari siswa berprestasi',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ]
                    ),
                    child: const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.amber,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildStatCard('124', 'Total Prestasi', Icons.workspace_premium),
                    _buildStatCard('47', 'Juara 1', Icons.looks_one_rounded),
                    _buildStatCard('36', 'Juara 2', Icons.looks_two_rounded),
                    _buildStatCard('41', 'Juara 3', Icons.looks_3_rounded),
                    _buildStatCard('28', 'Finalis', Icons.star_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.filter_list, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ]
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.sort, color: Color(0xFF0A1172), size: 16),
                        SizedBox(width: 6),
                        Text(
                          'Terbaru',
                          style: TextStyle(
                            color: Color(0xFF0A1172),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
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
    );
  }

  Widget _buildStatCard(String number, String label, IconData icon) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
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
          title: Text('Olimpiade Matematika'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Lomba Karya Tulis'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Basket'),
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
        title: 'Juara 2 Basket Antar SMP',
        location: 'GOR Ken Arok',
        date: '5 Februari 2025',
        eventName: 'Kejuaraan Antar Sekolah Se‑Malang Raya',
        holder: 'Tim Basket SMP Negeri 5',
        participants: ['Budi Santoso', 'Ahmad Rizki', 'Dimas Putra', 'Reza Wijaya', 'Fajar Nugroho'],
        imagePath: 'assets/images/basketball.jpg',
      ),
      Achievement(
        title: 'Juara 1 Olimpiade Matematika',
        location: 'Universitas Brawijaya',
        date: '15 November 2024',
        eventName: 'Olimpiade Matematika Tingkat Provinsi',
        holder: 'Eka Pramuditya',
        participants: ['Eka Pramuditya'],
        imagePath: 'assets/images/math.jpg',
      ),
      Achievement(
        title: 'Juara 3 Lomba Karya Tulis',
        location: 'Balai Kota Malang',
        date: '20 September 2024',
        eventName: 'Festival Pelajar Kreatif 2024',
        holder: 'Tim Literasi SMP Negeri 8',
        participants: ['Sarah Nuraini', 'Dina Putri', 'Galih Prakoso'],
        imagePath: 'assets/images/writing.jpg',
      ),
      Achievement(
        title: 'Finalis Kompetisi Sains Nasional',
        location: 'Jakarta Convention Center',
        date: '8 Maret 2025',
        eventName: 'KSN Tingkat Nasional 2025',
        holder: 'Rendy Wijaya',
        participants: ['Rendy Wijaya'],
        imagePath: 'assets/images/science.jpg',
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
  final String title, location, date, eventName, holder, imagePath;
  final List<String> participants;
  
  const Achievement({
    required this.title, 
    required this.location, 
    required this.date, 
    required this.eventName, 
    required this.holder,
    required this.participants,
    required this.imagePath,
  });
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});
  final Achievement achievement;

  _CatData _categoryData(String t) {
    final lower = t.toLowerCase();
    if (lower.contains('basket')) return _CatData('Olahraga', Icons.sports_basketball, Colors.orange);
    if (lower.contains('matematika') || lower.contains('sains')) return _CatData('Akademik', Icons.calculate, Colors.green);
    if (lower.contains('karya tulis') || lower.contains('literasi')) return _CatData('Literasi', Icons.edit_document, Colors.purple);
    return _CatData('Prestasi', Icons.emoji_events, Colors.blue);
  }

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
                    final colors = _categoryData(achievement.title).color;
                    return Container(
                      height: 150,
                      width: double.infinity,
                      color: colors.withOpacity(0.3),
                      child: Icon(
                        _categoryData(achievement.title).icon,
                        color: colors,
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
                            _CategoryChip(title: achievement.title),
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
                        color: const Color(0xFFFFF6E0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.people_alt_rounded,
                        color: Color(0xFFBBA14F),
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
                // Location and Event
                _InfoRow(icon: Icons.location_on, color: Colors.red, text: achievement.location),
                const SizedBox(height: 8),
                _InfoRow(icon: Icons.emoji_events, color: Colors.amber, text: achievement.eventName),
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
                            icon: const Icon(Icons.bookmark_border, color: Color(0xFF0A1172)),
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
  const _CategoryChip({required this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    final data = _categoryData(title);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: data.color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, color: data.color, size: 16),
          const SizedBox(width: 6),
          Text(
            data.label,
            style: TextStyle(
              color: data.color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  _CatData _categoryData(String t) {
    final lower = t.toLowerCase();
    if (lower.contains('basket')) return _CatData('Olahraga', Icons.sports_basketball, Colors.orange);
    if (lower.contains('matematika') || lower.contains('sains')) return _CatData('Akademik', Icons.calculate, Colors.green);
    if (lower.contains('karya tulis') || lower.contains('literasi')) return _CatData('Literasi', Icons.edit_document, Colors.purple);
    return _CatData('Prestasi', Icons.emoji_events, Colors.blue);
  }
}

class _CatData {
  final String label;
  final IconData icon;
  final Color color;
  const _CatData(this.label, this.icon, this.color);
}