import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    String bio =
        '''في إحدى اللحظات الفارقة، جمع القدر بين الدكتور إسلام الكيلاني، المحامي المتمرس ذو الخبرة العريقة في القانون، والدكتور عبدالرحمن سمير، المستشار القانوني والتسويقي الرائد في مجال الاقتصاد الإبداعي. كانت رؤيتهما مشتركة منذ البداية: تقديم خدمات قانونية مبتكرة تسد الفجوة بين تعقيدات القوانين واحتياجات رواد الأعمال والشركات الناشئة.

مع خلفية متينة في القانون التقليدي، أدرك الدكتور إسلام الحاجة إلى نهج جديد يُبسّط عملية الحصول على الخدمات القانونية ويجعلها أكثر سهولة وشفافية. وفي الوقت ذاته، كان الدكتور عبدالرحمن يستكشف إمكانيات الاقتصاد الإبداعي وتطبيقاته في تقديم الحلول القانونية بطريقة تتماشى مع روح العصر.

تحت هذه الرؤية المشتركة، ولدت منصة "الوكيل القانوني" كأول متجر قانوني رقمي في العالم العربي. اليوم، نتخصص في تقديم خدمات قانونية متطورة تركز على العقود التكنولوجية، مثل عقود تطوير البرمجيات، عقود الاستشارات التكنولوجية، وعقود الدعم الفني. بفضل خبراتنا المشتركة، نضمن صياغة عقود دقيقة تحمي حقوق عملائنا وتعزز نجاحهم في السوق الرقمي سريع التطور.''';
    return Column(
      children: [
        Text(
          'من نحن',
          style: AppStyles.style22medium(
            context,
          ).copyWith(color: Colors.grey.shade600),
        ),
        SizedBox(height: 1.h),
        Text(
          'قصة الوسيط القانوني',
          style: AppStyles.style26bold(
            context,
          ).copyWith(color: AppColors.green),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.isDesktop ? 20.w : 8.w,
          ),
          child: Text(
            bio,
            textAlign: TextAlign.center,
            style: AppStyles.style16bold(
              context,
            ).copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
