import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======

class HeroSection extends StatelessWidget {
  final String name;
  final String role;
  final String bio;

  const HeroSection({
    Key? key,
    required this.name,
    required this.role,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 650;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 60),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          /// ---------------------------------------------------------
          /// ROLE (small label)
          /// ---------------------------------------------------------
          Text(
            role.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),

          const SizedBox(height: 16),

          /// ---------------------------------------------------------
          /// NAME (BIG TEXT)
          /// ---------------------------------------------------------
          Text(
            name,
            style: TextStyle(
              fontSize: isMobile ? 36 : 54,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),

          const SizedBox(height: 18),

          /// ---------------------------------------------------------
          /// BIO
          /// ---------------------------------------------------------
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              bio,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                height: 1.6,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),

          const SizedBox(height: 28),

          /// ---------------------------------------------------------
          /// CTA BUTTONS
          /// ---------------------------------------------------------
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [_heroButton("View Projects"), _heroButton("Contact Me")],
>>>>>>> d0a52f36509b00a20a7b010b9949e11923819d98
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget _heroButton(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
>>>>>>> d0a52f36509b00a20a7b010b9949e11923819d98
}
