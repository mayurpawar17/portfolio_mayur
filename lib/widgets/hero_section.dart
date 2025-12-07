import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;

  const HeroSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      // ---------- DESKTOP UI ----------
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 110 : 20,
          vertical: 40,
        ),

        child: Row(
          children: [
            // left text
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mayur Pawar',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Full Stack Developer & AI Researcher',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.github),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.linkedin),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.envelope),
                      ),
                    ],
                  ),
                ],
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.03),
            ),

            // avatar
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child:
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: const AssetImage('assets/profile.png'),
                    ).animate().scaleXY(begin: 0.9, duration: 500.ms).fadeIn(),
              ),
            ),
          ],
        ),
      );
    }

    // ---------- MOBILE + TABLET UI (Column layout) ----------
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: const AssetImage('assets/profile.png'),
          ).animate().scaleXY(begin: 0.9, duration: 500.ms).fadeIn(),

          const SizedBox(height: 20),

          Text(
            'Mayur Pawar',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            'Full Stack Developer & AI Researcher',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.github),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.linkedin),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.envelope),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
