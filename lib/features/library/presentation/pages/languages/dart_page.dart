import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DartPage extends StatelessWidget {
  const DartPage({super.key});

  Future<void> _openOfficial() async {
    final uri = Uri.parse('https://dart.dev');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: AppBar(
        title: const Text('Dart'),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dart هي لغة برمجة حديثة تم تطويرها بواسطة Google عام 2011. "
                "تم تصميمها لتكون لغة قوية وسريعة ومناسبة لبناء التطبيقات الحديثة.\n\n"
                "أصبحت Dart مشهورة عالميًا بعد استخدامها كلغة أساسية في Flutter، "
                "حيث تُستخدم لبناء تطبيقات الموبايل والويب وسطح المكتب.\n\n"
                "تدعم Dart البرمجة الكائنية (OOP)، "
                "وتتميز بسهولة القراءة والتنظيم، "
                "مما يجعلها مناسبة للمبتدئين والمحترفين.\n\n"
                "توفر Dart نظام ترجمة سريع أثناء التطوير، "
                "وأداء عالي عند تشغيل التطبيق في الإنتاج.\n\n"
                "بفضل دعم Google المستمر، "
                "أصبحت Dart من اللغات المهمة في عالم تطوير التطبيقات الحديثة.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _openOfficial,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "اضغط للحصول على المزيد من المعلومات حول Dart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
