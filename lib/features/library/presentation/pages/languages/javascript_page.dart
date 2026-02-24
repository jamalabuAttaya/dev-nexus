import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JavaScriptPage extends StatelessWidget {
  const JavaScriptPage({super.key});

  Future<void> _openOfficial() async {
    final uri =
        Uri.parse('https://developer.mozilla.org/en-US/docs/Web/JavaScript');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: AppBar(
        title: const Text('JavaScript'),
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
                "JavaScript هي لغة برمجة أساسية في تطوير الويب، "
                "تم تطويرها عام 1995 لجعل صفحات الإنترنت تفاعلية.\n\n"
                "تُستخدم JavaScript لإضافة الحركة والتفاعل مع المستخدم "
                "وتحديث محتوى الصفحة دون إعادة تحميلها.\n\n"
                "اليوم تُستخدم JavaScript في الواجهة الأمامية "
                "باستخدام أطر مثل React وVue، "
                "كما تُستخدم في الخلفية عبر Node.js.\n\n"
                "تُعتبر JavaScript حجر الأساس في تطوير الويب الحديث، "
                "ولا يمكن بناء تطبيق ويب متكامل بدونها.\n\n"
                "بفضل مجتمعها الضخم وتطورها المستمر، "
                "أصبحت من أكثر اللغات استخدامًا عالميًا.",
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
                      "اضغط للحصول على المزيد من المعلومات حول JavaScript",
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
