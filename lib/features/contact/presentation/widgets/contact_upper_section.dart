import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../home/presentation/cubit/data_cubit.dart';
import 'contact_widget.dart';

class ContactUpperSection extends StatelessWidget {
  const ContactUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> items = [
      ContactModel(
        title: 'الواتس',
        data: context.read<DataCubit>().phone.replaceFirst(RegExp(r'2'), ''),
        svg: AppIcons.whatsapp,
      ),
      ContactModel(
        title: 'الدعم',
        data: context.read<DataCubit>().email,
        svg: AppIcons.email,
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.w,
      children: List.generate(
        items.length,
        (index) => ContactWidget(
          item: items[index],
        ),
      ),
    );
  }
}

class ContactMobileUpperSection extends StatelessWidget {
  const ContactMobileUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> items = [
      ContactModel(
        title: 'الواتس',
        data: context.read<DataCubit>().phone.replaceFirst(RegExp(r'2'), ''),
        svg: AppIcons.whatsapp,
      ),
      ContactModel(
        title: 'الدعم',
        data: context.read<DataCubit>().email,
        svg: AppIcons.email,
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 2.3.h,
      children: List.generate(
        items.length,
        (index) => ContactMobileWidget(item: items[index]),
      ),
    );
  }
}
