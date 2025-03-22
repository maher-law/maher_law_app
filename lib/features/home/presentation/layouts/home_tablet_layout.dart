import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_styles.dart';
import '../widgets/blogs_list_view.dart';
import 'home_mobile_layout.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AboutSliverSection(),
        SliverToBoxAdapter(
          child: Text(
            'نماذج العقود ومقالاتنا',
            textAlign: TextAlign.center,
            style: AppStyles.style30bold(context).copyWith(
              color: Colors.black,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          sliver: const BlogsListView(),
        ),
        const ServicesSliverSection(),
      ],
    );
  }
}
