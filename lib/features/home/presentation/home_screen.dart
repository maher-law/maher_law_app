import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';

import '../../../core/widgets/whatsapp_button.dart';
import '../../all_blogs/presentation/cubits/pagination_cubit/pagination_cubit.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الوسيط القانوني',
          style: AppStyles.style24bold(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PaginationCubit()..loadFirstPage()),
        ],
        child: const HomeScreenBody(),
      ),
    );
  }
}
