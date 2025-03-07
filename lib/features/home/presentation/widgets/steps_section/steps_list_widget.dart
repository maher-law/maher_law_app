import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/models/step_model.dart';
import 'step_widget.dart';

class StepsListWidget extends StatelessWidget {
  const StepsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<StepModel> steps = [
      StepModel(
        title: 'الاستشارة',
        description: 'النصح والتوجيه القانوني توضيح النقاط القانونية الخاصة',
      ),
      StepModel(
        title: 'توقيع عقد',
        description: 'عقد الاتفاق على مباشرة العقد والبحث في جميع جوانبه',
      ),
      StepModel(
        title: 'تحديد المسار',
        description:
            'الأفضل للعميل في موقفه القانوني والاقتصادى بالعقد التكنولوجى',
      ),
      StepModel(
        title: 'تسليم العقد',
        description:
            'إعداد وصياغة درافت العقد ثم النسخة النهائية بعد التعديلات اللازمة',
      ),
    ];
    if (SizeConfig.width < SizeConfig.mobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          spacing: 30,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: StepMobileWidget(index: index + 1, step: steps[index]),
            );
          }),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width > SizeConfig.tablet ? 10.w : 3.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(4, (index) {
          return Expanded(
            child: StepWidget(
              index: index + 1,
              step: steps[index],
              isFirst: index == 0,
              isLast: index == 3,
            ),
          );
        }),
      ),
    );
  }
}
