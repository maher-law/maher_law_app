import 'package:flutter/material.dart';

import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/whatsapp_button.dart';
import '../../home/presentation/layouts/home_mobile_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'من نحن وخدماتنا',
          style: AppStyles.style24bold(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      body: const CustomScrollView(
        slivers: [
          AboutSliverSection(),
          ServicesSliverSection(),
        ],
      ),
    );
  }
}
