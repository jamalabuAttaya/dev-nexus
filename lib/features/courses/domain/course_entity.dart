class CourseEntity {
  final String id;
  final String title;
  final String instructor;
  final String thumbnailUrl;
  final double progress; 

  CourseEntity({
    required this.id,
    required this.title,
    required this.instructor,
    required this.thumbnailUrl,
    required this.progress,
  });
}