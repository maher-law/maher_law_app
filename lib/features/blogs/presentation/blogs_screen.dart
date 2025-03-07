import 'package:flutter/material.dart';

import '../../../core/helpers/size_config.dart';
import '../../../core/widget/custom_drawer.dart';
import '../../../core/widget/whatsapp_button.dart';
import 'widgets/blogs_screen_body.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizeConfig.isMobile ? CustomDrawer(selectedIndex: 3) : null,
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: WhatsappButton(),
      body: BlogsScreenBody(),
    );
  }
}
