import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailsPage extends StatefulWidget {
  final String playlistUrl;
  const CourseDetailsPage({super.key, required this.playlistUrl});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // استخراج ID قائمة التشغيل أو الفيديو من الرابط
    String? videoId = YoutubePlayer.convertUrlToId(widget.playlistUrl);
    
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مشاهدة الكورس")),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          // هنا يمكنك إضافة قائمة الدروس أسفل الفيديو
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}