import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:maher_law_app/core/app_constants.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';

import 'contact_widget.dart';

List<ContactModel> items = [
  ContactModel(
    title: 'الواتس',
    data: AppConstants.whatsappNumber,
    svg: AppIcons.whatsapp,
  ),
  ContactModel(
    title: 'الدعم',
    data: AppConstants.email,
    svg: AppIcons.email,
  ),
];

class ContactUpperSection extends StatelessWidget {
  const ContactUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
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
