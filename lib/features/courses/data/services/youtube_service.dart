import 'dart:convert';
import 'package:flutter/foundation.dart'; 
import 'package:http/http.dart' as http;
import '../models/course_model.dart';

class YouTubeService {
  static const String apiKey = 'AIzaSyCcigUKtYD-iaMaa-E7HrjwkIcuKUcUUbc';

  
  Future<List<Map<String, dynamic>>> fetchPlaylists({required String channelId}) async {
    final url = 'https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=$channelId&maxResults=20&key=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List items = data['items'] ?? [];
        return List<Map<String, dynamic>>.from(items);
      } else {
        final errorData = json.decode(response.body);
        
        debugPrint('YouTube API Error: ${errorData['error']['message']}');
        throw Exception('YouTube Error: ${errorData['error']['message']}');
      }
    } catch (e) {
      debugPrint('Network Error: $e');
      throw Exception('Network or Server Error: $e');
    }
  }

  
  Future<List<CourseModel>> fetchPlaylistVideos(String playlistId) async {
    final url = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&maxResults=50&key=$apiKey';
    
    try {
      debugPrint(' Fetching videos from playlist: $playlistId');
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List items = data['items'] ?? [];
        
        debugPrint('Found ${items.length} videos in playlist');
        
        return items.map((item) => CourseModel.fromYouTubeItem(item)).toList();
      } else {
        final errorData = json.decode(response.body);
        debugPrint(' YouTube API Error: ${errorData['error']['message']}');
        throw Exception('YouTube Error: ${errorData['error']['message']}');
      }
    } catch (e) {
      debugPrint(' Network Error: $e');
      throw Exception('Network or Server Error: $e');
    }
  }

  
  Future<Map<String, String>> getPlaylistDetails(String playlistId) async {
    final url = 'https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=$playlistId&key=$apiKey';
    
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] ?? [];
        
        if (items.isNotEmpty) {
          final snippet = items[0]['snippet'] ?? {};
          return {
            'title': snippet['title'] ?? 'قائمة تشغيل',
            'description': snippet['description'] ?? '',
            'channelTitle': snippet['channelTitle'] ?? '',
          };
        }
      }
    } catch (e) {
      debugPrint('Error fetching playlist details: $e');
    }
    
    return {
      'title': 'قائمة تشغيل',
      'description': '',
      'channelTitle': '',
    };
  }
}