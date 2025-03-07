import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_icons.dart';
import '../../../home/data/models/service_model.dart';
import 'service_widget.dart';

class SliverServicesGrid extends StatelessWidget {
  const SliverServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> services = [
      ServiceModel(
        icon: AppIcons.lawBook,
        title: 'المشورة القانونية',
        dsecription:
            'تقديم الاستشارات القانونية للأفراد والشركات والمؤسسات، ونساعد  في فهم القوانين والتشريعات المتعلقة بعقودهم',
      ),
      ServiceModel(
        icon: AppIcons.balance,
        title: 'عقد تقديم خدمات برمجية',
        dsecription:
            'هو عقد يحدد شروط تنفيذ أو تطوير تطبيق أو برنامج معين بين المبرمج والعميل، دون أن يكون للمبرمج ملكية خاصة به',
      ),
      ServiceModel(
        icon: AppIcons.hammer,
        title: 'عقد توريد وترخيص برامج',
        dsecription:
            'هو عقد يسمح للعميل باستخدام برنامج معين مقابل دفع رسوم معينة للمورد. يحدد هذا العقد نطاق ومدة وشروط الاستخدام',
      ),
      ServiceModel(
        icon: AppIcons.certificate,
        title: 'عقد تأجير برنامج',
        dsecription:
            'هو عقد يسمح للعميل باستئجار برنامج معين لفترة محددة مقابل دفع رسوم شهرية أو سنوية للمورد',
      ),
      ServiceModel(
        icon: AppIcons.handshake,
        title: 'عقد تطوير برنامج مخصص',
        dsecription:
            'هو عقد يحدد شروط تنفيذ أو تطوير برنامج مخصص لاحتياجات العميل الفريدة بين المبرمج والعميل. مواصفات وميزانية وجدول زمني ومعايير الجودة والاختبار والتسليم والدعم الفني للبرنامج',
      ),
      ServiceModel(
        icon: AppIcons.handcuffs,
        title: 'عقد تعديل أو تحديث برنامج',
        dsecription:
            'هو عقد يحدد شروط تعديل أو تحديث برنامج موجود بين المبرمج والعميل. يحدد هذا العقد نطاق ونوع وتكلفة ومدة التعديل أو التحديث والحقوق والمسؤوليات المترتبة على الطرفين',
      ),
    ];

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      sliver: SliverToBoxAdapter(
        child: StaggeredGrid.count(
          crossAxisCount:
              SizeConfig.isDesktop
                  ? 3
                  : SizeConfig.isTablet
                  ? 2
                  : 1,
          crossAxisSpacing: 3.w,
          mainAxisSpacing: 4.h,
          children: List.generate(services.length, (index) {
            return ServiceWidget(service: services[index]);
          }),
        ),
      ),
    );
  }
}
