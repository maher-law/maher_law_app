import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/widget/hover_button.dart';

class BlogTagWidget extends StatelessWidget {
  const BlogTagWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.05,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: .8.w, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500),
        ),
        child: Text(
          'استثمار',
          style: AppStyles.style14medium(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
