import 'package:flutter/material.dart';

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
}
