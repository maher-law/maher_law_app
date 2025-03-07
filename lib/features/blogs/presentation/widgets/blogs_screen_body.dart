import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/adaptive_layout.dart';

import '../layouts/blogs_desktop_layout.dart';
import '../layouts/blogs_mobile_layout.dart';
import '../layouts/blogs_tablet_layout.dart';

class BlogsScreenBody extends StatelessWidget {
  const BlogsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => BlogsMobileLayout(),
      tabletLayout: (context) => BlogsTabletLayout(),
      desktopLayout: (context) => BlogsDesktopLayout(),
    );
  }
}
