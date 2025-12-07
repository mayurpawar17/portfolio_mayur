import 'package:flutter/material.dart';
import 'package:portfolio_mayur/widgets/project_card.dart';

import '../core/helper_widgets.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;

  const ProjectsSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sample = [
      {
        'title': 'Video-Ocean Video Agent',
        'date': 'Jun. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },
      {
        'title': 'Open-Sora',
        'date': 'Mar. 2024 - Mar. 2025',
        'image': 'assets/bmi_bg.png',
      },
      {
        'title': 'Video-Ocean',
        'date': 'Apr. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },
      {
        'title': 'Video-Ocean',
        'date': 'Apr. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Check out my latest work'),
          const SizedBox(height: 18),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children:
                sample.map((item) {
                  return SizedBox(
                    width:
                        isDesktop
                            ? 300
                            : MediaQuery.of(context).size.width > 600
                            ? (MediaQuery.of(context).size.width - 60) / 2
                            : MediaQuery.of(context).size.width - 40,
                    child: ProjectCard(
                      title: item['title']!,
                      date: item['date']!,
                      image: item['image']!,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              icon: const Icon(Icons.expand_more),
              label: const Text('Show All'),
            ),
          ),
        ],
      ),
    );
  }
}
