// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class TopNavbar extends StatelessWidget {
//   final bool isDesktop;
//   const TopNavbar({super.key, required this.isDesktop});
//
//   @override
//   Widget build(BuildContext context) {
//     if (!isDesktop) return const SizedBox();
//
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(color: Colors.transparent),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           DecoratedBox(
//             decoration: BoxDecoration(
//               color: Color(0xffffffff),
//               borderRadius: BorderRadius.circular(32),
//
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               child: Row(
//                 children: [
//                   navIcon(0, FontAwesomeIcons.house),
//                   navIcon(1, FontAwesomeIcons.circleInfo),
//                   navIcon(2, FontAwesomeIcons.briefcase),
//                   navIcon(3, FontAwesomeIcons.solidStar),
//                   navIcon(4, FontAwesomeIcons.school),
//                   navIcon(5, FontAwesomeIcons.suitcase),
//                   // navIcon(6, FontAwesomeIcons.at),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//
//           // Theme toggle
//           IconButton(
//             tooltip: 'Toggle Theme',
//             onPressed: widget.onToggleTheme,
//             icon: Icon(widget.isDark ? Icons.wb_sunny : Icons.dark_mode),
//           ),
//         ],
//       ),
//     );
//   }
// }
