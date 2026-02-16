import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: AppBar(
        title: const Text('Digital Library', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(child: Text("محتوى المكتبة الرقمية سيظهر هنا")),
    );
  }
}