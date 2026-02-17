class RoadmapEntity {
  final String id;
  final String title;
  final String description;
  final String icon;
  final String level;
  final String duration;
  final List<RoadmapNode> nodes;
  final List<String> resources;

  const RoadmapEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.level,
    required this.duration,
    required this.nodes,
    required this.resources,
  });
}

class RoadmapNode {
  final String id;
  final String label;
  final String description;
  final List<String> children;
  final String? resource;
  final bool isCompleted;

  const RoadmapNode({
    required this.id,
    required this.label,
    required this.description,
    required this.children,
    this.resource,
    this.isCompleted = false,
  });
}