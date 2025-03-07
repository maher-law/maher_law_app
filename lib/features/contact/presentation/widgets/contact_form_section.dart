import 'package:flutter/material.dart';
import 'package:maher_law_app/features/services/presentation/widgets/decorated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/widget/custom_text_field.dart';

class ContactFormSection extends StatelessWidget {
  const ContactFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('تواصل بالوسيط القانوني', style: AppStyles.style26bold(context)),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: 'اسمك',
            controller: TextEditingController(),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: 'بريد الالكتروني',
            controller: TextEditingController(),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: 'الموضوع',
            controller: TextEditingController(),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            minLines: 4,
            maxLines: 8,
            hintText: 'رسالتك',
            controller: TextEditingController(),
          ),
          SizedBox(height: 2.h),
          DecoratedButton(
            onTap: () {},
            child: Text(
              'ارسال الرسالة',
              style: AppStyles.style16bold(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
