class RoadmapSummaryEntity {
  final String id;
  final String title;
  final String description;
  final String? icon;
  final String? level;

  const RoadmapSummaryEntity({
    required this.id,
    required this.title,
    required this.description,
    this.icon,
    this.level,
  });
}