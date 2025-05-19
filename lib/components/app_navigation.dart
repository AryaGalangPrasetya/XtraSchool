import 'package:flutter/material.dart';

class AppNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onCenterButtonPressed;

  final Color primaryColor = const Color(0xFF0059AA);

  const AppNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.onCenterButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 85, // Increased height slightly
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAnimatedNavItem(0, Icons.home, 'Beranda'),
              _buildAnimatedNavItem(1, Icons.app_registration, 'Daftar'),
              const SizedBox(width: 60), // tombol tengah (Absensi)
              _buildAnimatedNavItem(3, Icons.emoji_events_rounded, 'Prestasi'),
              _buildAnimatedNavItem(4, Icons.person_rounded, 'Kontak'),
            ],
          ),
        ),

        // Tombol tengah
        Positioned(
          bottom: 40,
          child: _buildAnimatedCenterButton(),
        ),
      ],
    );
  }

  Widget _buildAnimatedNavItem(int index, IconData icon, String label) {
    bool isActive = currentIndex == index;

    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
        width: 70, // Increased width slightly
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated background and icon container
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              padding: EdgeInsets.all(isActive ? 8 : 6), // Reduced padding
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFEEF1F9) : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 0.9,
                  end: isActive ? 1.1 : 1.0,  // More modest size difference
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutBack, // Less extreme curve
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Icon(
                      icon,
                      color: isActive ? primaryColor : const Color(0xFF9AA0AA),
                      size: 24,  // Standardized size
                    ),
                  );
                },
              ),
            ),
            // Text label
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                label,
                style: TextStyle(
                  color: isActive ? primaryColor : const Color(0xFF9AA0AA),
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            // Animated indicator dot
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(top: 2),
              width: isActive ? 4 : 0,
              height: isActive ? 4 : 0,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCenterButton() {
    bool isActive = currentIndex == 2;

    return GestureDetector(
      onTap: () {
        onTap(2); // index 2 untuk absensi
        onCenterButtonPressed();
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: 0.95,
          end: isActive ? 1.05 : 1.0,  // More moderate size change
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 58,  // Standardized size
              height: 58,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF0059AA) : const Color(0xFF1976D2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1976D2).withOpacity(0.4),
                    blurRadius: isActive ? 12 : 8,
                    spreadRadius: isActive ? 1 : 0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: AnimatedRotation(
                  turns: isActive ? 0.03 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 28,  // Standardized icon size
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}