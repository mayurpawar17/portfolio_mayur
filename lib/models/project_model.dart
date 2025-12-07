class ProjectModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? projectUrl; // optional: GitHub / live link

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.projectUrl,
  });
}

// ---------------------------
// Sample Placeholder Projects
// ---------------------------

final List<ProjectModel> myProjects = [
  ProjectModel(
    title: "FitJourney – Fitness Tracking App",
    subtitle: "Flutter • Firebase • Provider",
    imageUrl: "https://picsum.photos/600/400?random=1",
    projectUrl: "https://github.com/example/fitjourney",
  ),
  ProjectModel(
    title: "AI Chits – Smart ChitFund App",
    subtitle: "Flutter • REST API • Node.js",
    imageUrl: "https://picsum.photos/600/400?random=2",
    projectUrl: "https://github.com/example/aichits",
  ),
  ProjectModel(
    title: "Grit & Glow – Self Improvement App",
    subtitle: "Flutter • Provider • Custom UI",
    imageUrl: "https://picsum.photos/600/400?random=3",
    projectUrl: "https://github.com/example/gritglow",
  ),
];
