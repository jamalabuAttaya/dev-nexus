import 'package:flutter/material.dart';

class DfTopNav extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex; // 0 Courses, 1 Roadmaps, 2 Library

  const DfTopNav({super.key, required this.currentIndex});

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(bottom: 18),
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
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    const Spacer(),
                    const Text(
                      'Digital Libraries',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _NavItem(
                    icon: Icons.play_circle_fill,
                    label: 'Courses',
                    active:
                        false, // نخليه false هنا، والـ active حسب currentIndex
                    isActive: false,
                    currentIndex: 0,
                    selectedIndex: currentIndex,
                    route: '/courses',
                  ),
                  _NavItem(
                    icon: Icons.map_outlined,
                    label: 'Roadmaps',
                    active: false,
                    isActive: false,
                    currentIndex: 1,
                    selectedIndex: currentIndex,
                    route: '/roadmaps',
                  ),
                  _NavItem(
                    icon: Icons.menu_book_outlined,
                    label: 'Library',
                    active: false,
                    isActive: false,
                    currentIndex: 2,
                    selectedIndex: currentIndex,
                    route: '/library',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  final int currentIndex;
  final int selectedIndex;

  // هذه 3 متغيرات موجودة فقط لتجنب كسر الكود (ممكن نحذفهم لاحقًا)
  final bool active;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentIndex,
    required this.selectedIndex,
    required this.active,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = (currentIndex == selectedIndex);

    return GestureDetector(
      onTap: () {
        if (!selected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : Colors.white60,
            size: selected ? 30 : 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
