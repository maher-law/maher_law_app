import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class ContactModel {
  final String title, data;
  final String? svg;
  final IconData? icon;

  ContactModel({
    required this.title,
    required this.data,
    this.icon,
    this.svg,
  });
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, required this.item});
  final ContactModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
              colors: [
                AppColors.orange,
                AppColors.green,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: item.icon != null
              ? Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30,
                )
              : SvgPicture.asset(
                  item.svg!,
                  width: 3.w,
                ),
        ),
        SizedBox(width: 1.5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppStyles.style18bold(context).copyWith(
                color: AppColors.green,
              ),
            ),
            SizedBox(height: .8.h),
            Text(
              item.data,
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
  const ContactMobileWidget({super.key, required this.item});
  final ContactModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1.3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
              colors: [
                AppColors.orange,
                AppColors.green,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: item.icon != null
              ? Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30,
                )
              : SvgPicture.asset(
                  item.svg!,
                  width: 8.w,
                ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppStyles.style22bold(context).copyWith(
                color: AppColors.green,
              ),
            ),
            SizedBox(height: .8.h),
            Text(
              item.data,
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
