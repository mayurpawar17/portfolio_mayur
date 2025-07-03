import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hi, I'm Mayur Pawar",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Flutter & Android Developer",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}