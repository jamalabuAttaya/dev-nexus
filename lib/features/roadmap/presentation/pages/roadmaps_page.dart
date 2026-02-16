import 'package:flutter/material.dart';

class RoadmapsPage extends StatelessWidget {
  const RoadmapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: AppBar(
        title: const Text('Learning Roadmaps', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(child: Text("خرائط التعلم ستظهر هنا")),
    );
  }
}