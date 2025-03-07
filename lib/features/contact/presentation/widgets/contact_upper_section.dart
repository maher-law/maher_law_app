import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'contact_widget.dart';

class ContactUpperSection extends StatelessWidget {
  const ContactUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => ContactWidget(),
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
        3,
        (index) => ContactMobileWidget(),
      ),
    );
  }
}
