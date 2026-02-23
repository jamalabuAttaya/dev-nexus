class CourseModel {
  final String id;
  final String title;
  final String description;      
  final String thumbnail;
  final String channelId;        
  final String channelTitle;
  final String publishedAt;       

  CourseModel({
    required this.id,
    required this.title,
    required this.description,    
    required this.thumbnail,
    required this.channelId,      
    required this.channelTitle,
    required this.publishedAt,    
  });

  
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      channelId: json['channelId'] ?? '',
      channelTitle: json['channelTitle'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'channelId': channelId,
      'channelTitle': channelTitle,
      'publishedAt': publishedAt,
    };
  }

  
  factory CourseModel.fromYouTubeItem(Map<String, dynamic> item) {
    final snippet = item['snippet'] ?? {};
    final resourceId = snippet['resourceId'] ?? {};
    
    return CourseModel(
      id: resourceId['videoId'] ?? item['id'] ?? '',
      title: snippet['title'] ?? 'بدون عنوان',
      description: snippet['description'] ?? '',
      thumbnail: snippet['thumbnails']?['high']?['url'] ?? 
                 snippet['thumbnails']?['default']?['url'] ?? '',
      channelId: snippet['channelId'] ?? '',
      channelTitle: snippet['channelTitle'] ?? '',
      publishedAt: snippet['publishedAt'] ?? '',
    );
  }
}