import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_images.dart';
import 'package:maher_law_app/features/home/presentation/widgets/steps_section/home_steps_section_body.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeStepsSection extends StatelessWidget {
  const HomeStepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
      width: SizeConfig.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(color: Colors.black45, spreadRadius: 1, blurRadius: 30),
        ],
      ),
      // height: 90.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              AppImages.court,
              width: SizeConfig.width,
              height: 90.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(40),
            ),
            width: SizeConfig.width,
            height: 90.h,
            child: HomeStepsSectionBody(),
          ),
        ],
      ),
    );
  }
}

class HomeMobileStepsSection extends StatelessWidget {
  const HomeMobileStepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
      width: SizeConfig.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(AppImages.court),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black45, spreadRadius: 1, blurRadius: 30),
        ],
      ),
      child: HomeStepsSectionBody(),
    );
  }
}
