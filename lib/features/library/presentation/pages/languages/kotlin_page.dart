import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class KotlinPage extends StatelessWidget {
  const KotlinPage({super.key});

  Future<void> _openLink() async {
    final Uri url = Uri.parse("https://kotlinlang.org/");
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
                  "لغة البرمجة Kotlin",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "تُعد لغة البرمجة Kotlin من أحدث وأقوى لغات البرمجة التي انتشرت بسرعة كبيرة، "
                  "وهي لغة حديثة تم تطويرها بواسطة شركة JetBrains وتم الإعلان عنها رسميًا عام 2011، "
                  "ثم أصبحت في عام 2017 لغة معتمدة رسميًا من Google لتطوير تطبيقات Android بجانب Java.\n\n"
                  "تم تصميم Kotlin لتكون لغة واضحة وسهلة وتقلل من تكرار الكود، "
                  "وتحل كثيرًا من مشاكل Java التقليدية مثل كثرة الأسطر والأخطاء المتعلقة بالقيم الفارغة. "
                  "ومن أهم ميزاتها أنها تتعامل مع مشكلة Null Safety بشكل قوي، "
                  "مما يقلل الأعطال الشائعة في التطبيقات ويجعل الكود أكثر أمانًا واستقرارًا.\n\n"
                  "تتميز Kotlin بأنها متوافقة بالكامل مع Java، "
                  "أي أنك تستطيع استخدام مكتبات Java داخل Kotlin والعكس، "
                  "وهذا جعل انتقال المطورين من Java إلى Kotlin سهل جدًا داخل مشاريع Android. "
                  "كما أنها تعمل على JVM مثل Java، ويمكن استخدامها أيضًا لتطوير تطبيقات الخوادم "
                  "وحتى تطبيقات سطح المكتب.\n\n"
                  "في Android تحديدًا، أصبحت Kotlin مفضلة لدى كثير من المطورين لأنها تجعل كتابة الأكواد أسرع، "
                  "وتدعم ميزات حديثة مثل Coroutines التي تساعد في التعامل مع المهام غير المتزامنة "
                  "(مثل تحميل البيانات من الإنترنت) بطريقة بسيطة ومنظمة مقارنة بالطرق القديمة.\n\n"
                  "ومن أهم استخدامات Kotlin: تطوير تطبيقات Android الحديثة، "
                  "وتطوير Back-End باستخدام Ktor أو Spring، "
                  "كما توجد تقنيات مثل Kotlin Multiplatform التي تتيح مشاركة جزء من الكود "
                  "بين Android و iOS ومشاريع أخرى، وهذا يوفر وقتًا وجهدًا في المشاريع الكبيرة.\n\n"
                  "بالنسبة للمميزات: كود مختصر وواضح، أمان عالي ضد أخطاء Null، "
                  "دعم رسمي قوي من Google في Android، أداء ممتاز على JVM، "
                  "ومجتمع كبير ومكتبات كثيرة. "
                  "أما التحديات فقد تكون قلة الخبرة عند البعض لأن اللغة أحدث من Java، "
                  "لكن تعلمها يعتبر استثمارًا ممتازًا خصوصًا لمجال Android.\n\n"
                  "بشكل عام، Kotlin تُعتبر خيارًا قويًا وحديثًا لأي مطور يريد بناء تطبيقات Android باحتراف، "
                  "وتُستخدم اليوم في كثير من التطبيقات الحقيقية داخل السوق بسبب قوتها وسهولة صيانتها.",
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
                        "اضغط للحصول على المزيد من المعلومات حول لغة Kotlin",
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
