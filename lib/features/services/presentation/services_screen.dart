import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/adaptive_layout.dart';
import 'package:maher_law_app/core/widgets/whatsapp_button.dart';
import 'package:maher_law_app/features/services/presentation/layouts/services_mobile_layout.dart';

import '../../../core/widgets/custom_drawer.dart';
import 'layouts/services_desktop_layout.dart';
import 'layouts/services_tablet_layout.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(selectedIndex: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      resizeToAvoidBottomInset: false,
      body: AdaptiveLayout(
        mobileLayout: (_) => const ServicesMobileLayout(),
        tabletLayout: (_) => const ServicesTabletLayout(),
        desktopLayout: (_) => const ServicesDesktopLayout(),
      ),
    );
  }
}
