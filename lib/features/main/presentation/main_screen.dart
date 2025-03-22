import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maher_law_app/core/app_constants.dart';
import 'package:maher_law_app/core/helpers/extensions/app_navigator.dart';
import 'package:maher_law_app/core/helpers/functions.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:maher_law_app/features/about/presentation/about_screen.dart';
import 'package:maher_law_app/features/blogs/presentation/blogs_screen.dart';
import 'package:maher_law_app/features/main/data/models/app_section.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/whatsapp_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppSection> sections = [
      AppSection(
        title: 'من نحن وخدماتنا',
        icon: AppIcons.balance,
        screen: const AboutScreen(),
      ),
      AppSection(
        title: 'نماذج عقود',
        icon: AppIcons.certificate,
        screen: const BlogsScreen(blogs: false),
      ),
      AppSection(
        title: 'مقالات',
        icon: AppIcons.lawBook,
        screen: const BlogsScreen(blogs: true),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الوسيط القانوني',
          style: AppStyles.style24bold(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 2.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                sections.length,
                (index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      context.push(
                        sections[index].screen,
                        direction: NavigationDirection.upToDown,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                        vertical: 2.h,
                      ),
                      width: 100.w * .8,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(sections[index].icon, width: 14.w),
                          SizedBox(height: 2.h),
                          Text(
                            sections[index].title,
                            style: AppStyles.style22bold(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'للاستشارات القانونية',
                      style: AppStyles.style22bold(context),
                    ),
                    const Spacer(),
                    const SocialButton(),
                    SizedBox(width: 2.w),
                    SocialButton(
                      icon: AppIcons.email,
                      onTap: () {
                        pushToCustom(
                          context,
                          url: 'mailto:${AppConstants.email}',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
