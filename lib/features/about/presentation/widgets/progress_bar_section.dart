import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_progress_bar_widget.dart';

class ProgressBarDesktopSection extends StatelessWidget {
  const ProgressBarDesktopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomProgressBarWidget(
          text: 'السرية',
          colorTheme: ProgressBarColorTheme.orange,
        ),
        CustomProgressBarWidget(
          text: 'الثقة',
          colorTheme: ProgressBarColorTheme.cyan,
        ),
        CustomProgressBarWidget(
          text: 'الشفافية',
          colorTheme: ProgressBarColorTheme.purple,
        ),
      ],
    );
  }
}

class ProgressBarMobileSection extends StatelessWidget {
  const ProgressBarMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomProgressBarWidget(
          text: 'السرية',
          colorTheme: ProgressBarColorTheme.orange,
        ),
        CustomProgressBarWidget(
          text: 'الثقة',
          colorTheme: ProgressBarColorTheme.cyan,
        ),
        CustomProgressBarWidget(
          text: 'الشفافية',
          colorTheme: ProgressBarColorTheme.purple,
        ),
      ],
    );
  }
}
