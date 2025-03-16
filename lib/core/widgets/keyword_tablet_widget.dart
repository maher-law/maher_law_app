import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/models/keyword_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class KeyworkTabletWidget extends StatelessWidget {
  const KeyworkTabletWidget({super.key, required this.keyword});
  final Keyword keyword;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(keyword.link);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Text(
          keyword.title,
          textAlign: TextAlign.center,
          style: SizeConfig.isTablet
              ? AppStyles.style22medium(context).copyWith(
                  color: AppColors.grey,
                )
              : AppStyles.style16medium(context).copyWith(
                  color: AppColors.grey,
                ),
        ),
      ),
    );
  }
}
