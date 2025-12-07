import 'package:flutter/material.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Work",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                "Selected projects I've worked on recently:",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isMobile = constraints.maxWidth < 700;
                  return isMobile
                      ? Column(
                        children: [
                          WorkCard(
                            title: "FitJourney – Fitness Tracking App",
                            subtitle:
                                "Flutter • Firebase • Provider State Management",
                            imageUrl: "https://picsum.photos/600/400?random=1",
                          ),
                          const SizedBox(height: 20),
                          WorkCard(
                            title: "AI Chits – Smart ChitFund App",
                            subtitle: "Flutter • REST API • Node.js Backend",
                            imageUrl: "https://picsum.photos/600/400?random=2",
                          ),
                          const SizedBox(height: 20),
                          WorkCard(
                            title: "Grit & Glow – Self Improvement App",
                            subtitle: "Flutter • Provider • Custom UI",
                            imageUrl: "https://picsum.photos/600/400?random=3",
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: WorkCard(
                              title: "FitJourney – Fitness Tracking App",
                              subtitle:
                                  "Flutter • Firebase • Provider State Management",
                              imageUrl:
                                  "https://picsum.photos/600/400?random=1",
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: WorkCard(
                              title: "AI Chits – Smart ChitFund App",
                              subtitle: "Flutter • REST API • Node.js Backend",
                              imageUrl:
                                  "https://picsum.photos/600/400?random=2",
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: WorkCard(
                              title: "Grit & Glow – Self Improvement App",
                              subtitle: "Flutter • Provider • Custom UI",
                              imageUrl:
                                  "https://picsum.photos/600/400?random=3",
                            ),
                          ),
                        ],
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const WorkCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow:
              _hover
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Image.network(
                widget.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
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
    );
  }
}
