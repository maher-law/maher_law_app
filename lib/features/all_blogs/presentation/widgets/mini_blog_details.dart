import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:maher_law_app/core/widget/hover_text_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../services/presentation/widgets/decorated_button.dart';

class MiniBlogDetails extends StatelessWidget {
  const MiniBlogDetails({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أبريل ٢٥, ٢٠٢٤',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.style14medium(context),
        ),
        HoverTextButton(
          onPressed: () {
            context.go('${AppRouter.blogs}/${blog.slug}', extra: blog);
          },
          withBorder: false,
          // text: 'عقد الفرنشايز فى المملكة العربية السعودية',
          text: blog.title,
          activeColor: AppColors.orange,
          style: AppStyles.style24bold(context),
        ),
        Text(
          '''هو عقد يمنح بموجبه مالك الامتياز صاحب (العلامة التجارية) المانح الحق في تشغيل مشروع تجاري، أو عرض، أو بيع، أو توزيع السلع، أو الخدمات المحددة المرتبطة بالعلامة التجارية الممنوح له الامتياز.
    في المقابل، يقوم المستفيد من الامتياز بسداد رسوم دفعات لمرة واحدة أو دورية إلى صاحب الامتياز طبقا للشروط والأحكام المنصوص عليها في  اتفاقية الامتياز''',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.style16medium(context).copyWith(
            color: AppColors.grey.withAlpha(200),
          ),
        ),
        SizedBox(height: 0),
        DecoratedButton(
          onTap: () {
            context.go('${AppRouter.blogs}/${blog.slug}', extra: blog);
          },
          padding: EdgeInsets.symmetric(horizontal: 1.4.w, vertical: 1.h),
          child: Text(
            'اقرأ أكثر',
            style: AppStyles.style16medium(context).copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
