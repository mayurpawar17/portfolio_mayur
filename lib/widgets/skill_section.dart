import 'package:flutter/material.dart';

import '../core/helper_widgets.dart';

class SkillSection extends StatelessWidget {
  final bool isDesktop;
  SkillSection({super.key, required this.isDesktop});
  final skills = [
    'Python',
    'PyTorch',
    'TensorFlow',
    'ColossalAI',
    'vLLM',
    'LangGraph',
    'OpenAI API',
    'FastAPI',
    'PostgreSQL',
    'TypeScript',
    'React',
    'Next.js',
    'Docker',
    'Terraform',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Skills'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                skills
                    .map(
                      (s) => Chip(
                        backgroundColor: Theme.of(context).cardColor,
                        label: Text(s),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
