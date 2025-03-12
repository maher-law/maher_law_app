import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../services/presentation/widgets/decorated_button.dart';

class BlogCommentSection extends StatelessWidget {
  const BlogCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: SizeConfig.isDesktop ? 45.w : 100.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.green, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اترك تعليقًا',
              style: AppStyles.style26bold(context).copyWith(
                color: AppColors.orange,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'لن يتم نشر عنوان بريدك الإلكتروني أو اسمك.',
              style: AppStyles.style16medium(context).copyWith(
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              minLines: 4,
              maxLines: 8,
              hintText: 'التعليق',
              textAlign: TextAlign.center,
              controller: TextEditingController(),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'اسمك',
                    controller: TextEditingController(),
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: CustomTextField(
                    hintText: 'البريد الالكتروني',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            DecoratedButton(
              onTap: () {},
              child: Text(
                'ارسال تعليقك',
                style: AppStyles.style16bold(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
