import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_LangItem>[
      _LangItem(title: 'Java', icon: Icons.coffee, route: '/java'),
      _LangItem(title: 'Kotlin', icon: Icons.android, route: '/kotlin'),
      _LangItem(title: 'Python', icon: Icons.code, route: '/python'),
      _LangItem(title: 'Dart', icon: Icons.flutter_dash, route: '/dart'),
      _LangItem(
          title: 'Flutter', icon: Icons.mobile_friendly, route: '/flutter'),
      _LangItem(title: 'HTML', icon: Icons.language, route: '/html'),
      _LangItem(
          title: 'JavaScript', icon: Icons.javascript, route: '/javascript'),
      _LangItem(title: 'C#', icon: Icons.tag, route: '/csharp'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: const DfTopNav(currentIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ✅ كل اثنين جنب بعض
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _LangCard(
              title: item.title,
              icon: item.icon,
              onTap: () {
                // مؤقتًا: لو ما عندك routes لهالصفحات، بنعرض رسالة
                Navigator.pushNamed(context, item.route);
              },
            );
          },
        ),
      ),
    );
  }
}

class _LangItem {
  final String title;
  final IconData icon;
  final String route;

  _LangItem({required this.title, required this.icon, required this.route});
}

class _LangCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _LangCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF1976D2)),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
