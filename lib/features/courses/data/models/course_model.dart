
class CourseModel {
  final String id;
  final String title;
  final String channelTitle;
  final String thumbnail;

  CourseModel({
    required this.id,
    required this.title,
    required this.channelTitle,
    required this.thumbnail,
  });

  factory CourseModel.fromYoutube(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? {};
    final thumbnails = snippet['thumbnails'] ?? {};

    String imageUrl = '';
    if (thumbnails['high'] != null) {
      imageUrl = thumbnails['high']['url'];
    } else if (thumbnails['medium'] != null) {
      imageUrl = thumbnails['medium']['url'];
    } else if (thumbnails['default'] != null) {
      imageUrl = thumbnails['default']['url'];
    } else {
      imageUrl = 'https://via.placeholder.com/480x270?text=No+Image';
    }

    return CourseModel(
      id: json['id'] ?? '',
      title: snippet['title'] ?? 'No Title',
      channelTitle: snippet['channelTitle'] ?? 'Unknown Channel',
      thumbnail: imageUrl,
    );
  }
}

class LanguageCategory {
  final String name;
  final String imagePath;
  final String channelId;

  const LanguageCategory({
    required this.name, 
    required this.imagePath, 
    required this.channelId,
  });
}