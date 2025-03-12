import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../data/models/step_model.dart';
import 'step_number_widget.dart';

class StepWidget extends StatefulWidget {
  const StepWidget({
    super.key,
    required this.step,
    required this.index,
    this.isFirst = false,
    this.isLast = false,
  });
  final int index;
  final StepModel step;
  final bool isFirst, isLast;

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child:
                  !widget.isFirst ? const Divider(color: AppColors.cyan) : const SizedBox(),
            ),
            StepNumberWidget(
              index: widget.index,
              color: isActive ? AppColors.green : null,
            ),
            Expanded(
              child:
                  !widget.isLast ? const Divider(color: AppColors.cyan) : const SizedBox(),
            ),
          ],
        ),
        SizedBox(height: 4.h, child: const VerticalDivider(color: AppColors.cyan)),
        HoverButton(
          onHoverStart: () {
            setState(() {
              isActive = true;
            });
          },
          onHoverEnd: () {
            setState(() {
              isActive = false;
            });
          },
          endScale: 1.05,
          child: Container(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 6.h,
              top: 3.h,
            ),
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.step.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.style22black(
                    context,
                  ).copyWith(color: AppColors.green),
                ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.green,
                  size: 35,
                  weight: 6,
                ),
                const SizedBox(height: 14),
                Text(
                  widget.step.description,
                  textAlign: TextAlign.center,
                  style: AppStyles.style16bold(
                    context,
                  ).copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StepMobileWidget extends StatelessWidget {
  const StepMobileWidget({super.key, required this.step, required this.index});
  final int index;
  final StepModel step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StepNumberWidget(index: index, size: 14.w),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(right: 10, left: 10, bottom: 4.h, top: 2.h),
          // margin: EdgeInsets.symmetric(horizontal: 2.w),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                step.title,
                textAlign: TextAlign.center,
                style: AppStyles.style22black(
                  context,
                ).copyWith(color: AppColors.green),
              ),
              const SizedBox(height: 14),
              Text(
                step.description,
                textAlign: TextAlign.center,
                style: AppStyles.style16bold(
                  context,
                ).copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
