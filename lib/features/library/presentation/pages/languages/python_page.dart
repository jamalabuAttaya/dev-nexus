import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class PythonPage extends StatelessWidget {
  const PythonPage({super.key});

  Future<void> _openLink() async {
    final Uri url = Uri.parse("https://www.python.org/");
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
                  "لغة البرمجة Python",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "تُعد لغة البرمجة Python واحدة من أكثر لغات البرمجة انتشارًا وسهولة في العالم، "
                  "وقد تم تطويرها عام 1991 على يد المبرمج الهولندي Guido van Rossum. "
                  "تم تصميم Python لتكون لغة بسيطة وواضحة وسهلة القراءة، "
                  "مما جعلها خيارًا ممتازًا للمبتدئين، وفي نفس الوقت قوية للمشاريع الكبيرة.\n\n"
                  "تتميز Python ببنية نحوية قريبة من اللغة الإنجليزية، "
                  "وهذا يساعد على كتابة الكود بسرعة وفهمه بسهولة، "
                  "كما أنها تمتلك مجتمعًا ضخمًا ومكتبات كثيرة جدًا تغطي أغلب المجالات.\n\n"
                  "تُستخدم Python في تطوير تطبيقات الويب باستخدام أطر مثل Django وFlask، "
                  "كما تُستخدم بشكل قوي في تحليل البيانات وعلوم البيانات "
                  "عبر مكتبات مثل Pandas وNumPy. "
                  "وفي مجال الذكاء الاصطناعي وتعلم الآلة تُعتبر Python من أهم اللغات "
                  "بفضل مكتبات مثل TensorFlow وPyTorch.\n\n"
                  "من استخداماتها أيضًا: الأتمتة (Automation) وكتابة سكربتات تسهل الأعمال اليومية، "
                  "والأمن السيبراني، وبرمجة أدوات الاختبار، وحتى تطوير الألعاب البسيطة.\n\n"
                  "من أهم مميزاتها: سهولة التعلم، سرعة التطوير، مكتبات ضخمة، "
                  "وقابلية استخدامها في مجالات متعددة. "
                  "أما من التحديات فقد يكون أداؤها أبطأ من لغات مثل C++ في بعض الحالات، "
                  "لكنها تعوض ذلك بسرعة التطوير وسهولة الصيانة.\n\n"
                  "بشكل عام، Python تُعتبر خيارًا ممتازًا لأي شخص يريد دخول عالم البرمجة، "
                  "خصوصًا في مجالات الويب والبيانات والذكاء الاصطناعي، "
                  "وهي اليوم من أكثر اللغات المطلوبة في سوق العمل عالميًا.",
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
                        "اضغط للحصول على المزيد من المعلومات حول Python",
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
