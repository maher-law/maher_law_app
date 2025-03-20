import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../../core/widgets/nav_bar/sliver_nav_bar.dart';
import '../widgets/contact_form_section.dart';
import '../widgets/contact_upper_section.dart';

class ContactTabletLayout extends StatelessWidget {
  const ContactTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverTabletNavBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: 6.h),
                const ContactUpperSection(),
                SizedBox(height: 10.h),
                const ContactFormSection(),
                // Row(
                //   children: [
                //     const Expanded(child: ContactFormSection()),
                //     SizedBox(width: 4.w),
                //     Expanded(
                //       child: SizedBox(
                //           height: 60.h, child: const GoogleMapWidget()),
                //     ),
                //   ],
                // ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
