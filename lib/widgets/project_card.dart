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
    final bool isTablet = width >= 600 && width < 1000;
    final bool isDesktop = width >= 1000;

    final double titleSize = isDesktop ? 20 : (isTablet ? 18 : 16);
    final double descSize = isDesktop ? 14 : 13;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 18,
          vertical: 14,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                // Fix overflow using smaller image height on mobile/tablet
                aspectRatio:
                    isDesktop ? 16 / 8 : (isTablet ? 16 / 10 : 16 / 12),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 12),

            // TITLE
            Text(
              title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            // DATE
            Text(date, style: TextStyle(fontSize: 13, color: Colors.grey[600])),

            const SizedBox(height: 10),

            // DESCRIPTION Flex prevents overflow
            Flexible(
              child: Text(
                'Short description of project goes here. Replace this text with your project summary.',
                style: TextStyle(fontSize: descSize, height: 1.4),
                maxLines: isMobile ? 3 : 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 14),

            // RESPONSIVE BUTTONS
            isMobile
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Website'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Github'),
                    ),
                  ],
                )
                : Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Website'),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Github'),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
