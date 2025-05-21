import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  NotifikasiPage({Key? key}) : super(key: key);

  // Dummy data untuk notifikasi
  final List<Map<String, dynamic>> notifikasi = [
    {
      'judul': 'Jadwal latihan basket diubah',
      'pesan': 'Jadwal latihan basket hari Rabu dipindahkan ke pukul 15:00',
      'waktu': '10 menit yang lalu',
      'dibaca': false,
      'icon': Icons.sports_basketball,
      'iconColor': const Color(0xFF3F8CFF),
    },
    {
      'judul': 'Pengumuman Lomba Futsal',
      'pesan': 'Pendaftaran lomba futsal antar SMA telah dibuka',
      'waktu': '2 jam yang lalu',
      'dibaca': false,
      'icon': Icons.emoji_events_rounded,
      'iconColor': const Color(0xFF5E56FF),
    },
    {
      'judul': 'Absensi berhasil',
      'pesan': 'Absensi ekskul Pramuka hari ini telah tercatat',
      'waktu': '12 jam yang lalu',
      'dibaca': true,
      'icon': Icons.check_circle_outline,
      'iconColor': const Color(0xFF4CAF50),
    },
    {
      'judul': 'Reminder Pendaftaran',
      'pesan': 'Batas pendaftaran ekskul baru tinggal 3 hari lagi',
      'waktu': '1 hari yang lalu',
      'dibaca': true,
      'icon': Icons.access_time_rounded,
      'iconColor': const Color(0xFFFF9800),
    },
    {
      'judul': 'Prestasi Baru',
      'pesan': 'Tim debat sekolah kita meraih juara 2 di kompetisi nasional',
      'waktu': '2 hari yang lalu',
      'dibaca': true,
      'icon': Icons.star_rounded,
      'iconColor': const Color(0xFFFFD700),
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0059AA);
    const bgColor = Color(0xFFF8FAFF);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Logic untuk menandai semua notifikasi sebagai telah dibaca
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Semua notifikasi telah dibaca'),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'Tandai Semua Dibaca',
              style: TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: notifikasi.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: notifikasi.length,
              itemBuilder: (context, index) {
                final notif = notifikasi[index];
                return _buildNotificationCard(notif);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Tidak ada notifikasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Anda akan melihat notifikasi terkait kegiatan ekstrakulikuler di sini',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notif) {
    final bool isUnread = notif['dibaca'] == false;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: isUnread
            ? Border.all(color: const Color(0xFF2962FF), width: 1.5)
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: notif['iconColor'].withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            notif['icon'],
            color: notif['iconColor'],
            size: 24,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  notif['judul'],
                  style: TextStyle(
                    fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              if (isUnread)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2962FF),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notif['pesan'],
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              notif['waktu'],
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        onTap: () {
          // Logic ketika notifikasi diklik
          // Misalnya menampilkan detail atau menandai sebagai dibaca
        },
        // Trailing arrow icon (optional)
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Color(0xFF9AA0AA),
        ),
      ),
    );
  }
}