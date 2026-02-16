import 'package:flutter/material.dart';
import 'language_courses_page.dart';
import '../../data/models/course_model.dart';


class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
         
          _buildHeader(context),
          
          
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                 //  Programming Languages Courses
const _CourseGridSection(
  title: 'Programming Languages Courses',
  languages: [
    LanguageCategory(
      name: 'Java', 
      imagePath: 'assets/image/logo.png', 
      channelId: 'UCa--uYErOqjm8qT576P1hMQ', 
    ),
    LanguageCategory(
      name: 'Kotlin', 
      imagePath: 'assets/image/logo.png', 
      channelId: 'UCnDAXfhnL5j-KhHc1KhvXHw',
    ),
    LanguageCategory(
      name: 'Python', 
      imagePath: 'assets/image/logo.png', 
      channelId: 'UCSNkfKl4cU-55Nm-ovsvOHQ', 
    ),
  ],
),

//  Mobile Application Development
const _CourseGridSection(
  title: 'Mobile Application Development',
  languages: [
    LanguageCategory(
      name: 'Flutter', 
      imagePath: 'assets/image/logo.png', 
      channelId: 'UCwXdFgeE9KYzlDdR7TG9cMw', 
    ),
    LanguageCategory(
      name: 'Android Studio', 
      imagePath: 'assets/image/logo.png', 
      channelId: 'UCv6GvH6nN36VfM1S8C-T-5Q', 
    ),
  ],

),
                  _CourseGridSection(
                    title: 'Web Design & Development',
                    languages: [
                      LanguageCategory(name: 'ASP.NET', imagePath: 'assets/image/logo.png', channelId: 'UCyY8Q5uY9Nqz9j4YJp3xK6A'),
                      LanguageCategory(name: 'HTML& CSS & JavaScript', imagePath: 'assets/image/logo.png', channelId: 'UCSNkfKl4cU-55Nm-ovsvOHQ'),
                    ],
                  ),
                  SizedBox(height: 40), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // بناء الهيدر المتدرج
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1976D2), Color(0xFF64B5F6)], // تدرج أزرق احترافي
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const Text(
                    'Dev Nexus Academy',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {}, 
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavIcon(context, Icons.play_circle_fill, 'Courses', true, '/courses'),
                _buildNavIcon(context, Icons.map_outlined, 'Roadmaps', false, '/roadmaps'),
                _buildNavIcon(context, Icons.menu_book_outlined, 'Library', false, '/library'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(BuildContext context, IconData icon, String label, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white60, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}


class _CourseGridSection extends StatelessWidget {
  final String title;
  final List<LanguageCategory> languages;
  const _CourseGridSection({required this.title, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: languages.length,
          itemBuilder: (context, index) => _CourseGridCard(language: languages[index]),
        ),
      ],
    );
  }
}

// (Card Design)
class _CourseGridCard extends StatelessWidget {
  final LanguageCategory language;
  const _CourseGridCard({required this.language});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguageCoursesPage(
              languageName: language.name,
              channelId: language.channelId,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              language.imagePath,
              height: 55,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.code, size: 50, color: Colors.blueGrey),
            ),
            const SizedBox(height: 12),
            Text(
              language.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}