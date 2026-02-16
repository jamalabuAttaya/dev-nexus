import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../../data/models/course_model.dart';
import '../pages/language_courses_page.dart';

class CoursesSection extends StatelessWidget {
  final String title;
  final List<CourseModel> items;

  const CoursesSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LanguageCoursesPage(
                          languageName: item.title,
                          channelId: item.channelTitle,
                        ),
                      ),
                    );
                  },
                  child: CourseCard(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
