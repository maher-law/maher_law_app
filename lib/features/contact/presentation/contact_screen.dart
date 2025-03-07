import 'package:flutter/material.dart';

import '../../../core/widget/adaptive_layout.dart';
import '../../../core/widget/custom_drawer.dart';
import '../../../core/widget/whatsapp_button.dart';
import 'layouts/contact_desktop_layout.dart';
import 'layouts/contact_mobile_layout.dart';
import 'layouts/contact_tablet_layout.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(selectedIndex: 4),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: WhatsappButton(),
      resizeToAvoidBottomInset: false,
      body: AdaptiveLayout(
        mobileLayout: (_) => ContactMobileLayout(),
        tabletLayout: (_) => ContactTabletLayout(),
        desktopLayout: (_) => ContactDesktopLayout(),
      ),
    );
  }
}
