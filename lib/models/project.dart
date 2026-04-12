class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String? link;
  final String? linkLabel;
  final List<String> tags;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.link,
    this.linkLabel,
    required this.tags,
  });
}