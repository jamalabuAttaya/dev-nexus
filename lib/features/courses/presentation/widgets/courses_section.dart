import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../../data/models/course_model.dart';
import '../pages/language_courses_page.dart';
import '../../data/models/language_category.dart';
import '../pages/channels_list_page.dart'; 

class CoursesSection extends StatelessWidget {
  final String title;
  final List<LanguageCategory> categories; 

  const CoursesSection({
    super.key, 
    required this.title, 
    required this.categories, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title, 
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length, 
              itemBuilder: (context, index) {
                final category = categories[index]; 
                
                return GestureDetector(
                  onTap: () {
                  
                    if (category.playlistIds.length > 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChannelsListPage( 
                            languageName: category.name,
                            playlistIds: category.playlistIds,
                          ),
                        ),
                      );
                    } else {
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LanguageCoursesPage(
                            languageName: category.name,
                            playlistId: category.playlistIds.first,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 160, 
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        
                        Expanded(
                          child: CourseCard(
                            item: CourseModel(
                              id: category.playlistIds.first,
                              title: category.name,
                              description: '',
                              thumbnail: category.imagePath,
                              channelId: '',
                              channelTitle: '',
                              publishedAt: '',
                            ),
                          ),
                        ),
                        
                        if (category.playlistIds.length > 1)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              
                              color: const Color(0xFF1976D2).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.playlist_play,
                                  size: 12,
                                  color: Color(0xFF1976D2),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '+${category.playlistIds.length - 1}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF1976D2),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}