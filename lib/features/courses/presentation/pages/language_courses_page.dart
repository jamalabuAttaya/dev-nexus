import 'package:flutter/material.dart';
import '../../data/services/youtube_service.dart';
import '../../data/models/course_model.dart';
import '../widgets/course_card.dart';
import 'package:url_launcher/url_launcher.dart';

class LanguageCoursesPage extends StatelessWidget {
  final String languageName;
  final String playlistId; 

  const LanguageCoursesPage({
    super.key,
    required this.languageName,
    required this.playlistId, 
  });

  @override
  Widget build(BuildContext context) {
    
    final YouTubeService youtubeService = YouTubeService();

    return Scaffold(
      appBar: AppBar(
        title: Text('كورسات $languageName'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<List<CourseModel>>(
        
        future: youtubeService.fetchPlaylistVideos(playlistId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'حدث خطأ في جلب البيانات: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final courses = snapshot.data ?? [];

          if (courses.isEmpty) {
            return const Center(child: Text('لا توجد فيديوهات في هذه القائمة'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final courseData = courses[index]; 
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () async {
                    
                    final url = Uri.parse('https://www.youtube.com/watch?v=${courseData.id}');
                    try {
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    } catch (e) {
                     
                      if (!context.mounted) return;
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تعذر فتح الرابط: $e')),
                      );
                    }
                  },
                  child: CourseCard(item: courseData), 
                ),
              );
            },
          );
        },
      ),
    );
  }
}