import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlPage extends StatelessWidget {
  const HtmlPage({super.key});

  Future<void> _openLink() async {
    final Uri url =
        Uri.parse("https://developer.mozilla.org/en-US/docs/Web/HTML");
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6F6),
      appBar: const DfTopNav(currentIndex: 2),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "HTML (لغة ترميز صفحات الويب)",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "HTML هي لغة ترميز (Markup Language) تُستخدم لبناء هيكل صفحات الويب، "
                  "وهي اختصار لـ HyperText Markup Language. "
                  "ظهرت HTML في بدايات الإنترنت على يد تيم بيرنرز لي (Tim Berners-Lee) "
                  "لتكون الأساس الذي تُبنى عليه صفحات الويب.\n\n"
                  "لا تُعتبر HTML لغة برمجة بالمعنى التقليدي لأنها لا تحتوي على منطق أو شروط "
                  "مثل لغات البرمجة، لكنها تحدد مكوّنات الصفحة مثل العناوين والفقرات والصور "
                  "والروابط والجداول والنماذج (Forms).\n\n"
                  "عادةً ما تعمل HTML مع CSS لتنسيق شكل الصفحة (الألوان، الخطوط، الترتيب)، "
                  "ومع JavaScript لإضافة التفاعل والحركة وجعل الصفحة ديناميكية.\n\n"
                  "من أهم التطورات كانت HTML5، حيث أضافت عناصر حديثة مثل دعم الفيديو والصوت "
                  "وعناصر معنوية (Semantic) تساعد محركات البحث وتنظيم الصفحة بشكل أفضل.\n\n"
                  "تعلم HTML هو الخطوة الأولى لأي شخص يريد دخول مجال تطوير الويب، "
                  "لأن كل موقع ويب يبدأ بهيكل HTML ثم يتم تحسينه وإضافة التفاعل عليه.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 30),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _openLink,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1976D2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "اضغط للحصول على المزيد من المعلومات حول HTML",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
