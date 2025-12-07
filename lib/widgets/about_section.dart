import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700;

              return isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _aboutImage(),
                      const SizedBox(height: 30),
                      _aboutText(),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(child: _aboutImage()),
                      const SizedBox(width: 40),
                      Expanded(child: _aboutText()),
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }

  Widget _aboutImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        "https://picsum.photos/500/400",
        width: 450,
        height: 350,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _aboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "About Me",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Text(
          "I am a passionate Flutter developer creating fast, beautiful, and responsive apps for mobile and web. "
          "I focus on clean code, smooth animations, and scalable architecture.",
          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
        ),
        SizedBox(height: 20),
        Text(
          "Tech Stack:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          "• Flutter • Dart • Firebase • REST APIs\n"
          "• Node.js • Express.js • UI/UX Design",
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
        ),
      ],
    );
  }
}
