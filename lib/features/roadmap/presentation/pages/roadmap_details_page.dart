import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/roadmap_entity.dart';

class RoadmapDetailsPage extends StatelessWidget {
  final RoadmapEntity roadmap;

  const RoadmapDetailsPage({super.key, required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          roadmap.title,
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: roadmap.nodes.length,
              itemBuilder: (context, index) {
                return _buildNodeCard(context, roadmap.nodes[index], index + 1);
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
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(_getIconForRoadmap(roadmap.id), color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roadmap.title,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      roadmap.description,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 13),
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
              _buildInfoChip(icon: Icons.timelapse_rounded, label: roadmap.duration),
              const SizedBox(width: 12),
              _buildInfoChip(icon: Icons.signal_cellular_alt_rounded, label: roadmap.level),
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
        color: Colors.white.withValues(alpha: 0.2), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNodeCard(BuildContext context, RoadmapNode node, int number) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2).withValues(alpha: 0.1), 
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number', 
                style: const TextStyle(color: Color(0xFF1976D2), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(
            node.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            node.description,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          children: [
            if (node.resource != null && node.resource!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(56, 0, 16, 16),
                child: GestureDetector(
                  onTap: () async {
                    final Uri url;
                    try {
                      url = Uri.parse(node.resource!);
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('رابط غير صالح')),
                        );
                      }
                      return;
                    }
                    
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('لا يمكن فتح الرابط: ${node.resource}')),
                        );
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2).withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF1976D2).withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.link_rounded, size: 18, color: Color(0xFF1976D2)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            node.resource!,
                            style: const TextStyle(
                              color: Color(0xFF1976D2), 
                              decoration: TextDecoration.underline, 
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForRoadmap(String id) {
    switch (id.toLowerCase()) {
      case 'flutter': return Icons.flutter_dash;
      case 'frontend': return Icons.web_rounded;
      case 'backend': return Icons.storage_rounded;
      case 'android': return Icons.android_rounded;
      case 'ios': return Icons.apple_rounded;
      case 'devops': return Icons.cloud_rounded;
      case 'python': return Icons.code_rounded;
      case 'java': return Icons.code_rounded;
      case 'react': return Icons.javascript_rounded;
      case 'nodejs': return Icons.storage_rounded;
      case 'ai-data-scientist': return Icons.psychology_rounded;
      case 'cybersecurity': return Icons.security_rounded;
      case 'angular': return Icons.code_rounded;
      case 'vue': return Icons.code_rounded;
      case 'golang': return Icons.code_rounded;
      case 'rust': return Icons.code_rounded;
      case 'kubernetes': return Icons.cloud_rounded;
      case 'docker': return Icons.cloud_rounded;
      case 'aws': return Icons.cloud_rounded;
      case 'azure': return Icons.cloud_rounded;
      case 'gcp': return Icons.cloud_rounded;
      case 'qa': return Icons.bug_report_rounded;
      case 'ux-design': return Icons.design_services_rounded;
      case 'game-developer': return Icons.sports_esports_rounded;
      default: return Icons.map_rounded;
    }
  }
}