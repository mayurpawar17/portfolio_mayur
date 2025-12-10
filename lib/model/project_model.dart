class WorkProject {
  final String title;
  final String description;
  final String image;
  final String icon;
  final bool isInternal;

  WorkProject({
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
    this.isInternal = false,
  });
}
