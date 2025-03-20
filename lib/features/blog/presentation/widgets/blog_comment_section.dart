import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/blog/presentation/cubits/blog_cubit/blog_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/decorated_button.dart';
import '../cubits/message_cubit/message_cubit.dart';

class BlogCommentSection extends StatelessWidget {
  const BlogCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(),
      child: const BlogCommentSectionBody(),
    );
  }
}

class BlogCommentSectionBody extends StatelessWidget {
  const BlogCommentSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageCubit, MessageState>(
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
        key: context.read<MessageCubit>().formKey,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى كتابة رسالتك';
                  }
                  return null;
                },
                minLines: 4,
                maxLines: 8,
                hintText: 'التعليق',
                textAlign: TextAlign.center,
                controller: context.read<MessageCubit>().content,
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجى كتابة اسمك';
                        }
                        return null;
                      },
                      hintText: 'اسمك',
                      controller: context.read<MessageCubit>().name,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Expanded(
                    child: CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجى كتابة بريدك الالكتروني';
                        }
                        return null;
                      },
                      hintText: 'البريد الالكتروني',
                      controller: context.read<MessageCubit>().email,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              DecoratedButton(
                onTap: () {
                  context.read<MessageCubit>().sendComment(
                        context.read<BlogCubit>().blog,
                      );
                },
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
      ),
    );
  }
}
