import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/adaptive_layout.dart';
import 'package:maher_law_app/features/about/presentation/layouts/about_mobile_layout.dart';

import '../../../core/helpers/size_config.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/whatsapp_button.dart';
import 'layouts/about_desktop_layout.dart';
import 'layouts/about_tablet_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SizeConfig.isMobile ? const CustomDrawer(selectedIndex: 2) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      body: AdaptiveLayout(
        mobileLayout: (_) => const AboutMobileLayout(),
        tabletLayout: (_) => const AboutTabletLayout(),
        desktopLayout: (_) => const AboutDesktopLayout(),
      ),
    );
  }
}
