import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/helper_widgets.dart';

class EducationSection extends StatelessWidget {
  final bool isDesktop;

  EducationSection({super.key, required this.isDesktop});

  final items = [
    {
      'title': 'National University of Singapore',
      'subtitle': 'Ph.D. in Computer Science',
      'years': '2021 - 2025',
      'logo': 'assets/bmi_bg.png',
    },
    {
      'title': 'Nanjing University',
      'subtitle': 'Bachelor\'s Degree of Computer Science',
      'years': '2017 - 2021',
      'logo': 'assets/bmi_bg.png',
    },
    {
      'title': 'Jiangsu Xishan Senior High School',
      'subtitle': 'High School Diploma',
      'years': '2014 - 2017',
      'logo': 'assets/bmi_bg.png',
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
          sectionTitle('Education'),
          const SizedBox(height: 12),
          Column(
            children:
                items.map((it) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(it['logo']!),
                    ),
                    title: Text(
                      it['title']!,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(it['subtitle']!),
                    trailing: Text(
                      it['years']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ).animate().fadeIn();
                }).toList(),
          ),
        ],
      ),
    );
  }
}
