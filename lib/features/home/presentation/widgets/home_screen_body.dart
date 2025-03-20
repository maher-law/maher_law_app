import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/adaptive_layout.dart';

import '../layouts/home_mobile_layout.dart';
import '../layouts/home_tablet_layout.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const HomeMobileLayout(),
      tabletLayout: (context) => const HomeTabletLayout(),
      desktopLayout: (context) => const HomeTabletLayout(),
    );
  }
}
