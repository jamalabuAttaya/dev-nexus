class LanguageCategory {
  final String name;
  final String imagePath;
  final List<String> playlistIds; 

  const LanguageCategory({
    required this.name,
    required this.imagePath,
    required this.playlistIds,
  });

  
  int get playlistsCount => playlistIds.length;
  
 
  bool get hasMultiplePlaylists => playlistIds.length > 1;
  
  
  String get primaryPlaylistId => playlistIds.first;
}