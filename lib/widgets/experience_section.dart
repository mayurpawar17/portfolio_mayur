import 'package:flutter/material.dart';

import '../core/helper_widgets.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  ExperienceSection({super.key, required this.isDesktop});

  final items = [
    {
      'title': 'HPC-AI Tech',
      'role': 'Tech Lead',
      'date': 'Dec. 2024 - Present',
    },
    {
      'title': 'Bytedance',
      'role': 'Research Intern',
      'date': 'Jun. 2021 - Jun. 2022',
    },
    {
      'title': 'UC Berkeley',
      'role': 'Research Intern',
      'date': 'Apr. 2020 - May. 2021',
    },
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
          sectionTitle('Internship & Work Experience'),
          const SizedBox(height: 12),
          Column(
            children:
                items.map((it) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                it['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                it['role']!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          it['date']!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
