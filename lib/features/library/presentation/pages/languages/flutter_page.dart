import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterPage extends StatelessWidget {
  const FlutterPage({super.key});

  Future<void> _openOfficial() async {
    final uri = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: AppBar(
        title: const Text('Flutter'),
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
                "Flutter هو إطار عمل (Framework) مفتوح المصدر تم تطويره بواسطة شركة Google "
                "لإنشاء تطبيقات متعددة المنصات من كود واحد فقط. "
                "يعتمد Flutter على لغة Dart لبناء واجهات مستخدم حديثة وسريعة الأداء.\n\n"
                "تم إطلاق Flutter رسميًا عام 2017، "
                "ومنذ ذلك الوقت أصبح من أكثر التقنيات انتشارًا في تطوير تطبيقات الهواتف الذكية. "
                "يسمح ببناء تطبيقات Android وiOS "
                "بالإضافة إلى تطبيقات الويب وسطح المكتب.\n\n"
                "يعتمد Flutter على نظام Widgets، "
                "حيث يتم بناء كل جزء من التطبيق باستخدام مكونات قابلة لإعادة الاستخدام. "
                "وهذا يمنح المطور تحكمًا كاملًا في تصميم الواجهة.\n\n"
                "من أهم ميزاته ميزة Hot Reload، "
                "التي تسمح برؤية التعديلات مباشرة أثناء البرمجة، "
                "مما يزيد سرعة التطوير بشكل كبير.\n\n"
                "يُستخدم Flutter اليوم من قبل شركات كبرى "
                "لبناء تطبيقات احترافية عالية الأداء، "
                "بسبب سرعته وسهولة تصميم واجهاته ودعم Google المستمر له.",
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
                      "اضغط للحصول على المزيد من المعلومات حول Flutter",
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
