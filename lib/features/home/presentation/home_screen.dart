import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';

import '../../../core/widget/custom_drawer.dart';
import '../../../core/widget/whatsapp_button.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizeConfig.isMobile ? const CustomDrawer(selectedIndex: 0) : null,
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      body: const HomeScreenBody(),
    );
  }
}
