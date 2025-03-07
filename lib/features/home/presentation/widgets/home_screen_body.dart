import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/adaptive_layout.dart';

import '../layouts/home_desktop_layout.dart';
import '../layouts/home_mobile_layout.dart';
import '../layouts/home_tablet_layout.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => HomeMobileLayout(),
      tabletLayout: (context) => HomeTabletLayout(),
      desktopLayout: (context) => HomeDesktopLayout(),
    );
  }
}
