import 'package:flutter/material.dart';
import 'pages/get_started.dart';
import 'pages/login_page.dart'; // Import your LoginPage
import 'pages/home_page.dart'; // Import your HomePage
import 'pages/absensi_page.dart'; // Import your AbsensiPage
import 'pages/profile_page.dart'; // Import the new ProfilePage

void main() {
  runApp(const MyApp());
}

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
      // Define named routes for better navigation management
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/absensi': (context) => const AbsensiPage(),
        '/profile': (context) => const ProfilePage(),
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
    _navigateToGetStarted();
  }

  Future<void> _navigateToGetStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/get-started');
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
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
        ),
      ),
    );
  }
}