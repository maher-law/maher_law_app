import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/adaptive_layout.dart';

import '../layouts/blog_mobile_layout.dart';
import '../layouts/blog_tablet_layout.dart';

class BlogScreenBody extends StatelessWidget {
  const BlogScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const BlogMobileLayout(),
      tabletLayout: (context) => const BlogTabletLayout(),
      desktopLayout: (context) => const BlogTabletLayout(),
    );
  }
}
