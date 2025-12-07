import 'package:flutter/material.dart';

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
          ),
        ],
      ),
    );
  }

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
}
