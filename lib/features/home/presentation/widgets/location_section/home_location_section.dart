import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/core/widget/google_maps_widget.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeLocationSection extends StatelessWidget {
  const HomeLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoverButton(
          endScale: 1.02,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: SizeConfig.isMobile ? 1.h : .4.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 3.w,
                ),
                SizedBox(width: 1.w),
                Text(
                  'فروعنا في مصر',
                  style: AppStyles.style18bold(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 50.h,
          width: SizeConfig.width * .75,
          child: GoogleMapWidget(),
        ),
      ],
    );
  }
}
