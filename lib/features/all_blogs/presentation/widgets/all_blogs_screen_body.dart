import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/adaptive_layout.dart';

import '../layouts/all_blogs_desktop_layout.dart';
import '../layouts/all_blogs_mobile_layout.dart';
import '../layouts/all_blogs_tablet_layout.dart';

class AllBlogsScreenBody extends StatelessWidget {
  const AllBlogsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const AllBlogsMobileLayout(),
      tabletLayout: (context) => const AllBlogsTabletLayout(),
      desktopLayout: (context) => const AllBlogsDesktopLayout(),
    );
  }
}
