import 'package:flutter/material.dart';
import 'playlist_videos_page.dart'; 

class PlaylistsListPage extends StatelessWidget {
  final String languageName;
  final List<String> playlistIds;

  const PlaylistsListPage({
    super.key,
    required this.languageName,
    required this.playlistIds,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قوائم تشغيل $languageName'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: playlistIds.length,
        itemBuilder: (context, index) {
          return _buildPlaylistCard(
            context,
            playlistIndex: index + 1,
            playlistId: playlistIds[index],
          );
        },
      ),
    );
  }

  Widget _buildPlaylistCard(BuildContext context, {required int playlistIndex, required String playlistId}) {
    final playlistTitles = {
      1: 'مبتدئين',
      2: 'متوسط',
      3: 'متقدم',
      4: 'مشاريع عملية',
      5: 'مفاهيم متقدمة',
    };

    final playlistDescriptions = {
      1: 'تعلم الأساسيات خطوة بخطوة',
      2: 'مفاهيم متوسطة مع تطبيقات عملية',
      3: 'مفاهيم متقدمة للمحترفين',
      4: 'مشاريع كاملة مع الشرح',
      5: 'مواضيع متخصصة وعميقة',
    };

    final playlistIcons = {
      1: Icons.school_rounded,
      2: Icons.trending_up_rounded,
      3: Icons.rocket_launch_rounded,
      4: Icons.build_rounded,
      5: Icons.psychology_rounded,
    };

    final title = playlistTitles[playlistIndex] ?? 'قائمة تشغيل $playlistIndex';
    final description = playlistDescriptions[playlistIndex] ?? 'محاضرات ودروس في $languageName';
    final icon = playlistIcons[playlistIndex] ?? Icons.playlist_play_rounded;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
         
          backgroundColor: const Color(0xFF1976D2).withValues(alpha: 0.1),
          radius: 24,
          child: Icon(
            icon,
            color: const Color(0xFF1976D2),
            size: 28,
          ),
        ),
        title: Text(
          '$languageName - $title',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            description,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            
            color: const Color(0xFF1976D2).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Color(0xFF1976D2),
            size: 24,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistVideosPage(
                playlistId: playlistId,
                playlistTitle: '$languageName - $title',
              ),
            ),
          );
        },
      ),
    );
  }
}