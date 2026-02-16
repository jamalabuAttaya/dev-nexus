import 'dart:convert';
import 'package:http/http.dart' as http;

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
        print('YouTube API Error: ${errorData['error']['message']}');
        throw Exception('YouTube Error: ${errorData['error']['message']}');
      }
    } catch (e) {
      print('Network Error: $e');
      throw Exception('Network or Server Error: $e');
    }
  }
}
