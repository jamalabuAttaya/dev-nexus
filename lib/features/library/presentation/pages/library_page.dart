import 'package:flutter/material.dart';
import 'package:dev_nexus/features/settings/presentation/pages/about_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<_LangItem> _items = [
    _LangItem(title: 'Java', icon: Icons.coffee, route: '/java'),
    _LangItem(title: 'Kotlin', icon: Icons.android, route: '/kotlin'),
    _LangItem(title: 'Python', icon: Icons.code, route: '/python'),
    _LangItem(title: 'Dart', icon: Icons.flutter_dash, route: '/dart'),
    _LangItem(title: 'Flutter', icon: Icons.mobile_friendly, route: '/flutter'),
    _LangItem(title: 'HTML', icon: Icons.language, route: '/html'),
    _LangItem(title: 'JavaScript', icon: Icons.javascript, route: '/javascript'),
    _LangItem(title: 'C#', icon: Icons.tag, route: '/csharp'),
    _LangItem(title: 'C++', icon: Icons.code, route: '/cpp'),
    _LangItem(title: 'PHP', icon: Icons.code, route: '/php'),
    _LangItem(title: 'Swift', icon: Icons.apple, route: '/swift'),
    _LangItem(title: 'Go', icon: Icons.code, route: '/go'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, 
      backgroundColor: const Color(0xFFF8F9FA),
      drawer: _buildDrawer(context), 
      body: Column(
        children: [
          _buildHeader(), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return _LangCard(
                    title: item.title,
                    icon: item.icon,
                    onTap: () {
                      Navigator.pushNamed(context, item.route);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
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
                    onPressed: () {
                      
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavIcon(Icons.play_circle_fill, 'Courses', false, '/courses'),
                _buildNavIcon(Icons.map_outlined, 'Roadmaps', false, '/roadmaps'),
                _buildNavIcon(Icons.menu_book_outlined, 'Library', true, '/library'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildNavIcon(IconData icon, String label, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Column(
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white60, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            
            Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
                ),
              ),
              child: const Center(
                child: Text(
                  'Dev Nexus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            
            ListTile(
              leading: const Icon(Icons.home_rounded, color: Color(0xFF1976D2)),
              title: const Text('الرئيسية'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_circle_fill, color: Color(0xFF1976D2)),
              title: const Text('الكورسات'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/courses');
              },
            ),
            ListTile(
              leading: const Icon(Icons.map_rounded, color: Color(0xFF1976D2)),
              title: const Text('خرائط الطريق'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/roadmaps');
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_rounded, color: Color(0xFF1976D2)),
              title: const Text('المكتبة'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/library');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_rounded, color: Color(0xFF1976D2)),
              title: const Text('حول التطبيق'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_rounded, color: Color(0xFF1976D2)),
              title: const Text('مشاركة التطبيق'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('مشاركة التطبيق - قيد التطوير')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_rounded, color: Color(0xFF1976D2)),
              title: const Text('تقييم التطبيق'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تقييم التطبيق - قيد التطوير')),
                );
              },
            ),
          ],
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