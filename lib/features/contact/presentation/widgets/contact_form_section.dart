import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/features/services/presentation/widgets/decorated_button.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../contact_screen.dart';

class ContactFormSection extends StatelessWidget {
  const ContactFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.read<ContactState>() == ContactState.contact)
            Text(
              'تواصل بالوسيط القانوني',
              style: AppStyles.style26bold(context),
            ),
          if (context.read<ContactState>() == ContactState.consultation)
            Text(
              'هل تحتاج الى استشارة؟',
              style: AppStyles.style26bold(context).copyWith(
                color: AppColors.orange,
              ),
            ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: 'اسمك',
            controller: TextEditingController(),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: 'البريد الالكتروني',
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
