import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProjectCard2 extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  const ProjectCard2({
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
    return Container(
      width: isMobile ? 0.2 : 0.1,
      height: 1,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.3),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, fit: BoxFit.cover),
          ),

          const SizedBox(height: 12),

          // TITLE
          Text(
            title,
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 6),

          // DATE
          Text(date, style: TextStyle(fontSize: 13, color: Colors.grey[600])),

          const SizedBox(height: 10),

          // DESCRIPTION Flex prevents overflow
          AutoSizeText(
            'Short description of project goes here. Replace this text with your project summary.',
            style: TextStyle(fontSize: descSize),
            maxLines: 2, // Maximum lines
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
