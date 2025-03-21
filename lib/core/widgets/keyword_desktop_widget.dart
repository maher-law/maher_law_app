import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/models/keyword_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import 'hover_button.dart';

class KeyworkDesktopWidget extends StatefulWidget {
  const KeyworkDesktopWidget({super.key, required this.keyword});
  final Keyword keyword;

  @override
  State<KeyworkDesktopWidget> createState() => _KeyworkDesktopWidgetState();
}

class _KeyworkDesktopWidgetState extends State<KeyworkDesktopWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onTap: () {
        context.go(widget.keyword.link);
      },
      endScale: 1.02,
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? AppColors.green : Colors.black12,
          ),
        ),
        child: Text(
          widget.keyword.title,
          textAlign: TextAlign.center,
          style: AppStyles.style14medium(context).copyWith(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
