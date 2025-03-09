import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/cubit/pagination_cubit.dart';

import '../../../core/helpers/size_config.dart';
import '../../../core/widget/custom_drawer.dart';
import '../../../core/widget/whatsapp_button.dart';
import 'widgets/all_blogs_screen_body.dart';

class AllBlogsScreen extends StatelessWidget {
  const AllBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizeConfig.isMobile ? CustomDrawer(selectedIndex: 3) : null,
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: WhatsappButton(),
      body: BlocProvider(
        create: (context) => PaginationCubit()..loadFirstPage(),
        child: AllBlogsScreenBody(),
      ),
    );
  }
}
