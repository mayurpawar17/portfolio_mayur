import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../core/helper_widgets.dart';

class AboutSection extends StatelessWidget {
  final bool isDesktop;
  const AboutSection({super.key, required this.isDesktop});

  final text = '''
Hi, I'm Mayur 👋, founder of Open-Sora and Video-Ocean. I'm working on AI-powered video generation and SaaS products that bridge research and real-world creativity.
''';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 20,
        vertical: 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isDesktop ? 2 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('About'),
                const SizedBox(height: 12),
                Text(text, style: const TextStyle(fontSize: 15, height: 1.6)),
              ],
            ),
          ),
          if (isDesktop) const SizedBox(width: 40),
          // if (isDesktop)
          //   Expanded(
          //     flex: 1,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         sectionTitle('Research Interests'),
          //         const SizedBox(height: 12),
          //         Text('Video Generation, Efficient ML, DL Optimizations'),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
=======
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
>>>>>>> d0a52f36509b00a20a7b010b9949e11923819d98
}
