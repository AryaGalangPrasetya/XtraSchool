import 'package:flutter/material.dart';
import 'login_page.dart'; // Tambahkan ini
// import 'home_page.dart'; // Hapus jika tidak dipakai

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: 'Selamat Datang di\nEkstra School',
      description:
          'Tempat terbaik untuk mengembangkan minat dan bakatmu melalui berbagai kegiatan ekstrakurikuler yang seru dan bermanfaat.',
      image: 'assets/images/logo.png',
    ),
    OnboardingContent(
      title: 'Jelajahi Kegiatan Seru',
      description:
          'Dari olahraga hingga seni dan teknologi, temukan berbagai pilihan ekstrakurikuler yang sesuai dengan passion kamu, langsung dari aplikasi.',
      image: 'assets/images/logo.png',
    ),
    OnboardingContent(
      title: 'Gabung dan\nBerkembang Bersama',
      description:
          'Ikuti komunitas, ikuti jadwal, dan tingkatkan kemampuanmu. Bersama Ekstra School, setiap kegiatan jadi lebih mudah dan menyenangkan!',
      image: 'assets/images/logo.png',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E88E5),
              Color(0xFF1565C0),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 60),
                     // Logo image with appropriate size and better contrast
                Image.asset(
                  'assets/images/logo2.png',
                  width: 150,
                  height: 40,
                  color: Colors.white, // Added to improve logo visibility
                ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: _contents.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(content: _contents[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, left: 30.0, right: 30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _contents.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1565C0),
                          elevation: 4,
                          shadowColor: Colors.black.withAlpha((255 * 0.3).toInt()),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          _currentPage == _contents.length - 1
                              ? 'Mulai Sekarang'
                              : 'Lanjut',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Colors.white
            : Colors.white.withAlpha((255 * 0.3).toInt()),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final String image;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingPage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withAlpha((255 * 0.2).toInt()),
                Colors.white.withAlpha((255 * 0.05).toInt()),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255 * 0.1).toInt()),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha((255 * 0.15).toInt()),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                content.image,
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
        const Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                content.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((255 * 0.1).toInt()),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withAlpha((255 * 0.15).toInt()),
                    width: 1.0,
                  ),
                ),
                child: Text(
                  content.description,
                  style: TextStyle(
                    color: Colors.white.withAlpha((255 * 0.9).toInt()),
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
