import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/features/contact/presentation/contact_cubit/contact_cubit.dart';
import 'package:maher_law_app/features/services/presentation/widgets/decorated_button.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../blog/presentation/cubits/message_cubit/message_cubit.dart';
import '../contact_screen.dart';

class ContactFormSection extends StatelessWidget {
  const ContactFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is MessageSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.green,
              content: Center(
                child: Text(
                  'شكرًا لك على تعليقك',
                  style: AppStyles.style16bold(context),
                ),
              ),
            ),
          );
        }
      },
      child: Form(
        key: BlocProvider.of<ContactUsCubit>(context).formKey,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يرجى كتابة رسالتك';
                }
                return null;
              },
              hintText: 'اسمك',
              controller: BlocProvider.of<ContactUsCubit>(context).name,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يرجى كتابة رسالتك';
                }
                return null;
              },
              hintText: 'البريد الالكتروني',
              controller: BlocProvider.of<ContactUsCubit>(context).email,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: 'الموضوع (اختياري)',
              controller: BlocProvider.of<ContactUsCubit>(context).subject,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'يرجى كتابة رسالتك';
                }
                return null;
              },
              minLines: 4,
              maxLines: 8,
              hintText: 'رسالتك',
              controller: BlocProvider.of<ContactUsCubit>(context).content,
            ),
            SizedBox(height: 2.h),
            DecoratedButton(
              onTap: () {
                BlocProvider.of<ContactUsCubit>(context).sendMessage();
              },
              child: Text(
                'ارسال الرسالة',
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
