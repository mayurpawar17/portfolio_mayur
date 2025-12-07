import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
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
=======
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow:
              _hover
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
        ),
        transform:
            Matrix4.identity()
              ..scale(_hover ? 1.02 : 1.0), // subtle zoom on hover
        child: GestureDetector(
          onTap: widget.onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                // Project Image
                Image.network(
                  widget.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Text area
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
>>>>>>> d0a52f36509b00a20a7b010b9949e11923819d98
      ),
    );
  }
}
