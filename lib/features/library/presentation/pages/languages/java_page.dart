import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class JavaPage extends StatelessWidget {
  const JavaPage({super.key});

  Future<void> _openLink() async {
    final Uri url = Uri.parse("https://www.oracle.com/java/");
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
                  "لغة البرمجة Java",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "تُعد لغة البرمجة Java واحدة من أشهر وأقوى لغات البرمجة في العالم، "
                  "وتُستخدم على نطاق واسع في الشركات والأنظمة الكبيرة بسبب استقرارها وقوة بنيتها. "
                  "تم تطويرها في شركة Sun Microsystems عام 1995 على يد المهندس جيمس جوسلينج، "
                  "وكان الهدف الأساسي منها إنشاء لغة آمنة وقابلة للعمل على مختلف أنظمة التشغيل دون تعديل الكود.\n\n"
                  "تعتمد جافا على مفهوم (JVM) أو آلة جافا الافتراضية، "
                  "حيث يتم تحويل الكود إلى Bytecode ثم تشغيله داخل JVM، "
                  "وهذا ما يجعلها تحقق فكرة (اكتب مرة واحدة وشغّل في أي مكان) "
                  "(Write Once, Run Anywhere). هذا الأمر جعلها خيارًا قويًا لتطبيقات المؤسسات "
                  "والخوادم والأنظمة البنكية والتجارية.\n\n"
                  "تُستخدم Java في تطوير تطبيقات الويب (Back-End) باستخدام تقنيات وأطر شهيرة مثل "
                  "Spring وSpring Boot، كما تُستخدم في تطوير تطبيقات سطح المكتب، "
                  "وأدوات الشركات، وأنظمة إدارة المخزون، وأنظمة الدفع. "
                  "وكانت أيضًا اللغة الأساسية لتطوير تطبيقات Android لسنوات طويلة، "
                  "ولا تزال تُستخدم حتى اليوم بجانب Kotlin.\n\n"
                  "من أهم مميزات جافا: الأمان العالي، وانتشارها الكبير، وتوفر مكتبات ضخمة، "
                  "وإدارة تلقائية للذاكرة عبر Garbage Collection، "
                  "ودعم قوي للبرمجة متعددة الخيوط (Multithreading) "
                  "مما يجعلها مناسبة للبرامج الثقيلة والأنظمة التي تعمل لفترات طويلة.\n\n"
                  "أما من ناحية التحديات، فقد يكون الكود أطول مقارنة ببعض اللغات الحديثة، "
                  "وقد تستهلك موارد أكثر في بعض الحالات، "
                  "لكنها بالمقابل تمنحك استقرارًا عاليًا وأداءً ممتازًا في المشاريع الكبيرة. "
                  "كما أن لغة Java تتطور باستمرار عبر إصدارات حديثة مثل Java 11 وJava 17 وJava 21 "
                  "والتي تقدم تحسينات في الأداء وتبسيط كتابة الكود.\n\n"
                  "بشكل عام، Java تُعتبر خيارًا ممتازًا لمن يريد تعلم لغة قوية لبناء تطبيقات واقعية "
                  "في سوق العمل، خصوصًا في مجالات الأنظمة المؤسسية (Enterprise Systems)، "
                  "وتطبيقات الويب الخلفية (Back-End)، وتطبيقات Android، "
                  "وهي من أكثر اللغات المطلوبة عالميًا بسبب اعتمادها الكبير داخل الشركات.",
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
                        "اضغط للحصول على المزيد من المعلومات حول لغة Java",
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
