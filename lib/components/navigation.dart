// import 'package:flutter/material.dart';

// class AppNavigation extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//   final VoidCallback onCenterButtonPressed;

//   final Color primaryColor = const Color(0xFF0059AA);

//   const AppNavigation({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//     required this.onCenterButtonPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 80,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildModernNavIcon(Icons.event_note, currentIndex == 0, () => onTap(0)),
//                 _buildModernNavIcon(Icons.app_registration, currentIndex == 1, () => onTap(1)),
//                 const SizedBox(width: 10),
//                 _buildModernNavIcon(Icons.emoji_events_rounded, currentIndex == 2, () => onTap(2)),
//                 _buildModernNavIcon(Icons.person_rounded, currentIndex == 3, () => onTap(3)),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 40,
//           left: 0,
//           right: 0,
//           child: Center(
//             child: Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1976D2),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF1976D2).withOpacity(0.4),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.calendar_today_rounded,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//                 onPressed: onCenterButtonPressed,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildModernNavIcon(IconData icon, bool isActive, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         width: 65,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: isActive ? const Color(0xFFEEF1F9) : Colors.transparent,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Icon(
//                     icon,
//                     color: isActive ? const Color(0xFF0059AA) : const Color(0xFF9AA0AA),
//                     size: 28,
//                   ),
//                 ),
//                 if (isActive)
//                   Positioned(
//                     bottom: -3,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: Container(
//                         width: 6,
//                         height: 6,
//                         decoration: const BoxDecoration(
//                           color: Color(0xFF0059AA),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
