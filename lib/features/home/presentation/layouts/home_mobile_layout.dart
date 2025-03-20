import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../about/presentation/widgets/about_details.dart';
import '../../../about/presentation/widgets/progress_bar_section.dart';
import '../../../all_blogs/presentation/widgets/blogs_list_view.dart';
import '../widgets/services_section/home_services_list_view.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

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
          sliver: const BlogsListView(sliver: true),
        ),
        const ServicesSliverSection(),
      ],
    );
  }
}

class AboutSliverSection extends StatelessWidget {
  const AboutSliverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          SizedBox(height: 2.h),
          const AboutDetails(),
          SizedBox(height: 6.h),
          const ProgressBarMobileSection(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class ServicesSliverSection extends StatelessWidget {
  const ServicesSliverSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          SizedBox(height: 8.h),
          Text(
            'خدماتنا',
            textAlign: TextAlign.center,
            style: AppStyles.style30bold(context).copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2.h),
          const HomeServicesListView(),
          SizedBox(height: 8.h),
          const Footer(),
        ],
      ),
    );
  }
}
