class CourseEntity {
  final String id;
  final String title;
  final String instructor;
  final String thumbnailUrl;
  final double progress; // نسبة التقدم 0.0 إلى 1.0

  CourseEntity({
    required this.id,
    required this.title,
    required this.instructor,
    required this.thumbnailUrl,
    required this.progress,
  });
}