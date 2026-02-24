import 'package:flutter/material.dart';
import 'package:dev_nexus/core/widgets/df_top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class CSharpPage extends StatelessWidget {
  const CSharpPage({super.key});

  Future<void> _openLink() async {
    final Uri url =
        Uri.parse("https://learn.microsoft.com/en-us/dotnet/csharp/");
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
                  "لغة البرمجة C#",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "لغة البرمجة C# (سي شارب) هي لغة قوية وحديثة تم تطويرها بواسطة شركة Microsoft "
                  "ضمن منصة .NET، وظهرت لأول مرة في بدايات الألفينات. "
                  "تم تصميمها لتكون لغة آمنة ومنظمة وسهلة التطوير للمشاريع الكبيرة.\n\n"
                  "تُستخدم C# في تطوير تطبيقات سطح المكتب على ويندوز، "
                  "وتطوير تطبيقات الويب عبر ASP.NET، "
                  "كما تُستخدم بشكل واسع في تطوير الألعاب باستخدام محرك Unity "
                  "حيث تعتبر من أشهر اللغات في مجال الألعاب.\n\n"
                  "C# هي لغة كائنية التوجه (OOP) وتدعم مفاهيم مهمة مثل الوراثة "
                  "والتغليف وتعدد الأشكال، كما تدعم البرمجة غير المتزامنة (Async/Await) "
                  "مما يسهل بناء تطبيقات سريعة ومتجاوبة.\n\n"
                  "من مميزاتها: قوة الأدوات مثل Visual Studio، "
                  "والمكتبات الضخمة في .NET، "
                  "والتكامل الممتاز مع خدمات Microsoft. "
                  "أما من ناحية السوق، فهي مطلوبة في كثير من الشركات "
                  "خصوصًا التي تعتمد على تقنيات Microsoft.\n\n"
                  "بشكل عام، C# خيار ممتاز لمن يريد بناء تطبيقات شركات، "
                  "أو تطبيقات ويب احترافية، أو دخول مجال تطوير الألعاب عبر Unity.",
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
                        "اضغط للحصول على المزيد من المعلومات حول C#",
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
