import 'package:flutter/material.dart';

// ──────────────────────
//  Halaman–halaman inti
// ──────────────────────
import 'pages/home_page.dart';
import 'pages/daftar_page.dart';
import 'pages/absensi_page.dart';
import 'pages/prestasi_page.dart';
import 'pages/kontak_page.dart'; // ✅ Import halaman kontak
import 'pages/get_started.dart';
import 'pages/login_page.dart';
import 'pages/jadwalpage.dart'; // ✅ Import halaman jadwal baru

import 'components/app_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XtraSchool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomeWithNavigation(initialIndex: 0),
        '/daftar': (context) => const HomeWithNavigation(initialIndex: 1),
        '/absensi': (context) => const HomeWithNavigation(initialIndex: 2),
        '/prestasi': (context) => const HomeWithNavigation(initialIndex: 3),
        '/kontak': (context) => const HomeWithNavigation(initialIndex: 4),
        '/jadwal': (context) => const JadwalPage(), // ✅ Tambahkan route jadwal
      },
      initialRoute: '/',
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/get-started');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E57FF), Color(0xFF004DFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png', width: 200),
        ),
      ),
    );
  }
}

class HomeWithNavigation extends StatefulWidget {
  final int initialIndex;
  const HomeWithNavigation({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<HomeWithNavigation> createState() => _HomeWithNavigationState();
}

class _HomeWithNavigationState extends State<HomeWithNavigation> {
  late int _currentIndex;

  final List<Widget> _pages = [
    HomePage(),             // 0
    const DaftarPage(),     // 1
    const AbsensiPage(),    // 2
    const PrestasiPage(),   // 3
    const KontakPage(),     // 4 ✅ Ganti dari ProfilePage
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex > _pages.length - 1 ? 0 : widget.initialIndex;
  }

  void _onTap(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _currentIndex = index;
      });
    } else {
      print("Error: Indeks navigasi tidak valid - $index");
    }
  }

  void _onCenterButtonPressed() {
    setState(() {
      _currentIndex = 2;
    });
    print("Tombol tengah ditekan: Navigasi ke Absensi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AppNavigation(
        currentIndex: _currentIndex,
        onTap: _onTap,
        onCenterButtonPressed: _onCenterButtonPressed,
      ),
    );
  }
}