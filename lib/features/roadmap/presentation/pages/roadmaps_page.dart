import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/repositories/roadmap_repository_impl.dart';
import '../../data/services/roadmap_api_service.dart';
import '../../data/services/roadmap_local_service.dart';
import '../../domain/entities/roadmap_summary_entity.dart';
import 'package:dev_nexus/features/settings/presentation/pages/about_page.dart';

class RoadmapsPage extends StatefulWidget {
  const RoadmapsPage({super.key});

  @override
  State<RoadmapsPage> createState() => _RoadmapsPageState();
}

class _RoadmapsPageState extends State<RoadmapsPage> {
  late final RoadmapRepositoryImpl _repository;
  late Future<List<RoadmapSummaryEntity>> _roadmapsFuture;
  
  final TextEditingController _searchController = TextEditingController();
  List<RoadmapSummaryEntity> _allRoadmaps = [];
  List<RoadmapSummaryEntity> _filteredRoadmaps = [];

  final List<String> _mainCategories = [
    'Role Based Roadmaps',
    'Skill Based Roadmaps',
    'Absolute Beginners',
    'Best Practices',
    'Project Ideas',
  ];

  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _repository = RoadmapRepositoryImpl(
      api: RoadmapApiService(),
      local: RoadmapLocalService(),
    );
    _loadData();
  }

  void _loadData() {
    _roadmapsFuture = _repository.getAllRoadmaps().then((data) {
      if (mounted) {
        setState(() {
          _allRoadmaps = data;
          _filteredRoadmaps = data;
        });
      }
      return data;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredRoadmaps = _allRoadmaps
          .where((roadmap) =>
              roadmap.title.toLowerCase().contains(query.toLowerCase()) ||
              roadmap.id.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Map<String, List<RoadmapSummaryEntity>> _categorizeRoadmaps(
      List<RoadmapSummaryEntity> roadmaps) {
    final Map<String, List<RoadmapSummaryEntity>> categorized = {};

    for (var category in _mainCategories) {
      categorized[category] = [];
    }

    for (var roadmap in roadmaps) {
      final id = roadmap.id.toLowerCase();

      if ([
        'frontend', 'backend', 'full-stack', 'devops', 'devsecops',
        'data-analyst', 'ai-engineer', 'ai-data-scientist', 'data-engineer',
        'android', 'machine-learning', 'postgresql-dba', 'ios', 'blockchain',
        'qa', 'software-architect', 'cyber-security', 'ux-design',
        'technical-writer', 'game-developer', 'server-side-game-developer',
        'mlops', 'product-manager', 'engineering-manager', 'devrel',
        'bi-analyst', 'ai-red-teaming', 'api-design'
      ].contains(id)) {
        categorized['Role Based Roadmaps']!.add(roadmap);
      } 
      else if ([
        'sql', 'computer-science', 'react', 'vue', 'angular',
        'javascript', 'typescript', 'node.js', 'python', 'system-design',
        'java', 'asp.net-core', 'spring-boot', 'flutter', 'c++',
        'rust', 'go', 'design-architecture', 'graphql', 'react-native',
        'design-system', 'prompt-engineering', 'mongodb', 'linux',
        'kubernetes', 'docker', 'aws', 'terraform',
        'data-structures-algorithms', 'redis', 'git-github', 'php',
        'cloudflare', 'ai-agents', 'next.js', 'kotlin', 'html', 'css',
        'swift', 'shell-bash', 'laravel', 'elasticsearch', 'wordpress',
        'django', 'ruby', 'ruby-on-rails', 'claude-code', 'vibe-coding',
        'postgresql'
      ].contains(id)) {
        categorized['Skill Based Roadmaps']!.add(roadmap);
      }
      else if ([
        'frontend-beginner', 'backend-beginner', 'devops-beginner',
        'git-github-beginner'
      ].contains(id)) {
        categorized['Absolute Beginners']!.add(roadmap);
      }
      else if ([
        'aws-best-practices', 'api-security', 'backend-performance',
        'frontend-performance', 'code-review'
      ].contains(id)) {
        categorized['Best Practices']!.add(roadmap);
      }
      else if ([
        'project-ideas-frontend', 'project-ideas-backend',
        'project-ideas-devops'
      ].contains(id)) {
        categorized['Project Ideas']!.add(roadmap);
      }
      else {
        categorized['Project Ideas']!.add(roadmap);
      }
    }
    return categorized;
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
            child: FutureBuilder<List<RoadmapSummaryEntity>>(
              future: _roadmapsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline_rounded, size: 60, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text('حدث خطأ: ${snapshot.error}'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => setState(() => _loadData()),
                          child: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                final categorized = _categorizeRoadmaps(_filteredRoadmaps);

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            hintText: '🔍 Search roadmaps...',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: _searchController.text.isNotEmpty 
                                ? IconButton(
                                    icon: const Icon(Icons.clear), 
                                    onPressed: () {
                                      _searchController.clear();
                                      _onSearchChanged('');
                                    }) 
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),

                      if (_filteredRoadmaps.isEmpty)
                        const Center(child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text('لا توجد نتائج مطابقة لبحثك'),
                        ))
                      else
                        ...categorized.entries.map((entry) {
                          final category = entry.key;
                          final roadmaps = entry.value;

                          if (roadmaps.isEmpty) return const SizedBox.shrink();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: _getCategoryColor(category),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      category,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1A2E44),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _getCategoryColor(category).withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '${roadmaps.length}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: _getCategoryColor(category),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildCategoryGrid(roadmaps),
                              const SizedBox(height: 24),
                            ],
                          );
                        })
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

 
  Widget _buildHeader() {
    return Container(
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
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search_rounded, color: Colors.white, size: 26),
                  const Text(
                    'Dev Nexus Academy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 26),
                    onPressed: () {
                      
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavIcon(
                    Icons.play_circle_fill,
                    'Courses',
                    false,
                    '/courses',
                  ),
                  _buildNavIcon(
                    Icons.map_rounded,
                    'Roadmaps',
                    true,
                    '/roadmaps',
                  ),
                  _buildNavIcon(
                    Icons.menu_book_rounded,
                    'Library',
                    false,
                    '/library',
                  ),
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
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive ? const Color(0xFF1976D2) : Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(List<RoadmapSummaryEntity> roadmaps) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: roadmaps.length,
      itemBuilder: (context, index) {
        return _buildRoadmapCard(roadmaps[index]);
      },
    );
  }

  Widget _buildRoadmapCard(RoadmapSummaryEntity roadmap) {
    return GestureDetector(
      onTap: () => _openRoadmapLink(roadmap.id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
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
                color: _getColorForRoadmap(roadmap.id).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForRoadmap(roadmap.id),
                color: _getColorForRoadmap(roadmap.id),
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                roadmap.title,
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
                color: _getColorForRoadmap(roadmap.id).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                roadmap.level ?? 'All Levels',
                style: TextStyle(
                  fontSize: 10,
                  color: _getColorForRoadmap(roadmap.id),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openRoadmapLink(String id) async {
    String urlString;
    
    // خريطة الروابط الخاصة
    switch (id) {
      case 'cyber-security':
        urlString = 'https://roadmap.sh/cyber-security';
        break;
      case 'devrel': 
        urlString = 'https://roadmap.sh/devrel';
        break;
      case 'swift': 
        urlString = 'https://roadmap.sh/swift-ui';
        break;
      case 'cpp':
        urlString = 'https://roadmap.sh/cpp';
        break;
      case 'golang':
        urlString = 'https://roadmap.sh/golang';
        break;
      case 'aspnet-core':
        urlString = 'https://roadmap.sh/aspnet-core';
        break;
      case 'datastructures-and-algorithms':
        urlString = 'https://roadmap.sh/datastructures-and-algorithms';
        break;
      case 'software-design-architecture':
        urlString = 'https://roadmap.sh/software-design-architecture';
        break;
      case 'nextjs':
        urlString = 'https://roadmap.sh/nextjs';
        break;
      default:
        urlString = 'https://roadmap.sh/$id';
    }
    
    debugPrint('🌐 Opening roadmap: $urlString');
    
    try {
      final url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('لا يمكن فتح الرابط'), backgroundColor: Colors.red),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Role Based Roadmaps': return Colors.blue;
      case 'Skill Based Roadmaps': return Colors.green;
      case 'Absolute Beginners': return Colors.purple;
      case 'Best Practices': return Colors.orange;
      case 'Project Ideas': return Colors.teal;
      default: return Colors.grey;
    }
  }

  Color _getColorForRoadmap(String id) {
    switch (id) {
      case 'frontend': return Colors.orange;
      case 'backend': return Colors.green;
      case 'full-stack': return Colors.purple;
      case 'devops': return Colors.purple;
      case 'devsecops': return Colors.red;
      case 'data-analyst': return const Color(0xFF43A047);
      case 'ai-engineer': return const Color(0xFF7B68EE);
      case 'ai-data-scientist': return const Color(0xFF9C27B0);
      case 'data-engineer': return const Color(0xFF1E88E5);
      case 'android': return Colors.teal;
      case 'machine-learning': return const Color(0xFFFF6F00);
      case 'postgresql-dba': return const Color(0xFF336791);
      case 'ios': return Colors.grey[800]!;
      case 'blockchain': return const Color(0xFF3D3D3D);
      case 'qa': return Colors.indigo;
      case 'software-architect': return Colors.brown;
      case 'cyber-security': return Colors.red; 
      case 'ux-design': return const Color(0xFFFF4081);
      case 'technical-writer': return Colors.blueGrey;
      case 'game-developer': return const Color(0xFFD32F2F);
      case 'server-side-game-developer': return const Color(0xFFD32F2F);
      case 'mlops': return const Color(0xFF00ACC1);
      case 'product-manager': return Colors.amber;
      case 'engineering-manager': return Colors.deepPurple;
      case 'devrel': return Colors.lightBlue;
      case 'bi-analyst': return const Color(0xFF2E7D32);
      case 'ai-red-teaming': return Colors.redAccent;
      case 'api-design': return Colors.deepOrange;
      case 'sql': return const Color(0xFF4479A1);
      case 'computer-science': return Colors.indigo;
      case 'react': return const Color(0xFF61DAFB);
      case 'vue': return const Color(0xFF42B883);
      case 'angular': return const Color(0xFFDD0031);
      case 'javascript': return const Color(0xFFF7DF1E);
      case 'typescript': return const Color(0xFF3178C6);
      case 'node.js': return const Color(0xFF339933);
      case 'python': return const Color(0xFF3776AB);
      case 'system-design': return Colors.brown;
      case 'java': return const Color(0xFF007396);
      case 'aspnet-core': return const Color(0xFF512BD4); 
      case 'spring-boot': return const Color(0xFF6DB33F);
      case 'flutter': return Colors.blue;
      case 'cpp': return const Color(0xFF00599C); 
      case 'rust': return const Color(0xFFDEA584);
      case 'golang': return const Color(0xFF00ADD8); 
      case 'software-design-architecture': return Colors.pink; 
      case 'graphql': return const Color(0xFFE10098);
      case 'react-native': return const Color(0xFF61DAFB);
      case 'design-system': return Colors.amber;
      case 'prompt-engineering': return Colors.deepPurple;
      case 'mongodb': return const Color(0xFF47A248);
      case 'linux': return const Color(0xFFFCC624);
      case 'kubernetes': return const Color(0xFF326CE5);
      case 'docker': return const Color(0xFF2496ED);
      case 'aws': return const Color(0xFFFF9900);
      case 'terraform': return const Color(0xFF7B42BC);
      case 'datastructures-and-algorithms': return Colors.blueGrey; 
      case 'redis': return const Color(0xFFDC382D);
      case 'git-github': return Colors.black;
      case 'php': return const Color(0xFF777BB4);
      case 'cloudflare': return const Color(0xFFF38020);
      case 'ai-agents': return const Color(0xFF9C27B0);
      case 'nextjs': return Colors.black;
      case 'kotlin': return const Color(0xFF7F52FF);
      case 'html': return const Color(0xFFE34F26);
      case 'css': return const Color(0xFF1572B6);
      case 'swift': return const Color(0xFFF05138);
      case 'shell-bash': return const Color(0xFF4EAA25);
      case 'laravel': return const Color(0xFFFF2D20);
      case 'elasticsearch': return const Color(0xFF005571);
      case 'wordpress': return const Color(0xFF21759B);
      case 'django': return const Color(0xFF092E20);
      case 'ruby': return const Color(0xFFCC342D);
      case 'ruby-on-rails': return const Color(0xFFCC0000);
      case 'claude-code': return const Color(0xFF7F52FF);
      case 'vibe-coding': return Colors.pink;
      case 'postgresql': return const Color(0xFF336791);
      case 'aws-best-practices': return const Color(0xFFFF9900);
      case 'api-security': return Colors.deepOrange;
      case 'backend-performance': return Colors.green;
      case 'frontend-performance': return Colors.orange;
      case 'code-review': return Colors.blue;
      case 'project-ideas-frontend': return Colors.orange;
      case 'project-ideas-backend': return Colors.green;
      case 'project-ideas-devops': return Colors.purple;
      default: return const Color(0xFF1976D2);
    }
  }

  IconData _getIconForRoadmap(String id) {
    switch (id) {
      case 'frontend': return Icons.web_rounded;
      case 'backend': return Icons.storage_rounded;
      case 'full-stack': return Icons.layers_rounded;
      case 'devops': return Icons.cloud_rounded;
      case 'android': return Icons.android_rounded;
      case 'ios': return Icons.apple_rounded;
      case 'flutter': return Icons.flutter_dash;
      case 'python': return Icons.code_rounded;
      case 'java': return Icons.code_rounded;
      case 'javascript': return Icons.javascript_rounded;
      case 'typescript': return Icons.code_rounded;
      case 'react': return Icons.javascript_rounded;
      case 'vue': return Icons.code_rounded;
      case 'angular': return Icons.code_rounded;
      case 'node.js': return Icons.storage_rounded;
      case 'docker': return Icons.cloud_rounded;
      case 'kubernetes': return Icons.cloud_rounded;
      case 'aws': return Icons.cloud_rounded;
      case 'cyber-security': return Icons.security_rounded; 
      case 'ai-engineer': return Icons.psychology_rounded;
      case 'machine-learning': return Icons.psychology_rounded;
      case 'data-analyst': return Icons.analytics_rounded;
      case 'qa': return Icons.bug_report_rounded;
      case 'ux-design': return Icons.design_services_rounded;
      case 'game-developer': return Icons.sports_esports_rounded;
      case 'git-github': return Icons.code_rounded;
      case 'html': return Icons.code_rounded;
      case 'css': return Icons.palette_rounded;
      case 'swift': return Icons.code_rounded;
      case 'kotlin': return Icons.code_rounded;
      case 'php': return Icons.code_rounded;
      case 'ruby': return Icons.code_rounded;
      case 'aws-best-practices': return Icons.cloud_rounded;
      case 'api-security': return Icons.security_rounded;
      case 'backend-performance': return Icons.speed_rounded;
      case 'frontend-performance': return Icons.speed_rounded;
      case 'code-review': return Icons.rate_review_rounded;
      case 'project-ideas-frontend': return Icons.lightbulb_rounded;
      case 'project-ideas-backend': return Icons.lightbulb_rounded;
      case 'project-ideas-devops': return Icons.lightbulb_rounded;
      default: return Icons.map_rounded;
    }
  }
}