import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/contact/presentation/contact_cubit/contact_cubit.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/adaptive_layout.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/whatsapp_button.dart';
import 'layouts/contact_desktop_layout.dart';
import 'layouts/contact_mobile_layout.dart';
import 'layouts/contact_tablet_layout.dart';

enum ContactState { contact, consultation }

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.contactState});
  final ContactState contactState;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: contactState,
      child: BlocProvider(
        create: (context) => ContactUsCubit(),
        child: Scaffold(
          drawer: const CustomDrawer(selectedIndex: 4),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: const WhatsappButton(),
          resizeToAvoidBottomInset: false,
          body: AdaptiveLayout(
            mobileLayout: (_) => const ContactMobileLayout(),
            tabletLayout: (_) => const ContactTabletLayout(),
            desktopLayout: (_) => const ContactDesktopLayout(),
          ),
        ),
      ),
    );
  }
}
