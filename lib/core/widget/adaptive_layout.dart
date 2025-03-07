import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/extensions/screen_details.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.screenWidth < SizeConfig.mobile) {
          return mobileLayout(context);
        } else if (context.screenWidth < SizeConfig.tablet) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
