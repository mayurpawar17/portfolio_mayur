// Updated SkillsSection to match uploaded design (responsive and grouped)
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Widget buildSkillGroup(String title, List<String> assetPaths) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: assetPaths.map((path) => Image.asset(
              path,
              width: 40,
              height: 40,
            )).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: Column(
        children: [
          const Text(
            "My Skills",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Here are the technologies I'm proficient in.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: constraints.maxWidth > 600 ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSkillGroup("Frontend", [
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',

                  ]),
                  const SizedBox(height: 32),
                  buildSkillGroup("Backend", [
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',

                  ]),
                  const SizedBox(height: 32),
                  buildSkillGroup("Other", [
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',
                    'assets/jquery.png',

                  ]),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
