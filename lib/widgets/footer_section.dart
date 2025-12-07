import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 Mayur Pawar • All rights reserved',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Row(
                children: [
                  Text(
                    'Build with ',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const Icon(FontAwesomeIcons.github, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    'mayurpawar/flutter-portfolio...',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
