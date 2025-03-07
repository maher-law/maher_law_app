import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                AppColors.orange,
                AppColors.green,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Icon(
            Icons.mail_outline,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(width: 1.5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الدعم',
              style: AppStyles.style18bold(context).copyWith(
                color: AppColors.green,
              ),
            ),
            SizedBox(height: .8.h),
            Text(
              'examble@gmail.com',
              style: AppStyles.style16medium(context).copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ContactMobileWidget extends StatelessWidget {
  const ContactMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1.3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                AppColors.orange,
                AppColors.green,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Icon(
            Icons.mail_outline,
            color: Colors.white,
            size: 40,
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الدعم',
              style: AppStyles.style22bold(context).copyWith(
                color: AppColors.green,
              ),
            ),
            SizedBox(height: .8.h),
            Text(
              'examble@gmail.com',
              style: AppStyles.style18medium(context).copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
