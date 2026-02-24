import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';

class LangPlaceholderPage extends StatelessWidget {
  final String title;
  const LangPlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: const DfTopNav(currentIndex: 2),
      body: Center(
        child: Text(
          "سيتم إضافة محتوى $title لاحقًا",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
