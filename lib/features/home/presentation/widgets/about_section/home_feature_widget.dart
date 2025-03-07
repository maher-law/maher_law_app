import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widget/hover_button.dart';

class AboutFeatureWidget extends StatefulWidget {
  const AboutFeatureWidget({super.key, required this.text});

  final String text;

  @override
  State<AboutFeatureWidget> createState() => _AboutFeatureWidgetState();
}

class _AboutFeatureWidgetState extends State<AboutFeatureWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return HoverButton(
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
      endScale: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isActive ? 35 : 30,
            height: isActive ? 35 : 30,
            decoration: BoxDecoration(
              color: isActive ? AppColors.green : AppColors.orange,
              shape: BoxShape.rectangle,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style16bold(context).copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
