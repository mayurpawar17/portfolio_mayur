import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String date;
  final String image;

  const ProjectCard({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;
    final bool isDesktop = width >= 1024;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio:
                  isMobile
                      ? 9 /
                          19 // Mobile: Tall mockup
                      : isTablet
                      ? 9 /
                          16 // Tablet: medium height
                      : 9 / 14, // Desktop: shorter mockup
              child: Image.network(
                image,
                fit: BoxFit.contain,
                // height: 150,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), const SizedBox(height: 6), Text(date)],
            ),
          ),
        ],
      ),
    );
  }
}
