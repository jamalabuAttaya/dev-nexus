import 'package:flutter/material.dart';
import '../../data/services/roadmap_service.dart';
import '../../domain/entities/roadmap_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class RoadmapsPage extends StatefulWidget {
  const RoadmapsPage({super.key});

  @override
  State<RoadmapsPage> createState() => _RoadmapsPageState();
}

class _RoadmapsPageState extends State<RoadmapsPage> {
  final RoadmapService _roadmapService = RoadmapService();
  late Future<List<Map<String, dynamic>>> _roadmapsFuture;

  @override
  void initState() {
    super.initState();
    _roadmapsFuture = _roadmapService.fetchAllRoadmaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _roadmapsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF1976D2),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 60,
                          color: Colors.red[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'حدث خطأ في تحميل الخرائط',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          snapshot.error.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _roadmapsFuture = _roadmapService.fetchAllRoadmaps();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1976D2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                final roadmaps = snapshot.data ?? [];
                
                if (roadmaps.isEmpty) {
                  return const Center(
                    child: Text('لا توجد خرائط متاحة حالياً'),
                  );
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Developer Roadmaps (${roadmaps.length})'),
                      const SizedBox(height: 16),
                      _buildRoadmapGrid(roadmaps),
                      const SizedBox(height: 24),
                      _buildSectionTitle('Popular Paths'),
                      const SizedBox(height: 16),
                      _buildPopularRoadmaps(roadmaps.take(4).toList()),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.map_rounded, color: Colors.white, size: 28),
                  const Text(
                    'Learning Paths',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh_rounded, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _roadmapsFuture = _roadmapService.fetchAllRoadmaps();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavIcon(Icons.play_circle_fill, 'Courses', false, '/courses'),
                  _buildNavIcon(Icons.map_rounded, 'Roadmaps', true, '/roadmaps'),
                  _buildNavIcon(Icons.menu_book_rounded, 'Library', false, '/library'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, String label, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.white60,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A2E44),
        ),
      ),
    );
  }

  Widget _buildRoadmapGrid(List<Map<String, dynamic>> roadmaps) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: roadmaps.length,
      itemBuilder: (context, index) {
        final roadmap = roadmaps[index];
        return _buildRoadmapCard(
          id: roadmap['id'] ?? '',
          title: roadmap['title'] ?? 'Unknown',
          description: roadmap['description'] ?? '',
        );
      },
    );
  }

  Widget _buildRoadmapCard({
    required String id,
    required String title,
    required String description,
  }) {
    // ألوان مختلفة لكل خريطة
    final Color cardColor = _getColorForRoadmap(id);
    
    return GestureDetector(
      onTap: () async {
        // عرض مؤشر تحميل
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: Color(0xFF1976D2)),
          ),
        );

        try {
          // جلب تفاصيل الخريطة
          final roadmapDetail = await _roadmapService.fetchRoadmapDetail(id);
          
          // إغلاق مؤشر التحميل
          if (context.mounted) Navigator.pop(context);
          
          // التنقل لصفحة التفاصيل
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoadmapDetailsPage(roadmap: roadmapDetail),
              ),
            );
          }
        } catch (e) {
          if (context.mounted) {
            Navigator.pop(context); // إغلاق مؤشر التحميل
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('فشل تحميل تفاصيل الخريطة: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForRoadmap(id),
                color: cardColor,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getLevelForRoadmap(id),
                style: TextStyle(
                  fontSize: 10,
                  color: cardColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularRoadmaps(List<Map<String, dynamic>> roadmaps) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: roadmaps.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final roadmap = roadmaps[index];
        return _buildPopularCard(
          id: roadmap['id'] ?? '',
          title: roadmap['title'] ?? 'Unknown',
          description: roadmap['description'] ?? '',
        );
      },
    );
  }

  Widget _buildPopularCard({
    required String id,
    required String title,
    required String description,
  }) {
    final Color cardColor = _getColorForRoadmap(id);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: cardColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            _getIconForRoadmap(id),
            color: cardColor,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description.length > 40 
              ? '${description.substring(0, 40)}...' 
              : description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cardColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: cardColor,
            size: 16,
          ),
        ),
        onTap: () async {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1976D2)),
            ),
          );

          try {
            final roadmapDetail = await _roadmapService.fetchRoadmapDetail(id);
            if (context.mounted) Navigator.pop(context);
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoadmapDetailsPage(roadmap: roadmapDetail),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('فشل تحميل التفاصيل: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
      ),
    );
  }

  // دوال مساعدة للألوان والأيقونات
  Color _getColorForRoadmap(String id) {
    switch (id.toLowerCase()) {
      case 'flutter':
        return Colors.blue;
      case 'frontend':
        return Colors.orange;
      case 'backend':
        return Colors.green;
      case 'devops':
        return Colors.purple;
      case 'android':
        return Colors.teal;
      case 'ios':
        return Colors.grey[800]!;
      case 'python':
        return const Color(0xFF3776AB);
      case 'java':
        return const Color(0xFF007396);
      case 'react':
        return const Color(0xFF61DAFB);
      case 'nodejs':
        return const Color(0xFF339933);
      case 'ai':
      case 'machine-learning':
        return Colors.deepPurple;
      case 'cybersecurity':
        return Colors.red;
      default:
        return const Color(0xFF1976D2);
    }
  }

  IconData _getIconForRoadmap(String id) {
    switch (id.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'frontend':
        return Icons.web_rounded;
      case 'backend':
        return Icons.storage_rounded;
      case 'devops':
        return Icons.cloud_rounded;
      case 'android':
        return Icons.android_rounded;
      case 'ios':
        return Icons.apple_rounded;
      case 'python':
      case 'java':
      case 'react':
      case 'nodejs':
        return Icons.code_rounded;
      case 'ai':
      case 'machine-learning':
        return Icons.psychology_rounded;
      case 'cybersecurity':
        return Icons.security_rounded;
      default:
        return Icons.map_rounded;
    }
  }

  String _getLevelForRoadmap(String id) {
    switch (id.toLowerCase()) {
      case 'flutter':
      case 'frontend':
      case 'android':
      case 'python':
        return 'Beginner to Expert';
      case 'backend':
      case 'devops':
        return 'Intermediate to Expert';
      case 'ai':
      case 'machine-learning':
        return 'Advanced';
      default:
        return 'All Levels';
    }
  }
}

 

class RoadmapDetailsPage extends StatelessWidget {
  final RoadmapEntity roadmap;

  const RoadmapDetailsPage({super.key, required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roadmap.title),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header مع معلومات الخريطة
          _buildHeader(),
          
          // قائمة الخطوات (Nodes)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: roadmap.nodes.length,
              itemBuilder: (context, index) {
                final node = roadmap.nodes[index];
                return _buildNodeCard(context, node, index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  _getIconForRoadmap(roadmap.id),
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roadmap.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      roadmap.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(
                icon: Icons.timelapse_rounded,
                label: roadmap.duration,
              ),
              const SizedBox(width: 12),
              _buildInfoChip(
                icon: Icons.signal_cellular_alt_rounded,
                label: roadmap.level,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildNodeCard(BuildContext context, RoadmapNode node, int number) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        // حل مشكلة الإشارة السوداء والصفراء
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          unselectedWidgetColor: const Color(0xFF1976D2),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1976D2),
          ),
        ),
        child: ExpansionTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          title: Text(
            node.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            node.description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(56, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (node.resource != null && node.resource!.isNotEmpty) ...[
                    const Text(
                      '📚 المصدر:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // ✅ الرابط يشتغل الآن
                    GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(node.resource!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, 
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('لا يمكن فتح الرابط: ${node.resource}'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1976D2).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF1976D2).withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.link_rounded,
                              size: 18,
                              color: Color(0xFF1976D2),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                node.resource!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF1976D2),
                                  decoration: TextDecoration.underline,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (node.children.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Text(
                      '🎯 الخطوات التالية:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...node.children.map((childId) => Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1976D2),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              childId,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForRoadmap(String id) {
    switch (id) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'frontend':
        return Icons.web_rounded;
      case 'backend':
        return Icons.storage_rounded;
      case 'android':
        return Icons.android_rounded;
      case 'ios':
        return Icons.apple_rounded;
      case 'devops':
        return Icons.cloud_rounded;
      case 'python':
        return Icons.code_rounded;
      default:
        return Icons.map_rounded;
    }
  }
}