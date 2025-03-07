import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/adaptive_layout.dart';
import 'package:maher_law_app/features/about/presentation/layouts/about_mobile_layout.dart';

import '../../../core/helpers/size_config.dart';
import '../../../core/widget/custom_drawer.dart';
import '../../../core/widget/whatsapp_button.dart';
import 'layouts/about_desktop_layout.dart';
import 'layouts/about_tablet_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SizeConfig.isMobile ? CustomDrawer(selectedIndex: 2) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: WhatsappButton(),
      body: AdaptiveLayout(
        mobileLayout: (_) => AboutMobileLayout(),
        tabletLayout: (_) => AboutTabletLayout(),
        desktopLayout: (_) => AboutDesktopLayout(),
      ),
    );
  }
}
